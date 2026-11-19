library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BlinkyandSwitch is
    Port (
        sw  : in  STD_LOGIC; -- A physical switch
        led : out STD_LOGIC  -- Only LED0
    );
end BlinkyandSwitch;

architecture Behavioral of BlinkyandSwitch is
begin
    -- This creates a direct wire from the switch to the LED
    led <= sw; 
end Behavioral;