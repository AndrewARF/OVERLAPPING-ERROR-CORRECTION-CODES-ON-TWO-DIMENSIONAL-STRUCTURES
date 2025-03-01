--===============================================================================================
-- Computes Hamming for the data bit positioning defined in the outer ECC
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OuterHamming is
	Port ( 
			D   : in std_logic_vector(0 to 15);   -- 16-bit data array
			ECC : out std_logic_vector(0 to 4)   -- 5-bit outer ECC array
		);
end OuterHamming;

--
architecture OutHam of OuterHamming is
begin
	ECC(0) <= D(11) xor D(4) xor D(2) xor D(6) xor D(14) xor D(8) xor D(12);
	ECC(1) <= D(7) xor D(5) xor D(15) xor D(10) xor D(3) xor D(9) xor D(6) xor D(14) xor D(8) xor D(12);
	ECC(2) <= D(13) xor D(1) xor D(15) xor D(10) xor D(3) xor D(9) xor D(2) xor D(12);
	ECC(3) <= D(0) xor D(1) xor D(5) xor D(3) xor D(9) xor D(4) xor D(2) xor D(8);
	ECC(4) <= D(0) xor D(13) xor D(1) xor D(7) xor D(5) xor D(10) xor D(9) xor D(11) xor D(4) xor D(2) xor D(14) xor D(12);
end OutHam;


--===============================================================================================
-- Computes Hamming for the data bit positioning defined in the inner ECC
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InnerHamming is
	Port ( 
			D   : in std_logic_vector(0 to 15);   -- 16-bit data array
			ECC : out std_logic_vector(0 to 4)   -- 5-bit inner ECC array
		);
end InnerHamming;

architecture InnHam of InnerHamming is
begin
	ECC(0) <= D(15) xor D(10) xor D(12) xor D(9) xor D(3) xor D(11) xor D(7) xor D(5) xor D(2);
	ECC(1) <= D(8) xor D(13) xor D(1) xor D(4) xor D(9) xor D(3) xor D(11) xor D(7) xor D(5) xor D(2);
	ECC(2) <= D(6) xor D(0) xor D(1) xor D(4) xor D(12) xor D(11) xor D(7) xor D(5) xor D(2);
	ECC(3) <= D(14) xor D(0) xor D(13) xor D(15) xor D(10) xor D(12) xor D(3) xor D(5) xor D(2);
	ECC(4) <= D(14) xor D(6) xor D(8) xor D(4) xor D(10) xor D(12) xor D(9) xor D(3) xor D(7) xor D(2);
end InnHam;


--===============================================================================================
-- Calculates the parity bit of all data bits along with an ECC
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Parity is
	Port ( 
			D  : in std_logic_vector(0 to 15);   -- 16-bit data array
			ECC: in std_logic_vector(0 to 4);    -- 5-bit ECC array
			par: out std_logic                   -- parity bit
		);
end Parity;

architecture Parity of Parity is
begin
	par <= ECC(0) xor ECC(1) xor ECC(2) xor ECC(3) xor ECC(4) xor D(0)  xor D(1)  xor D(2)  xor D(3)  xor D(4)
           xor D(5) xor D(6) xor D(7)   xor D(8)   xor D(9)   xor D(10) xor D(11) xor D(12) xor D(13) xor D(14) xor D(15);
end Parity;


--===============================================================================================
-- Calculates the parity bit of all data bits along with an ECC
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder is
	Port ( 
			D : in std_logic_vector(0 to 15);   -- 16-bit data array
			Co: out std_logic_vector(0 to 4);   -- 5-bit outer ECC array
			Ci: out std_logic_vector(0 to 4);   -- 5-bit inner ECC array
			Po: out std_logic;                  -- parity bit of outer codeword 
			Pi: out std_logic                   -- parity bit of inner codeword 
		);
end Encoder;

architecture Encoder of Encoder is
	signal CoTmp: std_logic_vector(0 to 4);
	signal CiTmp: std_logic_vector(0 to 4);
begin
    -----------------------------------------------------------------------
    OutH: entity work.OuterHamming port map(D => D, ECC => CoTmp);
    OutP: entity work.Parity port map(D => D, ECC => CoTmp, par => Po);
    InH:  entity work.InnerHamming port map(D => D, ECC => CiTmp);
    InP:  entity work.Parity port map(D => D, ECC => CiTmp, par => Pi);

    Co <= CoTmp;
    Ci <= CiTmp;

end Encoder;