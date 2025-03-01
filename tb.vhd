library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture tb of tb is
	signal D: std_logic_vector (0 to 15) := (others => '0');
	signal Derr, Dout: std_logic_vector (0 to 15);
	signal Ci, Co: std_logic_vector (0 to 4);
	signal Pi, Po: std_logic;
begin

	dutE: entity work.Encoder port map(D => D, Co => Co, Ci => Ci, Po => Po, Pi => Pi);
	dutD: entity work.Decoder port map(D => Derr, Co => Co, Ci => Ci, Po => Po, Pi => Pi, Dout => Dout);

	stimuli: process
	begin
		Derr <= (others => '0');		wait for 20 ns;		-- Teste 1:  todos 0 (Sem erros)
		Derr <= (others => '1');		wait for 20 ns;		-- Teste 2:  todos 1 (Erro em todos)
-- Single error
---------------------------------------------- 
		Derr <= "1000000000000000";		wait for 20 ns;		-- Teste 3:  Erro 3 / 6
		Derr <= "0100000000000000";		wait for 20 ns;		-- Teste 4:  Erro 7 /12
		Derr <= "0010000000000000";		wait for 20 ns;		-- Teste 5:  Erro 23/31
		Derr <= "0001000000000000";		wait for 20 ns;		-- Teste 6:  Erro 14/27
		Derr <= "0000100000000000";		wait for 20 ns;  	-- Teste 7:  Erro 19/13
		Derr <= "0000010000000000"; 	wait for 20 ns;		-- Teste 8:  Erro 11/30
		Derr <= "0000001000000000"; 	wait for 20 ns;		-- Teste 9:  Erro 24/ 5
		Derr <= "0000000100000000"; 	wait for 20 ns;		-- Teste 10: Erro 9 /29
		Derr <= "0000000010000000"; 	wait for 20 ns;		-- Teste 11: Erro 26/ 9
		Derr <= "0000000001000000"; 	wait for 20 ns;		-- Teste 12: Erro 15/25
		Derr <= "0000000000100000"; 	wait for 20 ns;		-- Teste 13: Erro 13/19
		Derr <= "0000000000010000"; 	wait for 20 ns;		-- Teste 14: Erro 17/28
		Derr <= "0000000000001000"; 	wait for 20 ns;		-- Teste 15: Erro 29/23
		Derr <= "0000000000000100"; 	wait for 20 ns;		-- Teste 16: Erro 5 /10
		Derr <= "0000000000000010"; 	wait for 20 ns;		-- Teste 17: Erro 25/ 3
		Derr <= "0000000000000001"; 	wait for 20 ns;		-- Teste 18: Erro 12/18
-- Double error {0, X}
---------------------------------------------- 
		Derr <= "1100000000000000"; 	wait for 20 ns;		-- Teste 19: 4 / 10 
		Derr <= "1010000000000000"; 	wait for 20 ns;		-- Teste 20: Erro Duplo 
		Derr <= "1001000000000000"; 	wait for 20 ns;		-- Teste 21: Erro Duplo 
		Derr <= "1000100000000000"; 	wait for 20 ns;		-- Teste 22: Erro Duplo 
		Derr <= "1000010000000000"; 	wait for 20 ns;		-- Teste 23: Erro Duplo 
		Derr <= "1000001000000000"; 	wait for 20 ns;		-- Teste 24: Erro Duplo 
		Derr <= "1000000100000000"; 	wait for 20 ns;		-- Teste 25: Erro Duplo 
		Derr <= "1000000010000000"; 	wait for 20 ns;		-- Teste 26: Erro Duplo
		Derr <= "1000000001000000"; 	wait for 20 ns;		-- Teste 27: Erro Duplo 
		Derr <= "1000000000100000"; 	wait for 20 ns;		-- Teste 28: Erro Duplo 
		Derr <= "1000000000010000"; 	wait for 20 ns;		-- Teste 29: Erro Duplo 
		Derr <= "1000000000001000"; 	wait for 20 ns;		-- Teste 30: Erro Duplo 
		Derr <= "1000000000000100"; 	wait for 20 ns;		-- Teste 31: Erro Duplo 
		Derr <= "1000000000000010"; 	wait for 20 ns;		-- Teste 32: Erro Duplo 
		Derr <= "1000000000000001"; 	wait for 20 ns;		-- Teste 33: Erro Duplo 
-- Double error {1, X}
---------------------------------------------- 
		Derr <= "0110000000000000"; 	wait for 20 ns;		-- Teste 34: Erro Duplo 
		Derr <= "0101000000000000"; 	wait for 20 ns;		-- Teste 35: Erro Duplo 
		Derr <= "0100100000000000"; 	wait for 20 ns;		-- Teste 36: Erro Duplo 
		Derr <= "0100010000000000"; 	wait for 20 ns;		-- Teste 37: Erro Duplo 
		Derr <= "0100001000000000"; 	wait for 20 ns;		-- Teste 38: Erro Duplo 
		Derr <= "0100000100000000"; 	wait for 20 ns;		-- Teste 39: Erro Duplo 
		Derr <= "0100000010000000"; 	wait for 20 ns;		-- Teste 40: Erro Duplo 
		Derr <= "0100000001000000"; 	wait for 20 ns;		-- Teste 41: Erro Duplo 
		Derr <= "0100000000100000"; 	wait for 20 ns;		-- Teste 42: Erro Duplo 
		Derr <= "0100000000010000"; 	wait for 20 ns;		-- Teste 43: Erro Duplo 
		Derr <= "0100000000001000"; 	wait for 20 ns;		-- Teste 44: Erro Duplo 
		Derr <= "0100000000000100"; 	wait for 20 ns;		-- Teste 45: Erro Duplo 
		Derr <= "0100000000000010"; 	wait for 20 ns;		-- Teste 46: Erro Duplo 
		Derr <= "0100000000000001"; 	wait for 20 ns;		-- Teste 47: Erro Duplo 

-- Double error {2, X}
---------------------------------------------- 
		Derr <= "0011000000000000"; 	wait for 20 ns;		-- Teste 48: Erro Duplo 
		Derr <= "0010100000000000"; 	wait for 20 ns;		-- Teste 49: Erro Duplo 
		Derr <= "0010010000000000"; 	wait for 20 ns;		-- Teste 50: Erro Duplo 
		Derr <= "0010001000000000"; 	wait for 20 ns;		-- Teste 51: Erro Duplo 
		Derr <= "0010000100000000"; 	wait for 20 ns;		-- Teste 52: Erro Duplo 
		Derr <= "0010000010000000";		wait for 20 ns;		-- Teste 53: Erro Duplo 
		Derr <= "0010000001000000";		wait for 20 ns;		-- Teste 54: Erro Duplo 
		Derr <= "0010000000100000"; 	wait for 20 ns;		-- Teste 55: Erro Duplo 
		Derr <= "0010000000010000"; 	wait for 20 ns;		-- Teste 56: Erro Duplo 
		Derr <= "0010000000001000"; 	wait for 20 ns;		-- Teste 57: Erro Duplo 
		Derr <= "0010000000000100"; 	wait for 20 ns;		-- Teste 58: Erro Duplo 
		Derr <= "0010000000000010"; 	wait for 20 ns;		-- Teste 59: Erro Duplo 
		Derr <= "0010000000000001"; 	wait for 20 ns;		-- Teste 60: Erro Duplo 
-- Double error {3, X}
---------------------------------------------- 
		Derr <= "0001100000000000"; 	wait for 20 ns;		-- Teste 61: Erro Duplo 
		Derr <= "0001010000000000"; 	wait for 20 ns;		-- Teste 62: Erro Duplo 
		Derr <= "0001001000000000"; 	wait for 20 ns;		-- Teste 63: Erro Duplo 
		Derr <= "0001000100000000"; 	wait for 20 ns;		-- Teste 64: Erro Duplo 
		Derr <= "0001000010000000"; 	wait for 20 ns;		-- Teste 65: Erro Duplo 
		Derr <= "0001000001000000"; 	wait for 20 ns;		-- Teste 66: Erro Duplo 
		Derr <= "0001000000100000"; 	wait for 20 ns;		-- Teste 67: Erro Duplo 
		Derr <= "0001000000010000"; 	wait for 20 ns;		-- Teste 68: Erro Duplo 
		Derr <= "0001000000001000"; 	wait for 20 ns;		-- Teste 69: Erro Duplo 
		Derr <= "0001000000000100"; 	wait for 20 ns;		-- Teste 70: Erro Duplo 
		Derr <= "0001000000000010"; 	wait for 20 ns;		-- Teste 71: Erro Duplo 
		Derr <= "0001000000000001"; 	wait for 20 ns;		-- Teste 72: Erro Duplo 
-- Double error {4, X}
---------------------------------------------- 
		Derr <= "0000110000000000"; 	wait for 20 ns;		-- Teste 73: Erro Duplo 
		Derr <= "0000101000000000"; 	wait for 20 ns;		-- Teste 74: Erro Duplo 
		Derr <= "0000100100000000"; 	wait for 20 ns;		-- Teste 75: Erro Duplo 
		Derr <= "0000100010000000"; 	wait for 20 ns;		-- Teste 76: Erro Duplo 
		Derr <= "0000100001000000"; 	wait for 20 ns;		-- Teste 77: Erro Duplo 
		Derr <= "0000100000100000"; 	wait for 20 ns;		-- Teste 78: Erro Duplo 
		Derr <= "0000100000010000"; 	wait for 20 ns;		-- Teste 79: Erro Duplo 
		Derr <= "0000100000001000"; 	wait for 20 ns;		-- Teste 80: Erro Duplo 
		Derr <= "0000100000000100"; 	wait for 20 ns;		-- Teste 81: Erro Duplo 
		Derr <= "0000100000000010"; 	wait for 20 ns;		-- Teste 82: Erro Duplo 
		Derr <= "0000100000000001"; 	wait for 20 ns;		-- Teste 83: Erro Duplo 
-- Double error {5, X}
---------------------------------------------- 
		Derr <= "0000011000000000"; 	wait for 20 ns;		-- Teste 84: Erro Duplo 
		Derr <= "0000010100000000"; 	wait for 20 ns;		-- Teste 85: Erro Duplo 
		Derr <= "0000010010000000"; 	wait for 20 ns;		-- Teste 86: Erro Duplo 
		Derr <= "0000010001000000"; 	wait for 20 ns;		-- Teste 87: Erro Duplo 
		Derr <= "0000010000100000"; 	wait for 20 ns;		-- Teste 88: Erro Duplo 
		Derr <= "0000010000010000"; 	wait for 20 ns;		-- Teste 89: Erro Duplo 
		Derr <= "0000010000001000"; 	wait for 20 ns;		-- Teste 90: Erro Duplo 
		Derr <= "0000010000000100"; 	wait for 20 ns;		-- Teste 91: Erro Duplo 
		Derr <= "0000010000000010"; 	wait for 20 ns;		-- Teste 92: Erro Duplo 
		Derr <= "0000010000000001"; 	wait for 20 ns;		-- Teste 93: Erro Duplo 
-- Double error {6, X}
---------------------------------------------- 
		Derr <= "0000001100000000"; 	wait for 20 ns;		-- Teste 94: Erro Duplo 
		Derr <= "0000001010000000"; 	wait for 20 ns;		-- Teste 95: Erro Duplo 
		Derr <= "0000001001000000"; 	wait for 20 ns;		-- Teste 96: Erro Duplo 
		Derr <= "0000001000100000"; 	wait for 20 ns;		-- Teste 97: Erro Duplo 
		Derr <= "0000001000010000"; 	wait for 20 ns;		-- Teste 98: Erro Duplo 
		Derr <= "0000001000001000"; 	wait for 20 ns;		-- Teste 99: Erro Duplo 
		Derr <= "0000001000000100"; 	wait for 20 ns;		-- Teste 100: Erro Duplo 
		Derr <= "0000001000000010"; 	wait for 20 ns;		-- Teste 101: Erro Duplo 
		Derr <= "0000001000000001"; 	wait for 20 ns;		-- Teste 102: Erro Duplo 
-- Double error {7, X}
---------------------------------------------- 
		Derr <= "0000000110000000"; 	wait for 20 ns;		-- Teste 103: Erro Duplo 
		Derr <= "0000000101000000"; 	wait for 20 ns;		-- Teste 104: Erro Duplo 
		Derr <= "0000000100100000"; 	wait for 20 ns;		-- Teste 105: Erro Duplo 
		Derr <= "0000000100010000"; 	wait for 20 ns;		-- Teste 106: Erro Duplo 
		Derr <= "0000000100001000"; 	wait for 20 ns;		-- Teste 107: Erro Duplo 
		Derr <= "0000000100000100"; 	wait for 20 ns;		-- Teste 108: Erro Duplo 
		Derr <= "0000000100000010"; 	wait for 20 ns;		-- Teste 109: Erro Duplo 
		Derr <= "0000000100000001"; 	wait for 20 ns;		-- Teste 110: Erro Duplo 
-- Double error {8, X}
---------------------------------------------- 
		Derr <= "0000000011000000"; 	wait for 20 ns;		-- Teste 111: Erro Duplo 
		Derr <= "0000000010100000"; 	wait for 20 ns;		-- Teste 112: Erro Duplo 
		Derr <= "0000000010010000"; 	wait for 20 ns;		-- Teste 113: Erro Duplo 
		Derr <= "0000000010001000"; 	wait for 20 ns;		-- Teste 114: Erro Duplo 
		Derr <= "0000000010000100"; 	wait for 20 ns;		-- Teste 115: Erro Duplo 
		Derr <= "0000000010000010"; 	wait for 20 ns;		-- Teste 116: Erro Duplo 
		Derr <= "0000000010000001"; 	wait for 20 ns;		-- Teste 117: Erro Duplo 
-- Double error {9, X}
---------------------------------------------- 
		Derr <= "0000000001100000"; 	wait for 20 ns;		-- Teste 118: Erro Duplo 
		Derr <= "0000000001010000"; 	wait for 20 ns;		-- Teste 119: Erro Duplo 
		Derr <= "0000000001001000"; 	wait for 20 ns;		-- Teste 120: Erro Duplo 
		Derr <= "0000000001000100"; 	wait for 20 ns;		-- Teste 121: Erro Duplo 
		Derr <= "0000000001000010"; 	wait for 20 ns;		-- Teste 122: Erro Duplo 
		Derr <= "0000000001000001"; 	wait for 20 ns;		-- Teste 123: Erro Duplo 
-- Double error {10, X}
---------------------------------------------- 
		Derr <= "0000000000110000"; 	wait for 20 ns;		-- Teste 124: Erro Duplo 
		Derr <= "0000000000101000"; 	wait for 20 ns;		-- Teste 125: Erro Duplo 
		Derr <= "0000000000100100"; 	wait for 20 ns;		-- Teste 126: Erro Duplo 
		Derr <= "0000000000100010"; 	wait for 20 ns;		-- Teste 127: Erro Duplo 
		Derr <= "0000000000100001"; 	wait for 20 ns;		-- Teste 128: Erro Duplo 
-- Double error {11, X}
---------------------------------------------- 
		Derr <= "0000000000011000"; 	wait for 20 ns;		-- Teste 129: Erro Duplo 
		Derr <= "0000000000010100"; 	wait for 20 ns;		-- Teste 130: Erro Duplo 
		Derr <= "0000000000010010"; 	wait for 20 ns;		-- Teste 131: Erro Duplo 
		Derr <= "0000000000010001"; 	wait for 20 ns;		-- Teste 132: Erro Duplo 
-- Double error {12, X}
---------------------------------------------- 
		Derr <= "0000000000001100"; 	wait for 20 ns;		-- Teste 133: Erro Duplo 
		Derr <= "0000000000001010"; 	wait for 20 ns;		-- Teste 134: Erro Duplo 
		Derr <= "0000000000001001"; 	wait for 20 ns;		-- Teste 135: Erro Duplo 
-- Double error {13, X}
---------------------------------------------- 
		Derr <= "0000000000000110"; 	wait for 20 ns;		-- Teste 136: Erro Duplo 
		Derr <= "0000000000000101"; 	wait for 20 ns;		-- Teste 137: Erro Duplo 
-- Double error {14, X}
---------------------------------------------- 
		Derr <= "0000000000000011"; 	wait for 20 ns;		-- Teste 138: Erro Duplo 
		wait;
	end process;
end tb;