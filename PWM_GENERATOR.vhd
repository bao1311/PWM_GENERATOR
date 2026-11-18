
library ieee;
use ieee.std_logic_1164.all;

entity pwm_generator is
    port (
        CLOCK_50 : in  std_logic;
        SW       : in  std_logic_vector(1 downto 0);
        LEDG0    : out std_logic;
        PWM_GPIO : out std_logic;
		  HEX0	  : out std_logic_vector(6 downto 0);
		  HEX1	  : out std_logic_vector(6 downto 0)
    );
end entity pwm_generator;

architecture rtl of pwm_generator is

    -- 50 MHz / 10 kHz = 5000 clock cycles
    signal counter : integer range 0 to 4999 := 0;

    -- Number of clock cycles PWM stays HIGH
    signal duty_count : integer range 0 to 5000;

    signal pwm : std_logic;

begin

    -- Select duty cycle using switches
    with SW select
        duty_count <= 0    when "00",  -- 0%
                      1250 when "01",  -- 25%
                      2500 when "10",  -- 50%
                      3750 when "11",  -- 75%
                      0    when others;
	 with SW select				 
		  HEX0	<= "1000000" when "00", -- 0%
				   "0010010" when "01", -- 25%
				   "1000000" when "10", -- 50%
				   "0010010" when "11", -- 75%
					"1111111" when others;
	 with SW select
		  HEX1	<= "1000000" when "00", -- 0%
						"0100100" when "01", -- 25%
						"0010010" when "10", -- 50%
						"1111000" when "11", -- 75%
						"1111111" when others;

    -- PWM Counter
    process (CLOCK_50)
	begin
		if rising_edge(CLOCK_50) then
			if counter = 4999 then
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;

    -- PWM Generation
    pwm <= '1' when counter < duty_count else '0';

    -- Outputs
    LEDG0    <= pwm;
    PWM_GPIO <= pwm;

end architecture rtl;







