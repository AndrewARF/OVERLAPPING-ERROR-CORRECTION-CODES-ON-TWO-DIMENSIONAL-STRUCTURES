library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package matrix_package is

	type error_positions is array (0 to 1) of signed(7 downto 0);
	type signed_array is array (0 to 31) of signed(7 downto 0);
	type error_map is array (0 to 31, 0 to 31) of error_positions;

	--signal outerAddTab : array(0 to 31) of integer := (-1,-1,-1, 0, -1, 13, -1, 1, -1, 7, -1, 5, 15, 10, 3, 9, -1, 11, -1, 4, -1, -1, -1, 2, 6, 14, 8, -1, -1, 12, -1, -1); --Endereços
	constant outerAddTab : signed_array := 
	(
		to_signed(-1, 8), to_signed(-1, 8), to_signed(-1, 8), to_signed(0, 8), 
		to_signed(-1, 8), to_signed(13, 8), to_signed(-1, 8), to_signed(1, 8),
		to_signed(-1, 8), to_signed(7, 8), to_signed(-1, 8), to_signed(5, 8),
		to_signed(15, 8), to_signed(10, 8), to_signed(3, 8), to_signed(9, 8),
		to_signed(-1, 8), to_signed(11, 8), to_signed(-1, 8), to_signed(4, 8),
		to_signed(-1, 8), to_signed(-1, 8), to_signed(-1, 8), to_signed(2, 8),
		to_signed(6, 8), to_signed(14, 8), to_signed(8, 8), to_signed(-1, 8),
		to_signed(-1, 8), to_signed(12, 8), to_signed(-1, 8), to_signed(-1, 8)
	);

	--signal innerAddTab : array(0 to 31) of integer := (-1,-1,-1, 14, -1, 6, 0, -1, -1, 8, 13, -1, 1, 4, -1, -1, -1, -1, 15, 10, -1, -1, -1, 12, -1, 9, -1, 3, 11, 7, 5, 2);  --Endereços
	constant innerAddTab : signed_array := 
	(
		to_signed(-1, 8), to_signed(-1, 8), to_signed(-1, 8), to_signed(14, 8),
		to_signed(-1, 8), to_signed(6, 8), to_signed(0, 8), to_signed(-1, 8),
		to_signed(-1, 8), to_signed(8, 8), to_signed(13, 8), to_signed(-1, 8),
		to_signed(1, 8), to_signed(4, 8), to_signed(-1, 8), to_signed(-1, 8),
		to_signed(-1, 8), to_signed(-1, 8), to_signed(15, 8), to_signed(10, 8),
		to_signed(-1, 8), to_signed(-1, 8), to_signed(-1, 8), to_signed(12, 8),
		to_signed(-1, 8), to_signed(9, 8), to_signed(-1, 8), to_signed(3, 8),
		to_signed(11, 8), to_signed(7, 8), to_signed(5, 8), to_signed(2, 8)
	);

	constant doubleErrorMap : error_map := 
	(   
		-- Row 0
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		),

		-- Row 1
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(10, 8), to_signed(15, 8)), -- Column 1 
			(to_signed(3, 8), to_signed(9, 8)),   -- Column 2 
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(6, 8), to_signed(14, 8)),  -- Column 6 
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 2
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(5, 8), to_signed(7, 8)),   -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(1, 8), to_signed(13, 8)),  -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(3, 8), to_signed(15, 8)),  -- Column 9
			(to_signed(9, 8), to_signed(10, 8)),  -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(6, 8), to_signed(8, 8)),   -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(4, 8), to_signed(11, 8)),  -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 3
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(3, 8), to_signed(10, 8)),  -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(8, 8), to_signed(14, 8)),  -- Column 10
			(to_signed(9, 8), to_signed(15, 8)),  -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 4
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(5, 8), to_signed(9, 8)),   -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(0, 8), to_signed(1, 8)),   -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(7, 8), to_signed(10, 8)),  -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(2, 8), to_signed(4, 8)),   -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(12, 8), to_signed(14, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 5
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(3, 8), to_signed(5, 8)),   -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(7, 8), to_signed(15, 8)),  -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(6, 8), to_signed(12, 8)),  -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 6
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(2, 8), to_signed(11, 8)),  -- Column 3
			(to_signed(7, 8), to_signed(9, 8)),   -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(0, 8), to_signed(13, 8)),  -- Column 12
			(to_signed(5, 8), to_signed(10, 8)),  -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 7
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(3, 8), to_signed(7, 8)),   -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(5, 8), to_signed(15, 8)),  -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(8, 8), to_signed(12, 8)),  -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 8
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(1, 8), to_signed(9, 8)),   -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(0, 8), to_signed(5, 8)),   -- Column 24
			(to_signed(10, 8), to_signed(13, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(11, 8), to_signed(14, 8))  -- Column 31
		), 

		-- Row 9
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(4, 8), to_signed(8, 8)),   -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(1, 8), to_signed(3, 8)),   -- Column 23
			(to_signed(13, 8), to_signed(15, 8)), -- Column 24
			(to_signed(6, 8), to_signed(11, 8)),  -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 10
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(2, 8), to_signed(12, 8)),  -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(4, 8), to_signed(14, 8)),  -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(9, 8), to_signed(13, 8)),  -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(0, 8), to_signed(7, 8)),   -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(1, 8), to_signed(10, 8))   -- Column 31
		), 

		-- Row 11
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(4, 8), to_signed(6, 8)),   -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(3, 8), to_signed(13, 8)),  -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(8, 8), to_signed(11, 8)),  -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(1, 8), to_signed(15, 8)),  -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 12
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(11, 8), to_signed(12, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(1, 8), to_signed(5, 8)),   -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(7, 8), to_signed(13, 8)),  -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(0, 8), to_signed(9, 8))    -- Column 31
		), 

		-- Row 13
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(2, 8), to_signed(8, 8)),   -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(0, 8), to_signed(3, 8)),   -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		),

		-- Row 14
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(1, 8), to_signed(7, 8)),   -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(5, 8), to_signed(13, 8)),  -- Column 20
			(to_signed(0, 8), to_signed(10, 8)),  -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(4, 8), to_signed(12, 8)),  -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(2, 8), to_signed(14, 8)),  -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 15
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(0, 8), to_signed(15, 8)),  -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(2, 8), to_signed(6, 8)),   -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 16
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(10, 8), to_signed(12, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(0, 8), to_signed(4, 8)),   -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(1, 8), to_signed(2, 8)),   -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(7, 8), to_signed(14, 8)),  -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		),

		-- Row 17
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(12, 8), to_signed(15, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(5, 8), to_signed(8, 8)),   -- Column 23
			(to_signed(6, 8), to_signed(7, 8)),   -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 18
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(9, 8), to_signed(12, 8)),  -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(2, 8), to_signed(13, 8)),  -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(0, 8), to_signed(11, 8)),  -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(5, 8), to_signed(14, 8)),  -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 19
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(3, 8), to_signed(12, 8)),  -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(7, 8), to_signed(8, 8)),   -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(5, 8), to_signed(6, 8)),   -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 20
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(1, 8), to_signed(4, 8)),   -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(7, 8), to_signed(12, 8)),  -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(10, 8), to_signed(14, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(3, 8), to_signed(8, 8)),   -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(11, 8), to_signed(13, 8)), -- Column 22
			(to_signed(6, 8), to_signed(15, 8)),  -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(0, 8), to_signed(2, 8)),   -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 21
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(8, 8), to_signed(9, 8)),   -- Column 16
			(to_signed(14, 8), to_signed(15, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(6, 8), to_signed(10, 8)),  -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 22
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(4, 8), to_signed(13, 8)),  -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(5, 8), to_signed(12, 8)),  -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(1, 8), to_signed(11, 8)),  -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(9, 8), to_signed(14, 8)),  -- Column 26
			(to_signed(8, 8), to_signed(15, 8)),  -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(3, 8), to_signed(6, 8)),   -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 23
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(3, 8), to_signed(14, 8)),  -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(8, 8), to_signed(10, 8)),  -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(6, 8), to_signed(9, 8)),   -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 24
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(7, 8), to_signed(11, 8)),  -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(2, 8), to_signed(9, 8)),   -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(4, 8), to_signed(5, 8)),   -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(12, 8), to_signed(13, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 25
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(2, 8), to_signed(3, 8)),   -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(0, 8), to_signed(8, 8)),   -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 26
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(5, 8), to_signed(11, 8)),  -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(0, 8), to_signed(14, 8)),  -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(2, 8), to_signed(10, 8)),  -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(4, 8), to_signed(7, 8)),   -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(1, 8), to_signed(12, 8)),  -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 27
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(0, 8), to_signed(6, 8)),   -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(2, 8), to_signed(15, 8)),  -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 28
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(2, 8), to_signed(5, 8)),   -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(13, 8), to_signed(14, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(10, 8), to_signed(11, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(4, 8), to_signed(9, 8)),   -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 29
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(1, 8), to_signed(8, 8)),   -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(11, 8), to_signed(15, 8)), -- Column 14
			(to_signed(6, 8), to_signed(13, 8)),  -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(3, 8), to_signed(4, 8)),   -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 30
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(2, 8), to_signed(7, 8)),   -- Column 2
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(9, 8), to_signed(11, 8)),  -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(1, 8), to_signed(14, 8)),  -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(0, 8), to_signed(12, 8)),  -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(4, 8), to_signed(10, 8)),  -- Column 30
			(to_signed(-1, 8), to_signed(-1, 8))  -- Column 31
		), 

		-- Row 31
		(
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 0
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 1
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 2
			(to_signed(8, 8), to_signed(13, 8)),  -- Column 3
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 4
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 5
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 6
			(to_signed(3, 8), to_signed(11, 8)),  -- Column 7
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 8
			(to_signed(1, 8), to_signed(6, 8)),   -- Column 9
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 10
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 11
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 12
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 13
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 14
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 15
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 16
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 17
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 18
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 19
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 20
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 21
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 22
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 23
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 24
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 25
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 26
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 27
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 28
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 29
			(to_signed(-1, 8), to_signed(-1, 8)), -- Column 30
			(to_signed(4, 8), to_signed(15, 8))   -- Column 31
		)
	);
	
end matrix_package;
