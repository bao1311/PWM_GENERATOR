
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tx is
    generic (
        CLKS_PER_BIT : positive := 5208
    );
    port (
        clk      : in  std_logic;
        tx_start : in  std_logic;
        tx_data  : in  std_logic_vector(7 downto 0);
        tx       : out std_logic;
        tx_busy  : out std_logic
    );
end entity;

architecture rtl of uart_tx is

    type state_type is (
        IDLE, START_BIT, DATA_BITS, STOP_BIT
    );

    signal state : state_type := IDLE;

    signal counter : integer
        range 0 to CLKS_PER_BIT-1 := 0;

    signal bit_index : integer range 0 to 7 := 0;

    signal data_reg :
        std_logic_vector(7 downto 0)
        := (others => '0');

begin

    tx_busy <= '0' when state = IDLE else '1';

    process(clk)
    begin
        if rising_edge(clk) then

            case state is

                when IDLE =>
                    tx <= '1';
                    counter <= 0;
                    bit_index <= 0;

                    if tx_start = '1' then
                        data_reg <= tx_data;
                        state <= START_BIT;
                    end if;

                when START_BIT =>
                    tx <= '0';

                    if counter = CLKS_PER_BIT-1 then
                        counter <= 0;
                        state <= DATA_BITS;
                    else
                        counter <= counter + 1;
                    end if;

                when DATA_BITS =>
                    tx <= data_reg(bit_index);

                    if counter = CLKS_PER_BIT-1 then
                        counter <= 0;

                        if bit_index = 7 then
                            state <= STOP_BIT;
                        else
                            bit_index <= bit_index + 1;
                        end if;
                    else
                        counter <= counter + 1;
                    end if;

                when STOP_BIT =>
                    tx <= '1';

                    if counter = CLKS_PER_BIT-1 then
                        counter <= 0;
                        state <= IDLE;
                    else
                        counter <= counter + 1;
                    end if;

            end case;
        end if;
    end process;

end architecture;
