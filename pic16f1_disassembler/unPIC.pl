#!/usr/bin/perl
#################################################################################
#
# PIC HEX file disassembler by Tamas Rudnai
#
# Based on:
# /*
# * pic14dis.c
# *
# * Disassembler for 14-bit Microchip PIC chips
# * Reads IHX8M-format
# *
# * Timo Rossi <trossi@jyu.fi>, Feb 1995
# *
# */
#
#################################################################################
use Data::Dumper;
use Tie::IxHash;

my $qr_hexbyte = qr/[[:xdigit:]]{2}/;
my $qr_incdef  = qr/^([^[:space:]]+)[[:space:]]+EQU[[:space:]]+([^[:space:]]+)/i;
my $qr_hexdef  = qr/H'([[:xdigit:]]+)'/i;
my $qr_Oxdef  = qr/0x([[:xdigit:]]+)/;
my $qr_hexrngdef  = qr/H'([[:xdigit:]]+)'-H'([[:xdigit:]]+)'/i;


my $bank = 0;
my $hexName = '';      # name of the actual HEX file
my $incName = '';      # name of the actual INC file
my %arch = ();         # here we store all info on architecture
my %prog = ();         # program store
my %ram = ();          # memory labels etc
tie my %incdef, 'Tie::IxHash';       # holds the definitions in the INC file
my %badram = ();
my @insub  = (); # holds the address' of the begin of subs

my %allBanks = (
    0x00 => 'INDF0',
	0x01 => 'INDF1',
    0x02 => 'PCL',
    0x03 => 'STATUS',
    0x04 => 'FSR0L',
	0x05 => 'FSR0H',
	0x06 => 'FSR1L',
	0x07 => 'FSR1H',
	0x08 => 'BSR',
	0x09 => 'WREG',
    0x0A => 'PCLATH',
    0x0B => 'ICON',
);

my $bad = '???';

my %instr_names = (
    0x3fff => {
        0x000b => "brw",
        0x000a => "callw",
        0x64 => "clrwdt",
        0x0 => "nop",
        0x62 => "option",
        0x1 => "reset",
        0x9 => "retfie",
        0x8 => "return",
        0x63 => "sleep"
    },
    0x3ff8 => {
        0x10 => "moviw",
        0x18 => "movwi",
        0x60 => "tris",
    },
    0x3c00 => {
        0x1000 => "bcf",
        0x1400 => "bsf",
        0x1800 => "btfsc",
        0x1c00 => "btfss",
    },
    0x3f00 => {
        0x3e00 => "addlw",
        0x700 => "addwf",
        0x3d00 => "addwfc",
        0x3900 => "andlw",
        0x500 => "andwf",
        0x3700 => "asrf",
        0x900 => "comf",
        0x300 => "decf",
        0x0b00 => "decfsz",
        0x0a00 => "incf",
        0x0f00 => "incfsz",
        0x3800 => "iorlw",
        0x400 => "iorwf",
        0x3500 => "lslf",
        0x3600 => "lsrf",
        0x800 => "movf",
        0x3000 => "movlw",
        0x3400 => "retlw",
        0x0d00 => "rlf",
        0x0c00 => "rrf",
        0x3c00 => "sublw",
        0x200 => "subwf",
        0x3b00 => "subwfb",
        0x0e00 => "swapf",
        0x3a00 => "xorlw",
        0x600 => "xorwf"
    },
    0x3fe0 => {
        0x20 => "movlb"
    },
    0x3ffc => {
        0x100 => "clrw"
    },
    0x3800 => {
        0x2000 => "call",
        0x2800 => "goto"
    },
    0x3e00 => {
        0x3200 => "bra"
    },
    0x3f80 => {
        0x3100 => "addfsr",
        0x180 => "clrf",
        0x3f00 => "moviw",
        0x3180 => "movlp",
        0x80 => "movwf",
        0x3f80 => "movwi"
    }
);
my %instr_param = (
    "addfsr" => {
        bit => [0x0, 0x3f],
        mem => [0x6, 0x1]
    },
    "addlw" => {
        data => [0x0, 0xff]
    },
    "addwf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "addwfc" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "andlw" => {
        data => [0x0, 0xff]
    },
    "andwf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "asrf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "bcf" => {
        mem => [0x0, 0x7f],
        bit => [0x7, 0x7]
    },
    "bra" => {
        addr => [0x0, 0xff]
    },
    "bsf" => {
        mem => [0x0, 0x7f],
        bit => [0x7, 0x7]
    },
    "btfsc" => {
        mem => [0x0, 0x7f],
        bit => [0x7, 0x7]
    },
    "btfss" => {
        mem => [0x0, 0x7f],
        bit => [0x7, 0x7]
    },
    "call" => {
        addr => [0x0, 0x7ff]
    },
    "clrf" => {
        mem => [0x0, 0x7f]
    },
    "comf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "decf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "decfsz" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "goto" => {
        addr => [0x0, 0x7ff]
    },
    "incf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "incfsz" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "iorlw" => {
        data => [0x0, 0xff]
    },
    "iorwf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "lslf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "lsrf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "movf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "moviw" => {
        bit => [0x2, 0x1],
        mem => [0x0, 0x3]
    },
    "moviw" => {
        mem => [0x0, 0x3f],
        bit => [0x6, 0x1]
    },
    "movlb" => {
        data => [0x0, 0x1f]
    },
    "movlp" => {
        data => [0x0, 0x7f]
    },
    "movlw" => {
        data => [0x0, 0xff]
    },
    "movwf" => {
        mem => [0x0, 0x7f]
    },
    "movwi" => {
        fsr => [0x2, 0x1],
        dir => [0x0, 0x3]
    },
    "retlw" => {
        data => [0x0, 0xff]
    },
    "rlf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "rrf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "sublw" => {
        data => [0x0, 0xff]
    },
    "subwf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "subwfb" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "swapf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    },
    "tris" => {
        mem => [0x0, 0x7]
    },
    "xorlw" => {
        data => [0x0, 0xff]
    },
    "xorwf" => {
        mem => [0x0, 0x7f],
        tgt => [0x7, 0x1]
    }
);



use constant (
    # states for loading INC files
    INC_NOTHING     => '-nothing-',
    INC_REGFILES    => 'RegFiles',
    INC_CONFIG      => 'Configuration',
    RAM_DEF         => 'RAM Definition'
);

$tab = '        ';


################################################################################
# 
# loadINC
# -------
#
# Loads INC file into memory
#
################################################################################
sub loadINC {
    ($incName) = @_;

    my $state = INC_NOTHING;

    print STDERR "loading INC file \"$incName\"\n";

    open (IN, "<", $incName) or die "Error: could not open file: $incName ($!)";

    my $bytes = 0;
    my $ln = 0;
    while(<IN>) {
        s/\r//g;
        $ln++;

        if (/^;/) {
            # initialize state just for sure
            #$state = INC_NOTHING  if (/^;-----/oi);
            # ok, that is a register file definition block
            $state = INC_REGFILES if (/^;----- Register Files/oi);
			
			#if (/^;-----(Bank[^-]+)-/oi) {
			#	$state = uc($1);
			#}

            # ok, that is a register file definition block
            $state = INC_CONFIG if (/^;.*Configuration Bits/oi);
            $state = INC_CONFIG if (/^;----- ([^ ]+) Equates/oi);
            $state = RAM_DEF if (/^;.*RAM Definitions/oi);
            
            # now it is a trick against bit definitions
            if (/^;----- ([^ ]+) Bits/oi) {
                $state = uc($1);
            }
            if (/^;----- ([^ ]+) Options/oi) {
                $state = uc("_".$1);
            }
			#print STDERR " ::$state \n";
        }
        elsif ($state eq INC_NOTHING) {
        }
        elsif ($state eq RAM_DEF) {
            if (/$qr_incdef/) {
                my $name = $1;
                my $val = $2;
                if ($val =~ /$qr_hexrngdef/) {
                    $val = hex($1);
                    $val2 = hex($2);
                }
                elsif ($val =~ /$qr_hexdef/) {
                    $val = hex($1);
                    $val2 = $val;
                }
                elsif ($val =~ /$qr_Oxdef/) {
                    $val = hex($1);
                    $val2 = $val;
                }
                if ($name == "__MAXRAM") {
                    $badram{max} = $val;
                } elsif ($name == "__BADRAM") {
                    for ($i = $val; $i <= $val2; $i++) {
                        $badram{$i} = 1;
                    }
                }
            }
        }
        else {
            if (/$qr_incdef/) {
                my $name = $1;
                my $val = $2;
                if ($val =~ /$qr_hexdef/) {
                    $val = hex($1);
                }
                elsif ($val =~ /$qr_Oxdef/) {
                    $val = hex($1);
                }
                $incdef{$state}{$val} = $name;
            }
        }
    } # while <IN>
    close(IN);

    print STDERR " loaded from $ln lines of INC file\n";
}


################################################################################
# 
# loadHEX
# -------
#
# Loads HEX file into memory
#
################################################################################
sub loadHEX {
    ($hexName) = @_;

    print STDERR "loading HEX file \"$hexName\"\n";

    open (IN, "<", $hexName) or die "Error: could not open file: $hexName ($!)";

    my $bytes = 0;
    my $ln = 0;
    my $type = 0; # INHX8M

    $type = 1 if ($hexName =~ /\.HXL$/io); # INHX8S low
    $type = 2 if ($hexName =~ /\.HXH$/io); # INHX8S high
	
	print STDERR "$type\n\n";
    $pcscaler = 0;
    
    while(<IN>) {
        s/\r//g;
        $ln++;
        # disassemble HEX a line in HEX format
        if (/^:($qr_hexbyte)($qr_hexbyte)($qr_hexbyte)(00|01|04)($qr_hexbyte*)($qr_hexbyte)$/o) {
            my $len   = hex($1);
            my $pc    = hex($2.$3);
            my $cmd   = hex($4);
            my $line  = $5;
            my $sum   = hex($6);

            # checksum calculation starts with this
            my $chk = $len + hex($2) + hex($3);

            if ($cmd == 4) {
                $pcscaler=hex($line) * 0x8000;
                next;
            }
            # ok, we do not interested on these lines
            next if ( ($len == 0) or ($cmd != 0) );

            # check some basic stuff
            print STDERR ("Warning: odd address at line: $ln\n") if ($pc & 1);
            print STDERR ("Warning: odd number of bytes at line: $ln\n") if ($len & 1);

            my $words = 0;
            
            # INHX8M (normal HEX files)
            if ($type == 0) {
                # we need PC instead of memory address
                $pc /= 2;
                $pc += $pcscaler;

                # ok, let's see what is in the real stuff?
                while ($line =~ /($qr_hexbyte)($qr_hexbyte)/g) {
                    $words++;
                    # store program in a hash
                    my $code = hex($2.$1);
                    
                    print STDERR ("Warning: probably bad code? $2$1 (at line: $ln)\n") if ($code & 0xC000);

                    $prog{$pc}{code} = $code;
                    # advance program counter
                    $pc++;
                    # continue the checksum calculus
                    $chk += hex($1) + hex($2);
                }
            }
            # INHX8S (half HEX files / low)
            elsif ($type == 1) {
                # ok, let's see what is in the real stuff?
                while ($line =~ /($qr_hexbyte)/g) {
                    $words++;
                    # store program in a hash
                    my $codeL = hex($1);
                    # add the low byte
                    $prog{$pc}{code} += $codeL;
                    
                    print STDERR ("Warning: probably bad code? ".$prog{$pc}{code}." (at line: $ln)\n") if ($prog{$pc}{code} & 0xC000);

                    # advance program counter
                    $pc++;
                    # continue the checksum calculus
                    $chk += hex($1);
                }
            }
            # INHX8S (half HEX files / high)
            elsif ($type == 2) {
                # ok, let's see what is in the real stuff?
                while ($line =~ /($qr_hexbyte)/g) {
                    $words++;
                    # store program in a hash
                    my $codeH = hex($1);
                    # add the high byte
                    $prog{$pc}{code} += $codeH << 8;
                    
                    print STDERR ("Warning: probably bad code? ".$prog{$pc}{code}." (at line: $ln)\n") if ($prog{$pc}{code} & 0xC000);

                    # advance program counter
                    $pc++;
                    # continue the checksum calculus
                    $chk += hex($1);
                }
            }

            # check if there was as many words as described
            if ($words != $len / 2) {
                print STDERR ("Warning: Number of code bytes differs at line: $ln\n")
            }
            # now check if checksum was OK
            if ( ((0x100 - ($chk & 0xFF)) & 0xFF) != $sum ) {
                print STDERR ("Warning: Invalid checksum at line: $ln\n")
            }

            # for statistics only
            $bytes += $words *2;
        }
    }

    close(IN);

    print STDERR "$bytes bytes loaded from $ln lines of HEX file\n";
}


################################################################################
# 
# getRegFile
# ----------
#
# get named operand if available
#
################################################################################
sub getRegFile {
    my ($op, $bank) = @_;

	if ($op != undef){
	#my $bank = $prog{$pc}{bank}{$pc};
    # handle addresses for bank 1
    if ( ($bank >= 1) && (not exists $allBanks{$op}) ) {
        $op ^= ($bank << 7);
    }

    # check if that value is exists in the definition
    if (exists $incdef{+INC_REGFILES}{$op}) {
        $op = $incdef{+INC_REGFILES}{$op};
    }
    elsif (exists $allBanks{$op}) {
        # standard registers
        $op = $allBanks{$op};
    }
    elsif ($badram{$op} == 1) {
        my $name = sprintf("badmem_%02x", $op);
        $equ{$name} = $op;
        $op = $name;
    }
    else {
        my $name = sprintf("mem_%02x", $op);
        $equ{$name} = $op;  
		$op = $name;
    }}

    return $op;
}


################################################################################
# 
# getLabel
# --------
#
# get a label on a given PC
#
################################################################################
sub getLabel {
    my ($pc) = @_;
    # default label
    my $lbl = sprintf("label_%04x", $pc);

    # oh, we have a better name for this address
    if (exists $prog{$pc}{label}) {
        $lbl = $prog{$pc}{label};
    }

    return $lbl;
}


################################################################################
# 
# getBit
# ------
#
# get named operand if available
#
################################################################################
sub getBit {
    my ($op, $bit) = @_;

    # check if that type of operand is exists in the INC definition
    if (exists $incdef{$op}{$bit}) {
        $bit = $incdef{$op}{$bit};
    }

    return $bit;
}


################################################################################
# 
# getTarget
# ---------
#
# get named target ('f' or 'W')
#
################################################################################
sub getTarget {
    my ($pc) = @_;

    return $prog{$pc}{tgt} ? 'f' : 'W';
}


################################################################################
# 
# getData
# -------
#
# get data as a string
#
################################################################################
sub getData {
    my ($pc) = @_;

    return sprintf("0x%02x", $prog{$pc}{data});
}

################################################################################
# 
# getData
# -------
#
# get data as a string
#
################################################################################
sub getDir {
    my ($dir) = @_;
    my $res = "";
    if ($dir & 0x2 == 0x2) {
        $res = "-";
    }
    $dir = $dir & 0x1;
    
    return sprintf("[%s%d]", $res,$dir);
}


################################################################################
# 
# getBank
# -------
#
# get bank status for the given PC
#
################################################################################
sub getBank {
    my ($pc) = @_;
    # pick up the default bank status
my $fbank = -1;
    foreach my $bnk (values %{$prog{$pc}{bank}}) {
		if ($fbank == -1) {
			$fbank = $bnk;
		}
        if ( ($bank) and ($fbank != $bnk) )
        {
            # you can place your handler here to resolve the conflict
            #printf STDERR ("Warning: Bank conflict at 0x%03x %d %d %d\n",$pc,$bnk,$fbank,$bank);
        }
        # ok, we keep the bank status whatever it is
        $bank = $bnk;
    }
    # return with one of the bank status
    return $bank;
}


################################################################################
# 
# createLabel
# -----------
#
# Creates a name for a label, so if that already exists use that one
#
################################################################################
sub createLabel {
    my ($addr, $prefix) = @_;
    my $label = $prefix;
    # create a name for it
    $label = sprintf("%s%04x", $prefix, $addr);

    # is a label exists for this one?
    if (not exists $prog{$addr}{label})
    {
        # store new label
        $prog{$addr}{label} = $label;
    }

    return $label;
}


################################################################################
# 
# series
# ------
#
# Tries to figure out whenever the instructions are the same
# It assumes that it called only when needed
#
################################################################################
sub series {
    my ($pc, $instr) = @_;
    return if (not exists $prog{$pc-1});
    # is the previous instr the same?
    if ( (not $prog{$pc-1}{instr} =~ /$instr/)
    # called from elswhere?
    or   (exists $prog{$pc}{callref}) )
    {
        # last one or called from somewere else as well
        $prog{$pc}{subr} = pop(@insub);
    }
    else {
        # inherits subroutine info from the previous instruction
        $prog{$pc}{subr} = $prog{$pc-1}{subr};
        delete $prog{$pc-1}{subr};
    }

}


################################################################################
# 
# analyze
# -------
#
# Analysis of a disassembled code, so it does not relay on th eunderlaying architecture 
#
################################################################################
sub analyze {

    my $cntrls = 0;
    my $skip   = 0;

    # forget what was the bank status
    $bank   = 0;

    # ok, we have the entire code base, just read it through and disassemble it
    foreach my $pc (sort {$a <=> $b} keys(%prog))
    {
        my $code  = $prog{$pc}{code};
        my $instr = $prog{$pc}{instr};
        my $addr  = $prog{$pc}{addr};
		my $data  = $prog{$pc}{data};
		
		if ($prog{$pc}{sbank} ne "") {
			$bank = $prog{$pc}{sbank};
		} elsif ($prog{$pc}{cbank} ne "") {
			$bank = $prog{$pc}{cbank};
		}
		
		$prog{$pc}{bank}=$bank;
		my $pclath = $prog{$pc}{pclath};


        # store beginning of a sub
        if (exists $prog{$pc}{callref}) {
            push (@insub, $pc);
        }

        # memory specific labels
        createLabel($pc, "Rst_Vector  org 0x") if ( $pc == 0x0000 );
        createLabel($pc, "Int_Vector  org 0x") if ( $pc == 0x0004 );# and ($arch{intVec} == 1);
		

		        # if this instruction is a branch one then we have an address...
        if ($addr ne "") {
            my $prevInstr = $prog{$pc-1}{instr} if (exists $prog{$pc-1});
			my $paddr = $addr | ($pclath & 0xfc) << 8;

			#printf STDERR "ADDR:$pc $addr $paddr $prevInstr\n";
            # build reference table
            if ($instr eq "call") {
				
                createLabel($paddr, 'sub_');
                $prog{$paddr}{callref}{$pc}++;
                
                # store inherited bank status
				if ($prog{$paddr}{instr} ne "movlb") {
                $prog{$paddr}{bank}{$pc} = $bank;
				#print STDERR "$instr $prog{$paddr}{instr} $prog{$paddr}{bank} $bank $paddr $pc\n"
				}
				
            } elsif ($instr eq "goto") {
                # check if this is a Start label...
                createLabel($paddr, 'Start_')    if ($pc < 4);
                # loop conditions -- it has to be placed here!
                createLabel($paddr, 'loop_') if ($prevInstr =~ /(?:decfsz)|(?:incfsz)|(?:btfs)/o);
                # check if the goto is a special one

                    # add a jump reference then
                    $prog{$paddr}{jumpref}{$pc}++;

                # store inherited bank status
				if ($prog{$paddr}{instr} ne "movlb") {
                $prog{$paddr}{bank}{$pc} = $bank;
				#print STDERR "$instr $prog{$paddr}{instr} $prog{$paddr}{bank} $bank $paddr $pc\n"
				}

			}
            
        
        }
		

    } # foreach disassemble
}

################################################################################
# 
# clearProg
# ---------
#
# Clears out all disassembled lines
#
################################################################################
sub clearProg {
    # ok, now loop through and remove those unwanted stuff
    foreach my $pc (keys(%prog)) {
        delete $prog{$pc}{instr};
        delete $prog{$pc}{label};
        delete $prog{$pc}{subr};
        delete $prog{$pc}{callref};
        delete $prog{$pc}{jumpref};
        delete $prog{$pc}{bank};
        delete $prog{$pc}{data};
        delete $prog{$pc}{addr};
		delete $prog{$pc}{pclath};
        delete $prog{$pc}{bit};
        delete $prog{$pc}{mem};
        delete $prog{$pc}{tgt};
        delete $prog{$pc}{arg};
    }

    # delete all info on architecture as well...
    %arch = ();
    # delete subroutine stack as well...
    @insub = ();
}



################################################################################
# 
# disass
# ------
#
# Disassebles the file regardless the format of the input file
#
################################################################################
sub disass14 {

    # for statistics only
    my $codes   = 0;
    my $cntrls  = 0;
    my $labels  = 0;
    my $invalid = 0;

    # clear all previously disassembled lines
    clearProg;
    
	$bank = 0;
	my $pclath = 0;
	my $prev_inst = "";
    # ok, we have the entire code base, just read it through and disassemble it
    foreach my $pc (sort {$a <=> $b} keys(%prog))
    {
        my $code = $prog{$pc}{code};

        # check if it is a control data
        my $incconf = $incdef{INC_CONFIG}{$pc};
        #if ($pc >= 0x8000) {
        #    printf(">>>%x %x %s\n",$pc, $code, $incconf )
        #}
        if ( $incconf ne "" )
        {
            # for statistics
            $cntrls++;
            # interested only the lower 7 bits
            #$code &= 0x7f;
			my $conf = $incdef{$incconf};
			if ($conf != undef) {
				my @cd = ();
				my %used = ();
				foreach $c (keys $conf) {
					my $cn = $incdef{$incconf}{$c};
					my $bitmask = $c ^ 0xFFFF;
					#printf("%s %0.4x %0.4x, %0.4x\n", $cn, $code, $bitmask,$code & $bitmask);
					if (($code & $bitmask) == 0) {
						my ($tmp,$cdtype,$tmp1) = split("_", $cn);
						
						if ($c != 0xffff || $used[$cdtype] != 1){
							push @cd, $cn;
							$used[$cdtype]=1;
						}
					}
				}
				$equ_named{$incconf} = join(" & ", @cd).sprintf(" ; 0x%x",$code);
			} else {
				$equ{$incconf} = $code;
			}

        }
        if ($pc >= 0x8000) {
            delete $prog{$pc};
        }
        else
        {
            # for statistics
            $codes++;
			$prog{$pc}{instr} = $bad;
			my $instr_code = 0;
			my $instr = "";
			my $instr_mask = 0;

			
			foreach $instr_mask (sort {$b <=> $a} keys %instr_names)
			{
				$instr_code = $code & $instr_mask;
				
				$instr = $instr_names{$instr_mask}{$instr_code};
				if ($instr ne "") {
					$prog{$pc}{instr} = $instr;
					my $param = $instr_param{$instr};
					
					if ($param != undef) {
					foreach $p (keys $param) {
						$prog{$pc}{$p} = ($code >> $instr_param{$instr}{$p}[0]) & $instr_param{$instr}{$p}[1];
					}
					}
					if ($instr =~ /^((?:call)|(?:goto))/) {
						my $addr = $prog{$pc}{addr};
						my $paddr = $addr | ($pclath & 0xfc) << 8;
						$prog{$paddr}{cbank} = $bank;
					} elsif ($instr eq "movlp") {
					#print STDERR ">> $instr $pclath $prog{$pc}{data} $pc\n";
						$pclath = $prog{$pc}{data};
					} elsif ($instr eq "movlb") {
						$bank = $prog{$pc}{data};
						$prog{$pc}{sbank} = $bank;
						#print STDERR ">> $pc movlb :$bank \n";
					} elsif ($instr eq "bsf" && $prog{$pc}{mem} == 0x3 && $prog{$pc}{bit}  == 1) {
						$bank = 1;
						$prog{$pc}{sbank} = $bank;
					} elsif ($instr eq "bcf" && $prog{$pc}{mem} == 0x3 && $prog{$pc}{bit}  == 1) {
						$bank = 0;
						$prog{$pc}{sbank} = $bank;
					} elsif ($instr =~ /^((?:return)|(?:retfie)|(?:retlw))/) {
						$bank = 0;
						$prog{$pc}{cbank} = $bank;
						$pclath = (($pc + 1) >> 8)& 0xff;
						
					}
					#print STDERR "$instr $pc :$bank \n";
					$prog{$pc}{pclath} = $pclath;
					if ($instr =~ /^((?:call)|(?:goto))/) {
					$pclath = (($pc + 1) >> 8)& 0xff;
					}
						
					$prev_inst = $instr;
					last;
				}
			}
	    }
	}
}


sub printEOS {
    my ($label) = @_;

    print ";\n";
    print "; end of $label\n";
    print ";------------------------------------------------------------\n";
    print "\n";
}


################################################################################
# 
# display
# -------
#
# Displays the disassembled code
#
################################################################################
sub display {

    # get the PIC type (cheating: assume that the PIC id is the name of the INC file)
    my $proc = 'unknown';
    if ($incName =~ /^P(.*)\.INC$/i) {
        $proc = $1;
    }

    print ";**********************************************************\n";
    print ";*  $hexName\n";
    print ";**********************************************************\n";
    print ";*  This file had been disassembled using unPIC.pl\n";
    print ";*  \n";
    print ";*  unPIC.pl is written by Tamas Rudnai\n";
    print ";*   -> based on Timo Rossi's work on pic14dis.c\n";
    print ";**********************************************************\n";
    print ";*  Please advised that unPIC.pl is not foolproof.\n";
    print ";*  It could happen that the code was not correctly\n";
    print ";*  reversed as the chip is not defined corretly\n";
    print ";*  or because of a bug in the tool's code.\n";
    print ";**********************************************************\n";
    print "\n\n";

    print "        list p=$proc\n\n";
    print "        include \"$incName\"\n\n";

    my $label = '';
    my $extra_line = '';
    my $jmpTblCnt = 0;
    # ok, we have the entire code base, just read it through and disassemble it
    foreach my $pc (sort {$a <=> $b} keys(%prog))
    {
        my $code   = $prog{$pc}{code};
        my $instr  = $prog{$pc}{instr};

		printf("Bank%0.4X_Vector org 0x%0.4X\n",$pc, $pc) if ($pc % 0x800 == 0 && $pc > 0);

        # display header of subroutine if any
        if (exists $prog{$pc}{callref}) {
            $label = getLabel($pc);
            print "\n";
            print ";------------------------------------------------------------\n";
            print "; Subroutine: $label\n";
            print ";\n";
            # display cross reference
            foreach my $ref (sort {$a <=> $b} keys %{$prog{$pc}{callref}}) {
                printf("; called from: %04X\n", $ref);
# foreach my $bnk (values %{$prog{$pc}{bank}}) {
#     printf("; inherited bank: %u\n", $bnk);
# }
            }
        }
        # display label if any
        if ( (exists $prog{$pc}{jumpref})
        or   (exists $prog{$pc}{label}) )
        {
            $label = getLabel($pc);
            print "\n$label" if ($label); # print label if it is not a 'silent' label
            print "\n"; # CRLF after the label or an empty line if 'silent' label
            # display cross reference
            foreach my $ref (sort {$a <=> $b} keys %{$prog{$pc}{jumpref}}) {
                printf("; jump here from: %04X\n", $ref);
            }
# foreach my $bnk (values %{$prog{$pc}{bank}}) {
#     printf("; inherited bank: %u\n", $bnk);
# }
            $extra_line = '';
        }
        # display extra lines
        print $extra_line;
        $extra_line = '';

        # construct asm line
        my $asm = sprintf("%-16s", $instr); # align instruction names
        my $mem = getRegFile($prog{$pc}{mem}, getBank($pc));

        $asm .= getDir($prog{$pc}{dir})           if (exists $prog{$pc}{dir});
        $asm .= sprintf("FSR%d",$prog{$pc}{fsr})           if (exists $prog{$pc}{fsr});
        $asm .= getLabel($prog{$pc}{addr} | ($prog{$pc}{pclath} & 0xfc) << 8)          if (exists $prog{$pc}{addr});
        $asm .= $mem                                if (exists $prog{$pc}{mem});
        $asm .= ", ".getBit($mem, $prog{$pc}{bit})  if (exists $prog{$pc}{bit});
        $asm .= ", ".getTarget($pc)                 if (exists $prog{$pc}{tgt});
        $asm .= getData($pc)                        if (exists $prog{$pc}{data});
        $asm .= $prog{$pc}{arg}                     if (exists $prog{$pc}{arg});
        
        #$asm .= getDir($prog{$pc}{dir})           if (exists $prog{$pc}{dir});
        #$asm .= sprintf("fsr%d",$prog{$pc}{fsr})           if (exists $prog{$pc}{fsr});
        #$asm .= sprintf("0x%x",$prog{$pc}{addr})           if (exists $prog{$pc}{addr}); 
        #$asm .= sprintf("0x%x", $prog{$pc}{mem})                                if (exists $prog{$pc}{mem});
        #$asm .= ", ".sprintf("0x%x", $prog{$pc}{bit})                 if (exists $prog{$pc}{bit});
        #$asm .= ", ".getTarget($pc)                 if (exists $prog{$pc}{tgt});
        #$asm .= sprintf("0x%x", $prog{$pc}{data})                        if (exists $prog{$pc}{data});
        #$asm .= $prog{$pc}{arg}                     if (exists $prog{$pc}{arg});
        
        
        

        # display disassembled line
        printf("$tab%-28s; %04X: %04X\n", $asm, $pc, $code);

        # put extra linefeeds to make it nicer
        if ($instr =~ /^(goto)|(call)|(sleep)/o) {
            if ($prog{$pc+1}{instr} eq $1) {
                $jmpTblCnt++;
            }
            # end of the jump table
            else {
                if ($jmpTblCnt) {
                    printEOS($label);
                }
                else {
                    $extra_line = "\n" 
                }

                $jmpTblCnt = 0;
            }
        }

        # is it the end of the subroutine?
        if (exists $prog{$pc}{subr}) {
            printEOS( getLabel($proc{$pc}{subr}) );
        }

    } # foreach pc

    ############### symbol definitions ###############

    print "\n\n;------------- symbol definitions ------------------\n\n";
	foreach my $name (sort keys %equ_named) {
        printf("$name    equ   %s\n", $equ_named{$name});
    }
    foreach my $name (sort keys %equ) {
        printf("$name    equ   0x%02X\n", $equ{$name});
    }
    print "\n\n;---------------------------------------------------\n\n";

    # ok, we finished
    print "\n        end\n\n\n";
}


########### M A I N ##############

MAIN: {
    print STDERR "unPIC.pl  -- written by Tamas Rudnai\n\n";

    foreach my $arg (@ARGV)
    {
        # load INC file
        loadINC($arg) if ($arg =~ /\.INC$/i);

        # load HEX file
        loadHEX($arg) if ($arg =~ /\.(?:HEX)|(?:HXL)|(?:HXH)$/i);

    }

    ############ D I S A S S E M B L E ##############

    # first stage, determine program logic and label names
    if ( (my $i14 = disass14) ) {
        print STDERR "Warning: Can't decide which MCU as both returned with invalid instructions!\n";
        print STDERR "$i14 as 14bit and as 12bit\n";
    }
    # second phase, all label will be referenced corretly
    # also finalize register file usage as now have a fairly good CPU state
    analyze;

    ############ D I S P L A Y ##############
    display();
}


