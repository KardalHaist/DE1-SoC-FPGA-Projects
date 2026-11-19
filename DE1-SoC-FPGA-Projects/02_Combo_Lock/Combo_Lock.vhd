library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Combo_Lock is
    Port (
        clk      : in  STD_LOGIC;       -- 50MHz Clock (for debouncing)
        btn      : in  STD_LOGIC;       -- KEY0 (The "Enter" button)
        sw       : in  STD_LOGIC_VECTOR(2 downto 0); -- SW0, SW1, SW2 (The code)
        led_lock : out STD_LOGIC;       -- LEDR9 (On = Unlocked)
        led_err  : out STD_LOGIC        -- LEDR0 (On = Wrong Code)
    );
end Combo_Lock;

architecture Behavioral of Combo_Lock is
    -- The "Secret Code" is 1-0-1 (SW2=Up, SW1=Down, SW0=Up)
    constant SECRET_CODE : STD_LOGIC_VECTOR(2 downto 0) := "101";
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Note: Buttons on DE1-SoC are '0' when pressed, '1' when idle
            if btn = '0' then 
                if sw = SECRET_CODE then
                    led_lock <= '1'; -- Success!
                    led_err  <= '0';
                else
                    led_lock <= '0';
                    led_err  <= '1'; -- Wrong code!
                end if;
            end if;
        end if;
    end process;
end Behavioral;