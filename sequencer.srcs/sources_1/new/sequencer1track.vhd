library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sequencer1track is
    Port
    (
        P0x : in UNSIGNED (3 downto 0);
        P1x : in UNSIGNED (3 downto 0);
        Um : in STD_LOGIC;
        Ux : in STD_LOGIC;
        not_Eem : in STD_LOGIC;
        not_Eex : in STD_LOGIC;
        not_Emm : in STD_LOGIC;
        not_Emx : in STD_LOGIC;
        not_Etm : in STD_LOGIC;
        not_Etx : in STD_LOGIC;
        Ci : in STD_LOGIC;
        not_Cet : in STD_LOGIC;
        not_Cer : in STD_LOGIC;
        Dx : in UNSIGNED (3 downto 0);
        Mx : in UNSIGNED (3 downto 0);
        not_Lx : in STD_LOGIC;
        not_Ax : in STD_LOGIC;
        Sx : in STD_LOGIC;
        not_Tix : in STD_LOGIC;
        not_Rm : in STD_LOGIC;
        not_Rx : in STD_LOGIC;
        Ct : buffer STD_LOGIC;
        Cox : buffer STD_LOGIC;
        Tox : out STD_LOGIC;
        Em : buffer STD_LOGIC;
        Ex : buffer STD_LOGIC;
        Qx : buffer UNSIGNED (3 downto 0);
        not_Qx3 : out STD_LOGIC;
        A18 : in STD_LOGIC;
        B18 : in STD_LOGIC;
        A17 : out STD_LOGIC;
        C16 : out STD_LOGIC;
        C17 : out STD_LOGIC;
        B16 : out STD_LOGIC;
        B17 : out STD_LOGIC
    );
end sequencer1track;

architecture Behavioral of sequencer1track is
    component master
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
    end component master;

    component track
        Port
        (
            P0x : in UNSIGNED (3 downto 0);
            P1x : in UNSIGNED (3 downto 0);
            not_Eex : in STD_LOGIC;
            not_Emx : in STD_LOGIC;
            not_Etx : in STD_LOGIC;
            Dx : in UNSIGNED (3 downto 0);
            Mx : in UNSIGNED (3 downto 0);
            not_Lx : in STD_LOGIC;
            not_Ax : in STD_LOGIC;
            Sx : in STD_LOGIC;
            not_Tix : in STD_LOGIC;
            Ct : in STD_LOGIC;
            Em : in STD_LOGIC;
            Um : in STD_LOGIC;
            Ux : in STD_LOGIC;
            not_Rm : in STD_LOGIC;
            not_Rx : in STD_LOGIC;
            Cox : buffer STD_LOGIC;
            Tox : out STD_LOGIC := '0';
            Ex : buffer STD_ULOGIC;
            Qx : buffer UNSIGNED (3 downto 0) := (others => '0');
            not_Qx3 : out STD_LOGIC;
            A18 : in STD_LOGIC;
            B18 : in STD_LOGIC;
            A17 : out STD_LOGIC;
            C16 : out STD_LOGIC;
            C17 : out STD_LOGIC;
            B16 : out STD_LOGIC;
            B17 : out STD_LOGIC
        );
    end component track;
begin
    m : master
    port map
    (
        not_Eem => not_Eem,
        not_Emm => not_Emm,
        not_Etm => not_Etm,
        Ci => Ci,
        not_Cet => not_Cet,
        not_Cer => not_Cer,
        Ct => Ct,
        Em => Em
    );
    t : track
    port map
    (
        P0x => P0x,
        P1x => P1x,
        not_Eex => not_Eex,
        not_Emx => not_Emx,
        not_Etx => not_Etx,
        Dx => Dx,
        Mx => Mx,
        not_Lx => not_Lx,
        not_Ax => not_Ax,
        Sx => Sx,
        not_Tix => not_Tix,
        Ct => Ct,
        Em => Em,
        Um => Um,
        Ux => Ux,
        not_Rm => not_Rm,
        not_Rx => not_Rx,
        Cox => Cox,
        Tox => Tox,
        Ex => Ex,
        Qx => Qx,
        not_Qx3 => not_Qx3,
        A18 => A18,
        B18 => B18,
        A17 => A17,
        C16 => C16,
        C17 => C17,
        B16 => B16,
        B17 => B17
    );
end Behavioral;
