--===============================================================================================
-- Compute Syndromes
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Syndromes is
	Port
	(
		C, RC: in std_logic_vector(0 to 4);     -- Read and recomputed Hamming
		P, RP: in std_logic;                    -- Read and recomputed Parity
		sC: out std_logic_vector(0 to 4);       -- Hamming Syndromes
		sP: out std_logic                       -- Parity Syndromes
	);
end Syndromes;

architecture Syndromes of Syndromes is
begin
	sC(0) <= '0' when C(0) = RC(0) else '1';
	sC(1) <= '0' when C(1) = RC(1) else '1';
	sC(2) <= '0' when C(2) = RC(2) else '1';
	sC(3) <= '0' when C(3) = RC(3) else '1';
	sC(4) <= '0' when C(4) = RC(4) else '1';

	sP <= '0' when RP = P else '1';
end Syndromes;

--===============================================================================================
-- Compute SE_DE
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SE_DE is
	Port 
	(
		sCq, sP: in std_logic;
		SEr, DEr: out std_logic
	);
end SE_DE;

architecture SE_DE of SE_DE is
begin
	SEr <= '1' when (sCq = '1' and sP = '1') else '0';
	DEr <= '1' when (sCq = '1' and sP = '0') else '0';
end SE_DE;

--===============================================================================================
-- Compute scalar of Hamming syndromes
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ScalarHamSyn is
	Port 
	(
		sC: in std_logic_vector(0 to 4);
		sCq: out std_logic
	);
end ScalarHamSyn;

architecture ScalarHamSyn of ScalarHamSyn is
begin
	sCq <= '1' when sC(0) = '1' or sC(1) = '1' or sC(2) = '1' or sC(3) = '1' or sC(4) = '1' else '0';
end ScalarHamSyn;

--===============================================================================================
-- Compute Error Address
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ErrorAddress is
	Port 
	(
		sC: in std_logic_vector(0 to 4);
		EAr: out integer
	);
end ErrorAddress;

architecture ErrorAddress of ErrorAddress is
begin
	EAr <= to_integer(unsigned(sC));
end ErrorAddress;

--===============================================================================================
-- Decoder
--===============================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.matrix_package.ALL;

entity Decoder is
	Port
	(
		D: in std_logic_vector(0 to 15);           -- 16-bit data array input
		Co: in std_logic_vector(0 to 4);           -- 5-bit outer ECC array
		Ci: in std_logic_vector(0 to 4);           -- 5-bit inner ECC array
		Po: in std_logic;                          -- parity bit of outer codeword
		Pi: in std_logic;                           -- parity bit of inner codeword
		Dout: out std_logic_vector(0 to 15)        -- 16-bit data array output
	);
end Decoder;

architecture Decoder of Decoder is
	signal RCi, RCo: std_logic_vector(0 to 4); --Hamming/Parity recomputed signals
	signal RPi, RPo: std_logic;

	signal sPi, sPo: std_logic; 		       --Syndrome signals
	signal sCi, sCo: std_logic_vector(0 to 4);
	signal sCiq, sCoq: std_logic;

	signal SErI, SErO: std_logic;              --Single and Double Error flags
	signal DErI, DErO: std_logic;

	signal EArO, EArI: integer;                --Inner and Outer Error Addresses
	
	signal Dtemp, DtempSEI, DtempSEO, DtempDE: std_logic_vector(0 to 15);
	signal addISE, addOSE, addIDE, addODE: integer;
	signal errorPositions: error_positions;

begin
	OutHamRec: entity work.OuterHamming port map(D => D, ECC => RCo);
	InnHamRec: entity work.InnerHamming port map(D => D, ECC => RCi);

	OutParRec: entity work.Parity port map(D => D, ECC => Co, par => RPo);
	InnParRec: entity work.Parity port map(D => D, ECC => Ci, par => RPi);

	InnSyn: entity work.Syndromes port map(C => Ci, RC => RCi, P => Pi, RP => RPi, sC => sCi, sP => sPi);
	OutSyn: entity work.Syndromes port map(C => Co, RC => RCo, P => Po, RP => RPo, sC => sCo, sP => sPo);

	InnScalHamSyn: entity work.ScalarHamSyn port map(sC => sCi, sCq => sCiq);
	OutScalHamSyn: entity work.ScalarHamSyn port map(sC => sCo, sCq => sCoq);

	InnSE_DE: entity work.SE_DE port map(sCq => sCiq, sP => sPi, SEr => SErI, DEr => DErI);
	OutSE_DE: entity work.SE_DE port map(sCq => sCoq, sP => sPo, SEr => SErO, DEr => DErO);

	InnErrAdd: entity work.ErrorAddress port map(sC => sCi,	EAr => EArI);
	OutErrAdd: entity work.ErrorAddress port map(sC => sCo,	EAr => EArO);

	errorPositions <= doubleErrorMap(EArO, EArI) when DErI = '1' and DErO = '1' else (x"00", x"00");
	addIDE <= to_integer(errorPositions(0)) when DErI = '1' and DErO = '1' else -1;
	addODE <= to_integer(errorPositions(1)) when DErI = '1' and DErO = '1' else -1;
	addISE <= to_integer(innerAddTab(EArI)) when SErI = '1' else -1;
	addOSE <= to_integer(outerAddTab(EArO)) when SErO = '1' else -1;
	GenerateSEI: for k in 0 to 15 generate
		DtempSEI(k) <= not D(k) when k = addISE else D(k); 
		DtempSEO(k) <= not D(k) when k = addOSE else D(k); 
		DtempDE(k)  <= not D(k) when k = addIDE or k = addODE else D(k); 
	end generate;

	Dtemp <= DtempSEI when SErI = '1' else
			 DtempSEO when SErO = '1' else
			 DtempDE when DErI = '1' and DErO = '1' else
			 D;

	Dout <= Dtemp when EArI /= 0 and EArO /= 0 else D;
end Decoder;
