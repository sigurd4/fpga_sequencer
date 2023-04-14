library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sequencer3track is
    Port
    (
        P0a : in UNSIGNED (3 downto 0);
        P0b : in UNSIGNED (3 downto 0);
        P0c : in UNSIGNED (3 downto 0);
        P1a : in UNSIGNED (3 downto 0);
        P1b : in UNSIGNED (3 downto 0);
        P1c : in UNSIGNED (3 downto 0);
        Um : in STD_LOGIC;
        Ua : in STD_LOGIC;
        Ub : in STD_LOGIC;
        Uc : in STD_LOGIC;
        not_Eem : in STD_LOGIC;
        not_Eea : in STD_LOGIC;
        not_Eeb : in STD_LOGIC;
        not_Eec : in STD_LOGIC;
        not_Emm : in STD_LOGIC;
        not_Ema : in STD_LOGIC;
        not_Emb : in STD_LOGIC;
        not_Emc : in STD_LOGIC;
        not_Etm : in STD_LOGIC;
        not_Eta : in STD_LOGIC;
        not_Etb : in STD_LOGIC;
        not_Etc : in STD_LOGIC;
        Ci : in STD_LOGIC;
        not_Cet : in STD_LOGIC;
        not_Cer : in STD_LOGIC;
        Da : in UNSIGNED (3 downto 0);
        Db : in UNSIGNED (3 downto 0);
        Dc : in UNSIGNED (3 downto 0);
        Ma : in UNSIGNED (3 downto 0);
        Mb : in UNSIGNED (3 downto 0);
        Mc : in UNSIGNED (3 downto 0);
        not_La : in STD_LOGIC;
        not_Lb : in STD_LOGIC;
        not_Lc : in STD_LOGIC;
        not_Aa : in STD_LOGIC;
        not_Ab : in STD_LOGIC;
        not_Ac : in STD_LOGIC;
        Sa : in STD_LOGIC;
        Sb : in STD_LOGIC;
        Sc : in STD_LOGIC;
        not_Tia : in STD_LOGIC;
        not_Tib : in STD_LOGIC;
        not_Tic : in STD_LOGIC;
        not_Rm : in STD_LOGIC;
        not_Ra : in STD_LOGIC;
        not_Rb : in STD_LOGIC;
        not_Rc : in STD_LOGIC;
        Ct : buffer STD_LOGIC;
        Coa : out STD_LOGIC;
        Cob : out STD_LOGIC;
        Coc : out STD_LOGIC;
        Toa : out STD_LOGIC;
        Tob : out STD_LOGIC;
        Toc : out STD_LOGIC;
        Em : buffer STD_LOGIC;
        Ea : out STD_LOGIC;
        Eb : out STD_LOGIC;
        Ec : out STD_LOGIC;
        Qa : out UNSIGNED (3 downto 0);
        Qb : out UNSIGNED (3 downto 0);
        Qc : out UNSIGNED (3 downto 0);
        not_Qa3 : out STD_LOGIC;
        not_Qb3 : out STD_LOGIC;
        not_Qc3 : out STD_LOGIC
    );
end sequencer3track;

architecture Behavioral of sequencer3track is
    component master
        Port
        (
            not_Eem : in STD_LOGIC;
            not_Emm : in STD_LOGIC;
            not_Etm : in STD_LOGIC;
            Ci : in STD_LOGIC;
            not_Cet : in STD_LOGIC;
            not_Cer : in STD_LOGIC;
            Ct : out STD_LOGIC;
            Em : out STD_LOGIC
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
    ta : track
    port map
    (
        P0x => P0a,
        P1x => P1a,
        not_Eex => not_Eea,
        not_Emx => not_Ema,
        not_Etx => not_Eta,
        Dx => Da,
        Mx => Ma,
        not_Lx => not_La,
        not_Ax => not_Aa,
        Sx => Sa,
        not_Tix => not_Tia,
        Ct => Ct,
        Em => Em,
        Um => Um,
        Ux => Ua,
        not_Rm => not_Rm,
        not_Rx => not_Ra,
        Cox => Coa,
        Tox => Toa,
        Ex => Ea,
        Qx => Qa,
        not_Qx3 => not_Qa3,
        A18 => '0',
        B18 => '0'
    );
    tb : track
    port map
    (
        P0x => P0b,
        P1x => P1b,
        not_Eex => not_Eeb,
        not_Emx => not_Ema,
        not_Etx => not_Etb,
        Dx => Db,
        Mx => Mb,
        not_Lx => not_Lb,
        not_Ax => not_Ab,
        Sx => Sb,
        not_Tix => not_Tib,
        Ct => Ct,
        Em => Em,
        Um => Um,
        Ux => Ub,
        not_Rm => not_Rm,
        not_Rx => not_Rb,
        Cox => Cob,
        Tox => Tob,
        Ex => Eb,
        Qx => Qb,
        not_Qx3 => not_Qb3,
        A18 => '0',
        B18 => '0'
    );
    tc : track
    port map
    (
        P0x => P0c,
        P1x => P1c,
        not_Eex => not_Eec,
        not_Emx => not_Emc,
        not_Etx => not_Etc,
        Dx => Dc,
        Mx => Mc,
        not_Lx => not_Lc,
        not_Ax => not_Ac,
        Sx => Sc,
        not_Tix => not_Tic,
        Ct => Ct,
        Em => Em,
        Um => Um,
        Ux => Uc,
        not_Rm => not_Rm,
        not_Rx => not_Rc,
        Cox => Coc,
        Tox => Toc,
        Ex => Ec,
        Qx => Qc,
        not_Qx3 => not_Qc3,
        A18 => '0',
        B18 => '0'
    );
end Behavioral;
