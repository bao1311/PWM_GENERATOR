library ieee;
use ieee.std_logic_1164.all;

package uart_messages is

    type byte_array is array (natural range <>)
        of std_logic_vector(7 downto 0);

    constant HELLO : byte_array(0 to 5) := (
        x"48",  -- H
        x"45",  -- E
        x"4C",  -- L
        x"4C",  -- L
        x"4F",  -- O
        x"0A"   -- Newline
    );

end package;