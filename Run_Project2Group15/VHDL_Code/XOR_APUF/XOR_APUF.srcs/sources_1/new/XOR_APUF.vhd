library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_APUF is
    Port ( --A :      in STD_LOGIC;
           --B :      in STD_LOGIC;
           --C : in STD_LOGIC_VECTOR(63 downto 0);
           Q :      out STD_LOGIC;
           path1:   out STD_LOGIC;
           path2:   out STD_LOGIC);
end XOR_APUF;

architecture Behavioral of XOR_APUF is
component MyMUX2
Port (   A : in STD_LOGIC;
         B : in STD_LOGIC;
         S : in STD_LOGIC;
         Y : out STD_LOGIC);
end component;

component XOR_GATE
PORT (   A : in std_logic;
         B : in std_logic;
         Y : out std_logic);
end component;

component DDF
Port(
         Q : out std_logic;    
         Clk :in std_logic;   
         D :in  std_logic);
end component;

signal A: std_logic := '1';
signal B: std_logic := '1';
signal C: STD_LOGIC_VECTOR(63 downto 0) := B"1101010001111110111111111101111111001001001111110100111111110011";
signal above_vector:  std_logic_vector(63 downto 0) := (others => '0');
signal below_vector:  std_logic_vector(63 downto 0) := (others => '0');
signal above_vector_2:  std_logic_vector(63 downto 0) := (others => '0');
signal below_vector_2:  std_logic_vector(63 downto 0) := (others => '0');
signal dff_output:    std_logic_vector(1 downto 0) := (others => '0');
begin
    U1: myMUX2 port map (A, A, C(0), above_vector(0));
    U2: myMUX2 port map (A, A, C(0), below_vector(0));
    U3: myMUX2 port map (above_vector(0), below_vector(0), C(1), above_vector(1));
    U4: myMUX2 port map (below_vector(0), above_vector(0), C(1), below_vector(1));
    U5: myMUX2 port map (above_vector(1), below_vector(1), C(2), above_vector(2));
    U6: myMUX2 port map (below_vector(1), above_vector(1), C(2), below_vector(2));
    U7: myMUX2 port map (above_vector(2), below_vector(2), C(3), above_vector(3));
    U8: myMUX2 port map (below_vector(2), above_vector(2), C(3), below_vector(3));
    U9: myMUX2 port map (above_vector(3), below_vector(3), C(4), above_vector(4));
    U10: myMUX2 port map (below_vector(3), above_vector(3), C(4), below_vector(4));
    U11: myMUX2 port map (above_vector(4), below_vector(4), C(5), above_vector(5));
    U12: myMUX2 port map (below_vector(4), above_vector(4), C(5), below_vector(5));
    U13: myMUX2 port map (above_vector(5), below_vector(5), C(6), above_vector(6));
    U14: myMUX2 port map (below_vector(5), above_vector(5), C(6), below_vector(6));
    U15: myMUX2 port map (above_vector(6), below_vector(6), C(7), above_vector(7));
    U16: myMUX2 port map (below_vector(6), above_vector(6), C(7), below_vector(7));
    U17: myMUX2 port map (above_vector(7), below_vector(7), C(8), above_vector(8));
    U18: myMUX2 port map (below_vector(7), above_vector(7), C(8), below_vector(8));
    U19: myMUX2 port map (above_vector(8), below_vector(8), C(9), above_vector(9));
    U20: myMUX2 port map (below_vector(8), above_vector(8), C(9), below_vector(9));
    U21: myMUX2 port map (above_vector(9), below_vector(9), C(10), above_vector(10));
    U22: myMUX2 port map (below_vector(9), above_vector(9), C(10), below_vector(10));
    U23: myMUX2 port map (above_vector(10), below_vector(10), C(11), above_vector(11));
    U24: myMUX2 port map (below_vector(10), above_vector(10), C(11), below_vector(11));
    U25: myMUX2 port map (above_vector(11), below_vector(11), C(12), above_vector(12));
    U26: myMUX2 port map (below_vector(11), above_vector(11), C(12), below_vector(12));
    U27: myMUX2 port map (above_vector(12), below_vector(12), C(13), above_vector(13));
    U28: myMUX2 port map (below_vector(12), above_vector(12), C(13), below_vector(13));
    U29: myMUX2 port map (above_vector(13), below_vector(13), C(14), above_vector(14));
    U30: myMUX2 port map (below_vector(13), above_vector(13), C(14), below_vector(14));
    U31: myMUX2 port map (above_vector(14), below_vector(14), C(15), above_vector(15));
    U32: myMUX2 port map (below_vector(14), above_vector(14), C(15), below_vector(15));
    U33: myMUX2 port map (above_vector(15), below_vector(15), C(16), above_vector(16));
    U34: myMUX2 port map (below_vector(15), above_vector(15), C(16), below_vector(16));
    U35: myMUX2 port map (above_vector(16), below_vector(16), C(17), above_vector(17));
    U36: myMUX2 port map (below_vector(16), above_vector(16), C(17), below_vector(17));
    U37: myMUX2 port map (above_vector(17), below_vector(17), C(18), above_vector(18));
    U38: myMUX2 port map (below_vector(17), above_vector(17), C(18), below_vector(18));
    U39: myMUX2 port map (above_vector(18), below_vector(18), C(19), above_vector(19));
    U40: myMUX2 port map (below_vector(18), above_vector(18), C(19), below_vector(19));
    U41: myMUX2 port map (above_vector(19), below_vector(19), C(20), above_vector(20));
    U42: myMUX2 port map (below_vector(19), above_vector(19), C(20), below_vector(20));
    U43: myMUX2 port map (above_vector(20), below_vector(20), C(21), above_vector(21));
    U44: myMUX2 port map (below_vector(20), above_vector(20), C(21), below_vector(21));
    U45: myMUX2 port map (above_vector(21), below_vector(21), C(22), above_vector(22));
    U46: myMUX2 port map (below_vector(21), above_vector(21), C(22), below_vector(22));
    U47: myMUX2 port map (above_vector(22), below_vector(22), C(23), above_vector(23));
    U48: myMUX2 port map (below_vector(22), above_vector(22), C(23), below_vector(23));
    U49: myMUX2 port map (above_vector(23), below_vector(23), C(24), above_vector(24));
    U50: myMUX2 port map (below_vector(23), above_vector(23), C(24), below_vector(24));
    U51: myMUX2 port map (above_vector(24), below_vector(24), C(25), above_vector(25));
    U52: myMUX2 port map (below_vector(24), above_vector(24), C(25), below_vector(25));
    U53: myMUX2 port map (above_vector(25), below_vector(25), C(26), above_vector(26));
    U54: myMUX2 port map (below_vector(25), above_vector(25), C(26), below_vector(26));
    U55: myMUX2 port map (above_vector(26), below_vector(26), C(27), above_vector(27));
    U56: myMUX2 port map (below_vector(26), above_vector(26), C(27), below_vector(27));
    U57: myMUX2 port map (above_vector(27), below_vector(27), C(28), above_vector(28));
    U58: myMUX2 port map (below_vector(27), above_vector(27), C(28), below_vector(28));
    U59: myMUX2 port map (above_vector(28), below_vector(28), C(29), above_vector(29));
    U60: myMUX2 port map (below_vector(28), above_vector(28), C(29), below_vector(29));
    U61: myMUX2 port map (above_vector(29), below_vector(29), C(30), above_vector(30));
    U62: myMUX2 port map (below_vector(29), above_vector(29), C(30), below_vector(30));
    U63: myMUX2 port map (above_vector(30), below_vector(30), C(31), above_vector(31));
    U64: myMUX2 port map (below_vector(30), above_vector(30), C(31), below_vector(31));
    U65: myMUX2 port map (above_vector(31), below_vector(31), C(32), above_vector(32));
    U66: myMUX2 port map (below_vector(31), above_vector(31), C(32), below_vector(32));
    U67: myMUX2 port map (above_vector(32), below_vector(32), C(33), above_vector(33));
    U68: myMUX2 port map (below_vector(32), above_vector(32), C(33), below_vector(33));
    U69: myMUX2 port map (above_vector(33), below_vector(33), C(34), above_vector(34));
    U70: myMUX2 port map (below_vector(33), above_vector(33), C(34), below_vector(34));
    U71: myMUX2 port map (above_vector(34), below_vector(34), C(35), above_vector(35));
    U72: myMUX2 port map (below_vector(34), above_vector(34), C(35), below_vector(35));
    U73: myMUX2 port map (above_vector(35), below_vector(35), C(36), above_vector(36));
    U74: myMUX2 port map (below_vector(35), above_vector(35), C(36), below_vector(36));
    U75: myMUX2 port map (above_vector(36), below_vector(36), C(37), above_vector(37));
    U76: myMUX2 port map (below_vector(36), above_vector(36), C(37), below_vector(37));
    U77: myMUX2 port map (above_vector(37), below_vector(37), C(38), above_vector(38));
    U78: myMUX2 port map (below_vector(37), above_vector(37), C(38), below_vector(38));
    U79: myMUX2 port map (above_vector(38), below_vector(38), C(39), above_vector(39));
    U80: myMUX2 port map (below_vector(38), above_vector(38), C(39), below_vector(39));
    U81: myMUX2 port map (above_vector(39), below_vector(39), C(40), above_vector(40));
    U82: myMUX2 port map (below_vector(39), above_vector(39), C(40), below_vector(40));
    U83: myMUX2 port map (above_vector(40), below_vector(40), C(41), above_vector(41));
    U84: myMUX2 port map (below_vector(40), above_vector(40), C(41), below_vector(41));
    U85: myMUX2 port map (above_vector(41), below_vector(41), C(42), above_vector(42));
    U86: myMUX2 port map (below_vector(41), above_vector(41), C(42), below_vector(42));
    U87: myMUX2 port map (above_vector(42), below_vector(42), C(43), above_vector(43));
    U88: myMUX2 port map (below_vector(42), above_vector(42), C(43), below_vector(43));
    U89: myMUX2 port map (above_vector(43), below_vector(43), C(44), above_vector(44));
    U90: myMUX2 port map (below_vector(43), above_vector(43), C(44), below_vector(44));
    U91: myMUX2 port map (above_vector(44), below_vector(44), C(45), above_vector(45));
    U92: myMUX2 port map (below_vector(44), above_vector(44), C(45), below_vector(45));
    U93: myMUX2 port map (above_vector(45), below_vector(45), C(46), above_vector(46));
    U94: myMUX2 port map (below_vector(45), above_vector(45), C(46), below_vector(46));
    U95: myMUX2 port map (above_vector(46), below_vector(46), C(47), above_vector(47));
    U96: myMUX2 port map (below_vector(46), above_vector(46), C(47), below_vector(47));
    U97: myMUX2 port map (above_vector(47), below_vector(47), C(48), above_vector(48));
    U98: myMUX2 port map (below_vector(47), above_vector(47), C(48), below_vector(48));
    U99: myMUX2 port map (above_vector(48), below_vector(48), C(49), above_vector(49));
    U100: myMUX2 port map (below_vector(48), above_vector(48), C(49), below_vector(49));
    U101: myMUX2 port map (above_vector(49), below_vector(49), C(50), above_vector(50));
    U102: myMUX2 port map (below_vector(49), above_vector(49), C(50), below_vector(50));
    U103: myMUX2 port map (above_vector(50), below_vector(50), C(51), above_vector(51));
    U104: myMUX2 port map (below_vector(50), above_vector(50), C(51), below_vector(51));
    U105: myMUX2 port map (above_vector(51), below_vector(51), C(52), above_vector(52));
    U106: myMUX2 port map (below_vector(51), above_vector(51), C(52), below_vector(52));
    U107: myMUX2 port map (above_vector(52), below_vector(52), C(53), above_vector(53));
    U108: myMUX2 port map (below_vector(52), above_vector(52), C(53), below_vector(53));
    U109: myMUX2 port map (above_vector(53), below_vector(53), C(54), above_vector(54));
    U110: myMUX2 port map (below_vector(53), above_vector(53), C(54), below_vector(54));
    U111: myMUX2 port map (above_vector(54), below_vector(54), C(55), above_vector(55));
    U112: myMUX2 port map (below_vector(54), above_vector(54), C(55), below_vector(55));
    U113: myMUX2 port map (above_vector(55), below_vector(55), C(56), above_vector(56));
    U114: myMUX2 port map (below_vector(55), above_vector(55), C(56), below_vector(56));
    U115: myMUX2 port map (above_vector(56), below_vector(56), C(57), above_vector(57));
    U116: myMUX2 port map (below_vector(56), above_vector(56), C(57), below_vector(57));
    U117: myMUX2 port map (above_vector(57), below_vector(57), C(58), above_vector(58));
    U118: myMUX2 port map (below_vector(57), above_vector(57), C(58), below_vector(58));
    U119: myMUX2 port map (above_vector(58), below_vector(58), C(59), above_vector(59));
    U120: myMUX2 port map (below_vector(58), above_vector(58), C(59), below_vector(59));
    U121: myMUX2 port map (above_vector(59), below_vector(59), C(60), above_vector(60));
    U122: myMUX2 port map (below_vector(59), above_vector(59), C(60), below_vector(60));
    U123: myMUX2 port map (above_vector(60), below_vector(60), C(61), above_vector(61));
    U124: myMUX2 port map (below_vector(60), above_vector(60), C(61), below_vector(61));
    U125: myMUX2 port map (above_vector(61), below_vector(61), C(62), above_vector(62));
    U126: myMUX2 port map (below_vector(61), above_vector(61), C(62), below_vector(62));
    U127: myMUX2 port map (above_vector(62), below_vector(62), C(63), above_vector(63));
    U128: myMUX2 port map (below_vector(62), above_vector(62), C(63), below_vector(63));
    U129: DDF port map(dff_output(0), below_vector(63), above_vector(63)); 
    
    U130: myMUX2 port map (B, B, C(0), above_vector_2(0));
    U131: myMUX2 port map (B, B, C(0), below_vector_2(0));
    U132: myMUX2 port map (above_vector_2(0), below_vector_2(0), C(1), above_vector_2(1));
    U133: myMUX2 port map (below_vector_2(0), above_vector_2(0), C(1), below_vector_2(1));
    U134: myMUX2 port map (above_vector_2(1), below_vector_2(1), C(2), above_vector_2(2));
    U135: myMUX2 port map (below_vector_2(1), above_vector_2(1), C(2), below_vector_2(2));
    U136: myMUX2 port map (above_vector_2(2), below_vector_2(2), C(3), above_vector_2(3));
    U137: myMUX2 port map (below_vector_2(2), above_vector_2(2), C(3), below_vector_2(3));
    U138: myMUX2 port map (above_vector_2(3), below_vector_2(3), C(4), above_vector_2(4));
    U139: myMUX2 port map (below_vector_2(3), above_vector_2(3), C(4), below_vector_2(4));
    U140: myMUX2 port map (above_vector_2(4), below_vector_2(4), C(5), above_vector_2(5));
    U141: myMUX2 port map (below_vector_2(4), above_vector_2(4), C(5), below_vector_2(5));
    U142: myMUX2 port map (above_vector_2(5), below_vector_2(5), C(6), above_vector_2(6));
    U143: myMUX2 port map (below_vector_2(5), above_vector_2(5), C(6), below_vector_2(6));
    U144: myMUX2 port map (above_vector_2(6), below_vector_2(6), C(7), above_vector_2(7));
    U145: myMUX2 port map (below_vector_2(6), above_vector_2(6), C(7), below_vector_2(7));
    U146: myMUX2 port map (above_vector_2(7), below_vector_2(7), C(8), above_vector_2(8));
    U147: myMUX2 port map (below_vector_2(7), above_vector_2(7), C(8), below_vector_2(8));
    U148: myMUX2 port map (above_vector_2(8), below_vector_2(8), C(9), above_vector_2(9));
    U149: myMUX2 port map (below_vector_2(8), above_vector_2(8), C(9), below_vector_2(9));
    U150: myMUX2 port map (above_vector_2(9), below_vector_2(9), C(10), above_vector_2(10));
    U151: myMUX2 port map (below_vector_2(9), above_vector_2(9), C(10), below_vector_2(10));
    U152: myMUX2 port map (above_vector_2(10), below_vector_2(10), C(11), above_vector_2(11));
    U153: myMUX2 port map (below_vector_2(10), above_vector_2(10), C(11), below_vector_2(11));
    U154: myMUX2 port map (above_vector_2(11), below_vector_2(11), C(12), above_vector_2(12));
    U155: myMUX2 port map (below_vector_2(11), above_vector_2(11), C(12), below_vector_2(12));
    U156: myMUX2 port map (above_vector_2(12), below_vector_2(12), C(13), above_vector_2(13));
    U157: myMUX2 port map (below_vector_2(12), above_vector_2(12), C(13), below_vector_2(13));
    U158: myMUX2 port map (above_vector_2(13), below_vector_2(13), C(14), above_vector_2(14));
    U159: myMUX2 port map (below_vector_2(13), above_vector_2(13), C(14), below_vector_2(14));
    U160: myMUX2 port map (above_vector_2(14), below_vector_2(14), C(15), above_vector_2(15));
    U161: myMUX2 port map (below_vector_2(14), above_vector_2(14), C(15), below_vector_2(15));
    U162: myMUX2 port map (above_vector_2(15), below_vector_2(15), C(16), above_vector_2(16));
    U163: myMUX2 port map (below_vector_2(15), above_vector_2(15), C(16), below_vector_2(16));
    U164: myMUX2 port map (above_vector_2(16), below_vector_2(16), C(17), above_vector_2(17));
    U165: myMUX2 port map (below_vector_2(16), above_vector_2(16), C(17), below_vector_2(17));
    U166: myMUX2 port map (above_vector_2(17), below_vector_2(17), C(18), above_vector_2(18));
    U167: myMUX2 port map (below_vector_2(17), above_vector_2(17), C(18), below_vector_2(18));
    U168: myMUX2 port map (above_vector_2(18), below_vector_2(18), C(19), above_vector_2(19));
    U169: myMUX2 port map (below_vector_2(18), above_vector_2(18), C(19), below_vector_2(19));
    U170: myMUX2 port map (above_vector_2(19), below_vector_2(19), C(20), above_vector_2(20));
    U171: myMUX2 port map (below_vector_2(19), above_vector_2(19), C(20), below_vector_2(20));
    U172: myMUX2 port map (above_vector_2(20), below_vector_2(20), C(21), above_vector_2(21));
    U173: myMUX2 port map (below_vector_2(20), above_vector_2(20), C(21), below_vector_2(21));
    U174: myMUX2 port map (above_vector_2(21), below_vector_2(21), C(22), above_vector_2(22));
    U175: myMUX2 port map (below_vector_2(21), above_vector_2(21), C(22), below_vector_2(22));
    U176: myMUX2 port map (above_vector_2(22), below_vector_2(22), C(23), above_vector_2(23));
    U177: myMUX2 port map (below_vector_2(22), above_vector_2(22), C(23), below_vector_2(23));
    U178: myMUX2 port map (above_vector_2(23), below_vector_2(23), C(24), above_vector_2(24));
    U179: myMUX2 port map (below_vector_2(23), above_vector_2(23), C(24), below_vector_2(24));
    U180: myMUX2 port map (above_vector_2(24), below_vector_2(24), C(25), above_vector_2(25));
    U181: myMUX2 port map (below_vector_2(24), above_vector_2(24), C(25), below_vector_2(25));
    U182: myMUX2 port map (above_vector_2(25), below_vector_2(25), C(26), above_vector_2(26));
    U183: myMUX2 port map (below_vector_2(25), above_vector_2(25), C(26), below_vector_2(26));
    U184: myMUX2 port map (above_vector_2(26), below_vector_2(26), C(27), above_vector_2(27));
    U185: myMUX2 port map (below_vector_2(26), above_vector_2(26), C(27), below_vector_2(27));
    U186: myMUX2 port map (above_vector_2(27), below_vector_2(27), C(28), above_vector_2(28));
    U187: myMUX2 port map (below_vector_2(27), above_vector_2(27), C(28), below_vector_2(28));
    U188: myMUX2 port map (above_vector_2(28), below_vector_2(28), C(29), above_vector_2(29));
    U189: myMUX2 port map (below_vector_2(28), above_vector_2(28), C(29), below_vector_2(29));
    U190: myMUX2 port map (above_vector_2(29), below_vector_2(29), C(30), above_vector_2(30));
    U191: myMUX2 port map (below_vector_2(29), above_vector_2(29), C(30), below_vector_2(30));
    U192: myMUX2 port map (above_vector_2(30), below_vector_2(30), C(31), above_vector_2(31));
    U193: myMUX2 port map (below_vector_2(30), above_vector_2(30), C(31), below_vector_2(31));
    U194: myMUX2 port map (above_vector_2(31), below_vector_2(31), C(32), above_vector_2(32));
    U195: myMUX2 port map (below_vector_2(31), above_vector_2(31), C(32), below_vector_2(32));
    U196: myMUX2 port map (above_vector_2(32), below_vector_2(32), C(33), above_vector_2(33));
    U197: myMUX2 port map (below_vector_2(32), above_vector_2(32), C(33), below_vector_2(33));
    U198: myMUX2 port map (above_vector_2(33), below_vector_2(33), C(34), above_vector_2(34));
    U199: myMUX2 port map (below_vector_2(33), above_vector_2(33), C(34), below_vector_2(34));
    U200: myMUX2 port map (above_vector_2(34), below_vector_2(34), C(35), above_vector_2(35));
    U201: myMUX2 port map (below_vector_2(34), above_vector_2(34), C(35), below_vector_2(35));
    U202: myMUX2 port map (above_vector_2(35), below_vector_2(35), C(36), above_vector_2(36));
    U203: myMUX2 port map (below_vector_2(35), above_vector_2(35), C(36), below_vector_2(36));
    U204: myMUX2 port map (above_vector_2(36), below_vector_2(36), C(37), above_vector_2(37));
    U205: myMUX2 port map (below_vector_2(36), above_vector_2(36), C(37), below_vector_2(37));
    U206: myMUX2 port map (above_vector_2(37), below_vector_2(37), C(38), above_vector_2(38));
    U207: myMUX2 port map (below_vector_2(37), above_vector_2(37), C(38), below_vector_2(38));
    U208: myMUX2 port map (above_vector_2(38), below_vector_2(38), C(39), above_vector_2(39));
    U209: myMUX2 port map (below_vector_2(38), above_vector_2(38), C(39), below_vector_2(39));
    U210: myMUX2 port map (above_vector_2(39), below_vector_2(39), C(40), above_vector_2(40));
    U211: myMUX2 port map (below_vector_2(39), above_vector_2(39), C(40), below_vector_2(40));
    U212: myMUX2 port map (above_vector_2(40), below_vector_2(40), C(41), above_vector_2(41));
    U213: myMUX2 port map (below_vector_2(40), above_vector_2(40), C(41), below_vector_2(41));
    U214: myMUX2 port map (above_vector_2(41), below_vector_2(41), C(42), above_vector_2(42));
    U215: myMUX2 port map (below_vector_2(41), above_vector_2(41), C(42), below_vector_2(42));
    U216: myMUX2 port map (above_vector_2(42), below_vector_2(42), C(43), above_vector_2(43));
    U217: myMUX2 port map (below_vector_2(42), above_vector_2(42), C(43), below_vector_2(43));
    U218: myMUX2 port map (above_vector_2(43), below_vector_2(43), C(44), above_vector_2(44));
    U219: myMUX2 port map (below_vector_2(43), above_vector_2(43), C(44), below_vector_2(44));
    U220: myMUX2 port map (above_vector_2(44), below_vector_2(44), C(45), above_vector_2(45));
    U221: myMUX2 port map (below_vector_2(44), above_vector_2(44), C(45), below_vector_2(45));
    U222: myMUX2 port map (above_vector_2(45), below_vector_2(45), C(46), above_vector_2(46));
    U223: myMUX2 port map (below_vector_2(45), above_vector_2(45), C(46), below_vector_2(46));
    U224: myMUX2 port map (above_vector_2(46), below_vector_2(46), C(47), above_vector_2(47));
    U225: myMUX2 port map (below_vector_2(46), above_vector_2(46), C(47), below_vector_2(47));
    U226: myMUX2 port map (above_vector_2(47), below_vector_2(47), C(48), above_vector_2(48));
    U227: myMUX2 port map (below_vector_2(47), above_vector_2(47), C(48), below_vector_2(48));
    U228: myMUX2 port map (above_vector_2(48), below_vector_2(48), C(49), above_vector_2(49));
    U229: myMUX2 port map (below_vector_2(48), above_vector_2(48), C(49), below_vector_2(49));
    U230: myMUX2 port map (above_vector_2(49), below_vector_2(49), C(50), above_vector_2(50));
    U231: myMUX2 port map (below_vector_2(49), above_vector_2(49), C(50), below_vector_2(50));
    U232: myMUX2 port map (above_vector_2(50), below_vector_2(50), C(51), above_vector_2(51));
    U233: myMUX2 port map (below_vector_2(50), above_vector_2(50), C(51), below_vector_2(51));
    U234: myMUX2 port map (above_vector_2(51), below_vector_2(51), C(52), above_vector_2(52));
    U235: myMUX2 port map (below_vector_2(51), above_vector_2(51), C(52), below_vector_2(52));
    U236: myMUX2 port map (above_vector_2(52), below_vector_2(52), C(53), above_vector_2(53));
    U237: myMUX2 port map (below_vector_2(52), above_vector_2(52), C(53), below_vector_2(53));
    U238: myMUX2 port map (above_vector_2(53), below_vector_2(53), C(54), above_vector_2(54));
    U239: myMUX2 port map (below_vector_2(53), above_vector_2(53), C(54), below_vector_2(54));
    U240: myMUX2 port map (above_vector_2(54), below_vector_2(54), C(55), above_vector_2(55));
    U241: myMUX2 port map (below_vector_2(54), above_vector_2(54), C(55), below_vector_2(55));
    U242: myMUX2 port map (above_vector_2(55), below_vector_2(55), C(56), above_vector_2(56));
    U243: myMUX2 port map (below_vector_2(55), above_vector_2(55), C(56), below_vector_2(56));
    U244: myMUX2 port map (above_vector_2(56), below_vector_2(56), C(57), above_vector_2(57));
    U245: myMUX2 port map (below_vector_2(56), above_vector_2(56), C(57), below_vector_2(57));
    U246: myMUX2 port map (above_vector_2(57), below_vector_2(57), C(58), above_vector_2(58));
    U247: myMUX2 port map (below_vector_2(57), above_vector_2(57), C(58), below_vector_2(58));
    U248: myMUX2 port map (above_vector_2(58), below_vector_2(58), C(59), above_vector_2(59));
    U249: myMUX2 port map (below_vector_2(58), above_vector_2(58), C(59), below_vector_2(59));
    U250: myMUX2 port map (above_vector_2(59), below_vector_2(59), C(60), above_vector_2(60));
    U251: myMUX2 port map (below_vector_2(59), above_vector_2(59), C(60), below_vector_2(60));
    U252: myMUX2 port map (above_vector_2(60), below_vector_2(60), C(61), above_vector_2(61));
    U253: myMUX2 port map (below_vector_2(60), above_vector_2(60), C(61), below_vector_2(61));
    U254: myMUX2 port map (above_vector_2(61), below_vector_2(61), C(62), above_vector_2(62));
    U255: myMUX2 port map (below_vector_2(61), above_vector_2(61), C(62), below_vector_2(62));
    U256: myMUX2 port map (above_vector_2(62), below_vector_2(62), C(63), above_vector_2(63));
    U257: myMUX2 port map (below_vector_2(62), above_vector_2(62), C(63), below_vector_2(63));
    U258: DDF port map(dff_output(1), below_vector_2(63), above_vector_2(63)); 
    
    U259: XOR_GATE port map(dff_output(0),dff_output(1),Q); 
    path1 <= dff_output(0);
    path2 <= dff_output(1);
end Behavioral;