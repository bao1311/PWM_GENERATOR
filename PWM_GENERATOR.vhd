
library ieee;
use ieee.std_logic_1164.all;
use work.UART_MESSAGES.all;
entity pwm_generator is
    port (
        CLOCK_50 : in  std_logic;
        SW       : in  std_logic_vector(1 downto 0);
        LEDG0    : out std_logic;
        PWM_GPIO : out std_logic;
		  HEX0	  : out std_logic_vector(6 downto 0);
		  HEX1	  : out std_logic_vector(6 downto 0);
		  
		  -- UART
		  UART_TX  : out std_logic
    );
end entity pwm_generator;

architecture rtl of pwm_generator is
	signal CLK_1MHZ : std_logic;
    -- 50 MHz / 10 kHz = 5000 clock cycles
    signal counter : integer range 0 to 4999 := 0;

    -- Number of clock cycles PWM stays HIGH
    signal duty_count : integer range 0 to 5000;

    signal pwm : std_logic;
	 
	 signal PLL_LOCKED	:	std_logic;
	constant MESSAGE	:	string := "HI, I AM BAO";
begin

--entity uart_tx is
--    generic (
--        CLKS_PER_BIT : positive := 5208
--    );
--    port (
--        clk      : in  std_logic;
--        tx_start : in  std_logic;
--        tx_data  : in  std_logic_vector(7 downto 0);
--        tx       : out std_logic;
--        tx_busy  : out std_logic
--    );
--end entity;
	UART: entity work.uart_tx
		port map (
			clk => CLOCK_50,
			tx_start => '1',
			tx_data => HELLO(0),
			tx => UART_TX,
			tx_busy => open
		);

--ENTITY PLL_1MHZ IS
--	PORT
--	(
--		inclk0		: IN STD_LOGIC  := '0';
--		c0		: OUT STD_LOGIC ;
--		locked		: OUT STD_LOGIC 
--	);
--END PLL_1MHZ;
	PLL_1MHZ:	entity work.PLL_1MHZ
		port map (
			inclk0 => CLOCK_50,
			c0 => CLK_1MHZ,
			locked => PLL_LOCKED
		);

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
    process (CLK_1MHZ)
	begin
		if rising_edge(CLK_1MHZ) then
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







