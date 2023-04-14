library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master is
    Port
    (
        not_Eem : in STD_LOGIC;
        not_Emm : in STD_LOGIC;
        not_Etm : in STD_LOGIC;
        Ci : in STD_LOGIC;
        not_Cet : in STD_LOGIC;
        not_Cer : in STD_LOGIC;
        Ct : buffer STD_LOGIC;
        Em : buffer STD_LOGIC
    );
end master;

architecture Behavioral of master is
    begin
        Ct <= (Ci and (not not_Cer)) or (not_Cer and (not not_Cet));
        Em <= not_Etm xor (not_Emm and not_Eem);
end Behavioral;
