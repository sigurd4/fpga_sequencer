library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity track is
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
        Cox : buffer STD_LOGIC := '0';
        Tox : buffer STD_LOGIC := '0';
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
end track;

architecture Behavioral of track is
    signal Nx : UNSIGNED (9 downto 0) := (others => '0');
    signal Nsx : UNSIGNED (9 downto 0);
    signal C : STD_LOGIC;
    signal R : STD_LOGIC;
    signal Mxl : UNSIGNED (9 downto 0);
    signal Dxl : UNSIGNED (9 downto 0);
    signal b : BOOLEAN;
begin
    Ex <= Em and (not_Etx xor (not_Emx and not_Eex));

    Mxl <= UNSIGNED(resize(Mx, Nx'length));
    Dxl <= UNSIGNED(resize(Dx, Nx'length));

    not_Qx3 <= not Qx(3);

    C <= A18 or Ct;
    R <= B18 or (not (not_Rm and not_Rx));

    A17 <= Tox;
    C16 <= '0';
    C17 <= not Cox;
    B16 <= not C;
    B17 <= '1';
    
    b <= not_Lx = '0' and ((Qx = P1x and ((Um xor Ux) = '1')) or (Qx = P0x and (not (Um xor Ux) = '1')));
    
    Cox <= C when Nsx = 0 else '0';
    
    Nsx <= (Nx + Mxl + Dxl) mod (Dxl + 1);

    process(not_Ax, not_Tix, Sx)
    begin
        if falling_edge(not_Ax) and (not falling_edge(not_Tix)) and (not falling_edge(Sx)) then
            Tox <= not not_Tix;
        end if;
        if falling_edge(not_Tix) and (not falling_edge(Sx)) then
            Tox <= '0';
        end if;
        if ((not falling_edge(not_Ax) and not falling_edge(not_Tix)) or falling_edge(Sx)) then
            Tox <= not ((not_Ax or (not Sx)) and not_Tix);
        end if;
    end process;

    process(C, Cox, R, Dxl)
    begin
        if R = '1' then
            Qx <= "0000";
            Nx <= "0000000000";
        else
            if Ex = '1' then
                if rising_edge(C) then
                    if (Um xor Ux) = '1' then
                        Nx <= (Nx + 1) mod 840;
                    else
                        Nx <= (Nx + 839) mod 840;
                    end if;
                end if;
                if rising_edge(Cox) then
                    if b then
                        Nx <= (others => '0');
                    end if;
                    if (Um xor Ux) = '1' then
                        if Qx = P1x then
                            Qx <= P0x;
                        else
                            Qx <= (Qx + 1) mod 16;
                        end if;
                    else
                        if Qx = P0x then
                            Qx <= P1x;
                        else
                            Qx <= (Qx + 15) mod 16;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;