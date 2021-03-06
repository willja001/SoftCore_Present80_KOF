-- progloader
-- PRESENT
-- Round Keys Computed On the Fly
-- Set PMEM -> 9

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY progloader IS
	generic(
		LOADER_SIZE : integer:= 8
		);

	PORT(
		addr: IN STD_LOGIC_VECTOR(LOADER_SIZE - 1 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END progloader;

ARCHITECTURE dataflow OF progloader IS

SIGNAL index: INTEGER RANGE 0 TO 2**LOADER_SIZE - 1;
TYPE vector_array IS ARRAY (0 to 2**LOADER_SIZE-1) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT memory : vector_array := 
	(


-- Assembled by SoftAsm.py at Thu Dec 29 15:54:48 2016
-- Start location: 0x000
-- End location: 0x120
-- Highest program address: 0x141
-- .equ x0 0x00
-- .equ x6 0x06
-- .equ x7 0x07
-- .equ cnt 0x08
-- .equ rnd 0x09
-- .equ ycnt 0x0A
-- .equ rnd 0x09
-- .equ tkcnt 0x0B
-- .equ y0 0x10
-- .equ y32 0x30
-- .equ sbox 0x50
-- .equ k0 0x60
-- .equ k1 0x61
-- .equ k3 0x63
-- .equ k7 0x67
-- .equ k8 0x68
-- .equ k10 0x6A
-- .equ k32 0xF8
-- .equ tk0 0x70
-- .equ tk8 0x78
-- .equ tk9 0x79
-- .lbl mnlp 0x000
-- .lbl sbst 0x002
-- .lbl sblp 0x009
-- .lbl perm 0x027
-- .lbl unpack 0x02E
-- .lbl unpcknd 0x04A
-- .lbl pack1 0x053
-- .lbl pack2 0x078
-- .lbl pack2lp 0x081
-- .lbl pck2nd 0x0A6
-- .lbl rtlp 0x0B3
-- .lbl rtnd 0x0CE
-- .lbl swlp 0x0EF
-- .lbl swnd 0x0FB
-- .lbl fnrndky 0x11E
-- .lbl lpnd 0x120
-- .lbl perm1 0x121
-- .lbl perm2 0x129
-- .lbl rndky 0x133
-- .lbl rndkylp 0x137
-- .lbl rndkynd 0x141

x"91", --PC=0x000 jsr rndky
x"33",
x"50", --PC=0x002 mvi cnt, r0
x"08",
x"51", --PC=0x004 mvi 0x07, r1
x"07",
x"24", --PC=0x006 sts r1, r0
x"52", --PC=0x007 mvi sbox, r2
x"50",
x"04", --PC=0x009 lds r1, r0
x"53", --PC=0x00A mvi 0x04, r3
x"04",
x"6C", --PC=0x00C srl r3, r0
x"5C",
x"6C", --PC=0x00E add r2, r0
x"08",
x"00", --PC=0x010 lds r0, r0
x"6C", --PC=0x011 sll r3, r0
x"7C",
x"05", --PC=0x013 lds r1, r1
x"6C", --PC=0x014 sll r3, r1
x"7D",
x"6C", --PC=0x016 srl r3, r1
x"5D",
x"6C", --PC=0x018 add r2, r1
x"09",
x"05", --PC=0x01A lds r1, r1
x"6C", --PC=0x01B lor r1, r0
x"34",
x"53", --PC=0x01D mvi cnt, r3
x"08",
x"0D", --PC=0x01F lds r3, r1
x"21", --PC=0x020 sts r0, r1
x"65", --PC=0x021 dec r1
x"F4", --PC=0x022 bni perm
x"27",
x"27", --PC=0x024 sts r1, r3
x"D0", --PC=0x025 jmp sblp
x"09",
x"51", --PC=0x027 mvi cnt, r1
x"08",
x"50", --PC=0x029 mvi x7, r0
x"07",
x"21", --PC=0x02B sts r0, r1
x"51", --PC=0x02C mvi y0, r1
x"10",
x"53", --PC=0x02E mvi 0x01, r3
x"01",
x"00", --PC=0x030 lds r0, r0
x"91", --PC=0x031 jsr perm1
x"21",
x"91", --PC=0x033 jsr perm1
x"21",
x"91", --PC=0x035 jsr perm1
x"21",
x"91", --PC=0x037 jsr perm1
x"21",
x"91", --PC=0x039 jsr perm1
x"21",
x"91", --PC=0x03B jsr perm1
x"21",
x"91", --PC=0x03D jsr perm1
x"21",
x"91", --PC=0x03F jsr perm1
x"21",
x"53", --PC=0x041 mvi cnt, r3
x"08",
x"0C", --PC=0x043 lds r3, r0
x"64", --PC=0x044 dec r0
x"F4", --PC=0x045 bni unpcknd
x"4A",
x"23", --PC=0x047 sts r0, r3
x"D0", --PC=0x048 jmp unpack
x"2E",
x"51", --PC=0x04A mvi cnt, r1
x"08",
x"52", --PC=0x04C mvi x7, r2
x"07",
x"29", --PC=0x04E sts r2, r1
x"50", --PC=0x04F mvi ycnt, r0
x"0A",
x"52", --PC=0x051 mvi y0, r2
x"10",
x"28", --PC=0x053 sts r2, r0
x"51", --PC=0x054 mvi 0x01, r1
x"01",
x"50", --PC=0x056 mvi 0x00, r0
x"00",
x"91", --PC=0x058 jsr perm2
x"29",
x"91", --PC=0x05A jsr perm2
x"29",
x"91", --PC=0x05C jsr perm2
x"29",
x"91", --PC=0x05E jsr perm2
x"29",
x"91", --PC=0x060 jsr perm2
x"29",
x"91", --PC=0x062 jsr perm2
x"29",
x"91", --PC=0x064 jsr perm2
x"29",
x"0B", --PC=0x066 lds r2, r3
x"6C", --PC=0x067 lor r3, r0
x"3C",
x"53", --PC=0x069 mvi cnt, r3
x"08",
x"0E", --PC=0x06B lds r3, r2
x"22", --PC=0x06C sts r0, r2
x"66", --PC=0x06D dec r2
x"F8", --PC=0x06E bzi pack2
x"78",
x"66", --PC=0x070 dec r2
x"2B", --PC=0x071 sts r2, r3
x"50", --PC=0x072 mvi ycnt, r0
x"0A",
x"02", --PC=0x074 lds r0, r2
x"62", --PC=0x075 inc r2
x"D0", --PC=0x076 jmp pack1
x"53",
x"51", --PC=0x078 mvi cnt, r1
x"08",
x"52", --PC=0x07A mvi x6, r2
x"06",
x"29", --PC=0x07C sts r2, r1
x"50", --PC=0x07D mvi ycnt, r0
x"0A",
x"52", --PC=0x07F mvi y32, r2
x"30",
x"28", --PC=0x081 sts r2, r0
x"51", --PC=0x082 mvi 0x01, r1
x"01",
x"50", --PC=0x084 mvi 0x00, r0
x"00",
x"91", --PC=0x086 jsr perm2
x"29",
x"91", --PC=0x088 jsr perm2
x"29",
x"91", --PC=0x08A jsr perm2
x"29",
x"91", --PC=0x08C jsr perm2
x"29",
x"91", --PC=0x08E jsr perm2
x"29",
x"91", --PC=0x090 jsr perm2
x"29",
x"91", --PC=0x092 jsr perm2
x"29",
x"0B", --PC=0x094 lds r2, r3
x"6C", --PC=0x095 lor r3, r0
x"3C",
x"53", --PC=0x097 mvi cnt, r3
x"08",
x"0E", --PC=0x099 lds r3, r2
x"22", --PC=0x09A sts r0, r2
x"66", --PC=0x09B dec r2
x"F4", --PC=0x09C bni pck2nd
x"A6",
x"66", --PC=0x09E dec r2
x"2B", --PC=0x09F sts r2, r3
x"50", --PC=0x0A0 mvi ycnt, r0
x"0A",
x"02", --PC=0x0A2 lds r0, r2
x"62", --PC=0x0A3 inc r2
x"D0", --PC=0x0A4 jmp pack2lp
x"81",
x"50", --PC=0x0A6 mvi k10, r0
x"6A",
x"51", --PC=0x0A8 mvi k0, r1
x"60",
x"00", --PC=0x0AA lds r0, r0
x"21", --PC=0x0AB sts r0, r1
x"50", --PC=0x0AC mvi tkcnt, r0
x"0B",
x"52", --PC=0x0AE mvi tk0, r2
x"70",
x"28", --PC=0x0B0 sts r2, r0
x"51", --PC=0x0B1 mvi k0, r1
x"60",
x"04", --PC=0x0B3 lds r1, r0
x"53", --PC=0x0B4 mvi 0x05, r3
x"05",
x"6C", --PC=0x0B6 sll r3, r0
x"7C",
x"61", --PC=0x0B8 inc r1
x"06", --PC=0x0B9 lds r1, r2
x"53", --PC=0x0BA mvi 0x03, r3
x"03",
x"6C", --PC=0x0BC srl r3, r2
x"5E",
x"6C", --PC=0x0BE lor r2, r0
x"38",
x"53", --PC=0x0C0 mvi tkcnt, r3
x"0B",
x"0E", --PC=0x0C2 lds r3, r2
x"22", --PC=0x0C3 sts r0, r2
x"62", --PC=0x0C4 inc r2
x"2B", --PC=0x0C5 sts r2, r3
x"53", --PC=0x0C6 mvi k10, r3
x"6A",
x"6C", --PC=0x0C8 sub r1, r3
x"17",
x"F8", --PC=0x0CA bzi rtnd
x"CE",
x"D0", --PC=0x0CC jmp rtlp
x"B3",
x"50", --PC=0x0CE mvi sbox, r0
x"50",
x"52", --PC=0x0D0 mvi tk8, r2
x"78",
x"0A", --PC=0x0D2 lds r2, r2
x"49", --PC=0x0D3 mov r2, r1
x"53", --PC=0x0D4 mvi 0x04, r3
x"04",
x"6C", --PC=0x0D6 srl r3, r2
x"5E",
x"6C", --PC=0x0D8 add r2, r0
x"08",
x"00", --PC=0x0DA lds r0, r0
x"6C", --PC=0x0DB sll r3, r0
x"7C",
x"6C", --PC=0x0DD sll r3, r1
x"7D",
x"6C", --PC=0x0DF srl r3, r1
x"5D",
x"6C", --PC=0x0E1 lor r1, r0
x"34",
x"51", --PC=0x0E3 mvi k1, r1
x"61",
x"21", --PC=0x0E5 sts r0, r1
x"50", --PC=0x0E6 mvi tk9, r0
x"79",
x"00", --PC=0x0E8 lds r0, r0
x"61", --PC=0x0E9 inc r1
x"21", --PC=0x0EA sts r0, r1
x"50", --PC=0x0EB mvi tk0, r0
x"70",
x"51", --PC=0x0ED mvi k3, r1
x"63",
x"02", --PC=0x0EF lds r0, r2
x"29", --PC=0x0F0 sts r2, r1
x"53", --PC=0x0F1 mvi k10, r3
x"6A",
x"6C", --PC=0x0F3 sub r1, r3
x"17",
x"F8", --PC=0x0F5 bzi swnd
x"FB",
x"60", --PC=0x0F7 inc r0
x"61", --PC=0x0F8 inc r1
x"D0", --PC=0x0F9 jmp swlp
x"EF",
x"50", --PC=0x0FB mvi rnd, r0
x"09",
x"00", --PC=0x0FD lds r0, r0
x"60", --PC=0x0FE inc r0
x"41", --PC=0x0FF mov r0, r1
x"52", --PC=0x100 mvi 0x01, r2
x"01",
x"6C", --PC=0x102 srl r2, r0
x"58",
x"52", --PC=0x104 mvi k8, r2
x"68",
x"0B", --PC=0x106 lds r2, r3
x"B3", --PC=0x107 xor r0, r3
x"2E", --PC=0x108 sts r3, r2
x"62", --PC=0x109 inc r2
x"50", --PC=0x10A mvi 0x07, r0
x"07",
x"6C", --PC=0x10C sll r0, r1
x"71",
x"0B", --PC=0x10E lds r2, r3
x"B7", --PC=0x10F xor r1, r3
x"2E", --PC=0x110 sts r3, r2
x"51", --PC=0x111 mvi rnd, r1
x"09",
x"04", --PC=0x113 lds r1, r0
x"52", --PC=0x114 mvi 0x1E, r2
x"1E",
x"6C", --PC=0x116 sub r0, r2
x"12",
x"F9", --PC=0x118 bzi fnrndky
x"1E",
x"60", --PC=0x11A inc r0
x"21", --PC=0x11B sts r0, r1
x"D0", --PC=0x11C jmp mnlp
x"00",
x"91", --PC=0x11E jsr rndky
x"33",
 -------PC=0x120---- end -----
x"40", --PC=0x120 nop
x"6C", --PC=0x121 rol r3, r0
x"6C",
x"42", --PC=0x123 mov r0, r2
x"6C", --PC=0x124 and r3, r2
x"2E",
x"29", --PC=0x126 sts r2, r1
x"61", --PC=0x127 inc r1
x"A0", --PC=0x128 ret
x"0B", --PC=0x129 lds r2, r3
x"6C", --PC=0x12A lor r3, r0
x"3C",
x"6C", --PC=0x12C sll r1, r0
x"74",
x"53", --PC=0x12E mvi 0x04, r3
x"04",
x"6C", --PC=0x130 add r3, r2
x"0E",
x"A0", --PC=0x132 ret
x"50", --PC=0x133 mvi k1, r0
x"61",
x"51", --PC=0x135 mvi x7, r1
x"07",
x"06", --PC=0x137 lds r1, r2
x"03", --PC=0x138 lds r0, r3
x"BE", --PC=0x139 xor r3, r2
x"29", --PC=0x13A sts r2, r1 
x"65", --PC=0x13B dec r1
x"F5", --PC=0x13C bni rndkynd
x"41",
x"60", --PC=0x13E inc r0
x"D1", --PC=0x13F jmp rndkylp
x"37",
x"A0", --PC=0x141 ret
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00"




);

BEGIN

	index <= to_integer(unsigned(addr));
	dout <= memory(index);

END dataflow;
