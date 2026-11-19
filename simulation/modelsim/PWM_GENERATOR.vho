-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/18/2026 22:12:09"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	pwm_generator IS
    PORT (
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(1 DOWNTO 0);
	LEDG0 : BUFFER std_logic;
	PWM_GPIO : BUFFER std_logic;
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	UART_TX : BUFFER std_logic
	);
END pwm_generator;

-- Design Ports Information
-- LEDG0	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PWM_GPIO	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UART_TX	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF pwm_generator IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_LEDG0 : std_logic;
SIGNAL ww_PWM_GPIO : std_logic;
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_UART_TX : std_logic;
SIGNAL \PLL_1MHZ|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \PLL_1MHZ|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \counter~2_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \counter~4_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \counter~3_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \counter~0_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \counter~1_combout\ : std_logic;
SIGNAL \LessThan0~10_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \LessThan0~9_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~11_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \UART|Add0~0_combout\ : std_logic;
SIGNAL \UART|Selector13~0_combout\ : std_logic;
SIGNAL \UART|Add0~1\ : std_logic;
SIGNAL \UART|Add0~2_combout\ : std_logic;
SIGNAL \UART|Selector12~0_combout\ : std_logic;
SIGNAL \UART|Add0~3\ : std_logic;
SIGNAL \UART|Add0~4_combout\ : std_logic;
SIGNAL \UART|Selector11~0_combout\ : std_logic;
SIGNAL \UART|Add0~5\ : std_logic;
SIGNAL \UART|Add0~6_combout\ : std_logic;
SIGNAL \UART|Selector10~0_combout\ : std_logic;
SIGNAL \UART|Add0~7\ : std_logic;
SIGNAL \UART|Add0~8_combout\ : std_logic;
SIGNAL \UART|Selector9~0_combout\ : std_logic;
SIGNAL \UART|Add0~9\ : std_logic;
SIGNAL \UART|Add0~10_combout\ : std_logic;
SIGNAL \UART|Selector8~0_combout\ : std_logic;
SIGNAL \UART|Add0~11\ : std_logic;
SIGNAL \UART|Add0~12_combout\ : std_logic;
SIGNAL \UART|Selector7~0_combout\ : std_logic;
SIGNAL \UART|Add0~13\ : std_logic;
SIGNAL \UART|Add0~14_combout\ : std_logic;
SIGNAL \UART|Selector6~0_combout\ : std_logic;
SIGNAL \UART|Add0~15\ : std_logic;
SIGNAL \UART|Add0~16_combout\ : std_logic;
SIGNAL \UART|Selector5~0_combout\ : std_logic;
SIGNAL \UART|Add0~17\ : std_logic;
SIGNAL \UART|Add0~18_combout\ : std_logic;
SIGNAL \UART|Selector4~0_combout\ : std_logic;
SIGNAL \UART|Add0~19\ : std_logic;
SIGNAL \UART|Add0~20_combout\ : std_logic;
SIGNAL \UART|Selector3~0_combout\ : std_logic;
SIGNAL \UART|Add0~21\ : std_logic;
SIGNAL \UART|Add0~22_combout\ : std_logic;
SIGNAL \UART|Selector2~0_combout\ : std_logic;
SIGNAL \UART|Equal0~2_combout\ : std_logic;
SIGNAL \UART|Equal0~0_combout\ : std_logic;
SIGNAL \UART|Equal0~1_combout\ : std_logic;
SIGNAL \UART|Add0~23\ : std_logic;
SIGNAL \UART|Add0~24_combout\ : std_logic;
SIGNAL \UART|Selector1~0_combout\ : std_logic;
SIGNAL \UART|Equal0~3_combout\ : std_logic;
SIGNAL \UART|Selector19~0_combout\ : std_logic;
SIGNAL \UART|Selector18~2_combout\ : std_logic;
SIGNAL \UART|state.START_BIT~q\ : std_logic;
SIGNAL \UART|Selector19~1_combout\ : std_logic;
SIGNAL \UART|state.DATA_BITS~q\ : std_logic;
SIGNAL \UART|Selector14~0_combout\ : std_logic;
SIGNAL \UART|Selector15~0_combout\ : std_logic;
SIGNAL \UART|Selector15~1_combout\ : std_logic;
SIGNAL \UART|Selector0~2_combout\ : std_logic;
SIGNAL \UART|Selector14~1_combout\ : std_logic;
SIGNAL \UART|bit_index~0_combout\ : std_logic;
SIGNAL \UART|Selector16~0_combout\ : std_logic;
SIGNAL \UART|Selector16~1_combout\ : std_logic;
SIGNAL \UART|Selector18~1_combout\ : std_logic;
SIGNAL \UART|Selector20~0_combout\ : std_logic;
SIGNAL \UART|state.STOP_BIT~q\ : std_logic;
SIGNAL \UART|Selector19~2_combout\ : std_logic;
SIGNAL \UART|state.IDLE~q\ : std_logic;
SIGNAL \UART|data_reg[3]~0_combout\ : std_logic;
SIGNAL \UART|Selector0~0_combout\ : std_logic;
SIGNAL \UART|Selector0~1_combout\ : std_logic;
SIGNAL \UART|tx~q\ : std_logic;
SIGNAL \UART|data_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \UART|counter\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \UART|bit_index\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL counter : std_logic_vector(12 DOWNTO 0);
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
LEDG0 <= ww_LEDG0;
PWM_GPIO <= ww_PWM_GPIO;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
UART_TX <= ww_UART_TX;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\PLL_1MHZ|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk\(0) <= \PLL_1MHZ|altpll_component|auto_generated|pll1_CLK_bus\(0);
\PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk\(1) <= \PLL_1MHZ|altpll_component|auto_generated|pll1_CLK_bus\(1);
\PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk\(2) <= \PLL_1MHZ|altpll_component|auto_generated|pll1_CLK_bus\(2);
\PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk\(3) <= \PLL_1MHZ|altpll_component|auto_generated|pll1_CLK_bus\(3);
\PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk\(4) <= \PLL_1MHZ|altpll_component|auto_generated|pll1_CLK_bus\(4);

\PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk\(0));

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;

-- Location: IOOBUF_X0_Y20_N9
\LEDG0~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LessThan0~11_combout\,
	devoe => ww_devoe,
	o => ww_LEDG0);

-- Location: IOOBUF_X28_Y0_N16
\PWM_GPIO~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LessThan0~11_combout\,
	devoe => ww_devoe,
	o => ww_PWM_GPIO);

-- Location: IOOBUF_X21_Y29_N23
\HEX0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX0(0));

-- Location: IOOBUF_X21_Y29_N30
\HEX0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => ww_HEX0(1));

-- Location: IOOBUF_X26_Y29_N2
\HEX0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX0(2));

-- Location: IOOBUF_X28_Y29_N30
\HEX0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX0(3));

-- Location: IOOBUF_X26_Y29_N9
\HEX0[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => ww_HEX0(4));

-- Location: IOOBUF_X28_Y29_N23
\HEX0[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX0(5));

-- Location: IOOBUF_X26_Y29_N16
\HEX0[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SW[0]~input_o\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

-- Location: IOOBUF_X21_Y29_N2
\HEX1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(0));

-- Location: IOOBUF_X21_Y29_N9
\HEX1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(1));

-- Location: IOOBUF_X23_Y29_N2
\HEX1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~1_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(2));

-- Location: IOOBUF_X23_Y29_N23
\HEX1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~2_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(3));

-- Location: IOOBUF_X23_Y29_N30
\HEX1[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[1]~input_o\,
	devoe => ww_devoe,
	o => ww_HEX1(4));

-- Location: IOOBUF_X28_Y29_N16
\HEX1[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => ww_HEX1(5));

-- Location: IOOBUF_X26_Y29_N23
\HEX1[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(6));

-- Location: IOOBUF_X3_Y0_N30
\UART_TX~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \UART|tx~q\,
	devoe => ww_devoe,
	o => ww_UART_TX);

-- Location: IOIBUF_X0_Y24_N1
\SW[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X41_Y15_N1
\CLOCK_50~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: PLL_2
\PLL_1MHZ|altpll_component|auto_generated|pll1\ : cycloneiii_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 250,
	c0_initial => 1,
	c0_low => 250,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 50,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 10,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 5738,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 250,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \PLL_1MHZ|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \PLL_1MHZ|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G8
\PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X24_Y8_N4
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = counter(0) $ (VCC)
-- \Add0~1\ = CARRY(counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: FF_X24_Y8_N5
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LCCOMB_X24_Y8_N6
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (counter(1) & (!\Add0~1\)) # (!counter(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: FF_X24_Y8_N7
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X24_Y8_N8
\Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (counter(2) & (\Add0~3\ $ (GND))) # (!counter(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((counter(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: FF_X24_Y8_N9
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: LCCOMB_X24_Y8_N10
\Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (counter(3) & (!\Add0~5\)) # (!counter(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X24_Y8_N20
\Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (counter(8) & (\Add0~15\ $ (GND))) # (!counter(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((counter(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X24_Y8_N22
\Add0~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (counter(9) & (!\Add0~17\)) # (!counter(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X24_Y8_N2
\counter~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter~2_combout\ = (\Add0~18_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~18_combout\,
	datad => \Equal0~3_combout\,
	combout => \counter~2_combout\);

-- Location: FF_X24_Y8_N3
\counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(9));

-- Location: LCCOMB_X24_Y8_N30
\Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!counter(6) & (counter(0) & (!counter(5) & counter(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(6),
	datab => counter(0),
	datac => counter(5),
	datad => counter(9),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X19_Y10_N4
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!counter(3) & (counter(7) & (!counter(4) & counter(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datab => counter(7),
	datac => counter(4),
	datad => counter(8),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X24_Y8_N24
\Add0~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (counter(10) & (\Add0~19\ $ (GND))) # (!counter(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((counter(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: FF_X24_Y8_N25
\counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(10));

-- Location: LCCOMB_X24_Y8_N26
\Add0~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (counter(11) & (!\Add0~21\)) # (!counter(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: FF_X24_Y8_N27
\counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(11));

-- Location: LCCOMB_X19_Y10_N14
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (counter(2) & (counter(1) & (!counter(11) & !counter(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datab => counter(1),
	datac => counter(11),
	datad => counter(10),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X24_Y8_N28
\Add0~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = \Add0~23\ $ (!counter(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => counter(12),
	cin => \Add0~23\,
	combout => \Add0~24_combout\);

-- Location: LCCOMB_X29_Y14_N28
\counter~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter~4_combout\ = (\Add0~24_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~24_combout\,
	datac => \Equal0~3_combout\,
	combout => \counter~4_combout\);

-- Location: FF_X29_Y14_N29
\counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(12));

-- Location: LCCOMB_X29_Y14_N30
\Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (\Equal0~2_combout\ & (\Equal0~0_combout\ & (\Equal0~1_combout\ & counter(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => counter(12),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X29_Y14_N26
\counter~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter~3_combout\ = (\Add0~6_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datac => \Equal0~3_combout\,
	combout => \counter~3_combout\);

-- Location: FF_X29_Y14_N27
\counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: LCCOMB_X24_Y8_N12
\Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (counter(4) & (\Add0~7\ $ (GND))) # (!counter(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((counter(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: FF_X24_Y8_N13
\counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(4));

-- Location: LCCOMB_X24_Y8_N14
\Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (counter(5) & (!\Add0~9\)) # (!counter(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: FF_X24_Y8_N15
\counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(5));

-- Location: LCCOMB_X24_Y8_N16
\Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (counter(6) & (\Add0~11\ $ (GND))) # (!counter(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((counter(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: FF_X24_Y8_N17
\counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(6));

-- Location: LCCOMB_X24_Y8_N18
\Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (counter(7) & (!\Add0~13\)) # (!counter(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X24_Y8_N0
\counter~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter~0_combout\ = (\Add0~14_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~14_combout\,
	datad => \Equal0~3_combout\,
	combout => \counter~0_combout\);

-- Location: FF_X24_Y8_N1
\counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(7));

-- Location: LCCOMB_X29_Y14_N24
\counter~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter~1_combout\ = (\Add0~16_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datac => \Equal0~3_combout\,
	combout => \counter~1_combout\);

-- Location: FF_X29_Y14_N25
\counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_1MHZ|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(8));

-- Location: LCCOMB_X19_Y10_N20
\LessThan0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~10_combout\ = (\SW[0]~input_o\ & !counter(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[0]~input_o\,
	datad => counter(8),
	combout => \LessThan0~10_combout\);

-- Location: LCCOMB_X19_Y10_N26
\LessThan0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (counter(9)) # (counter(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(9),
	datac => counter(11),
	combout => \LessThan0~5_combout\);

-- Location: IOIBUF_X0_Y27_N1
\SW[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LCCOMB_X19_Y10_N28
\LessThan0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (counter(6) & ((counter(1)) # (counter(2)))) # (!counter(6) & (counter(1) & counter(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(6),
	datac => counter(1),
	datad => counter(2),
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X19_Y10_N22
\LessThan0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = (counter(3)) # ((\LessThan0~6_combout\) # (counter(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datab => \LessThan0~6_combout\,
	datac => counter(4),
	combout => \LessThan0~7_combout\);

-- Location: LCCOMB_X19_Y10_N8
\LessThan0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (\LessThan0~5_combout\ & ((counter(6)) # ((\LessThan0~7_combout\ & counter(5))))) # (!\LessThan0~5_combout\ & (counter(6) & (\LessThan0~7_combout\ & counter(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~5_combout\,
	datab => counter(6),
	datac => \LessThan0~7_combout\,
	datad => counter(5),
	combout => \LessThan0~8_combout\);

-- Location: LCCOMB_X19_Y10_N18
\LessThan0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~9_combout\ = (\LessThan0~5_combout\ & (\SW[1]~input_o\ & ((!counter(7)) # (!\LessThan0~8_combout\)))) # (!\LessThan0~5_combout\ & (((!counter(7)) # (!\LessThan0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~5_combout\,
	datab => \SW[1]~input_o\,
	datac => \LessThan0~8_combout\,
	datad => counter(7),
	combout => \LessThan0~9_combout\);

-- Location: LCCOMB_X19_Y10_N16
\LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ((!counter(8)) # (!counter(6))) # (!counter(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(7),
	datac => counter(6),
	datad => counter(8),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X19_Y10_N2
\LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (counter(5)) # ((counter(4)) # ((counter(3)) # (counter(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(5),
	datab => counter(4),
	datac => counter(3),
	datad => counter(2),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X19_Y10_N12
\LessThan0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (counter(9)) # ((!\LessThan0~0_combout\ & (\LessThan0~1_combout\ & !counter(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \LessThan0~1_combout\,
	datac => counter(9),
	datad => counter(10),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X19_Y10_N6
\LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\SW[1]~input_o\ & ((\LessThan0~2_combout\ & ((counter(10)) # (!\SW[0]~input_o\))) # (!\LessThan0~2_combout\ & (!\SW[0]~input_o\ & counter(10))))) # (!\SW[1]~input_o\ & (((\SW[0]~input_o\ & !counter(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => \SW[1]~input_o\,
	datac => \SW[0]~input_o\,
	datad => counter(10),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X19_Y10_N0
\LessThan0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (\LessThan0~3_combout\ & ((!counter(11)))) # (!\LessThan0~3_combout\ & (\SW[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~3_combout\,
	datab => \SW[1]~input_o\,
	datac => counter(11),
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X19_Y10_N30
\LessThan0~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~11_combout\ = (!counter(12) & ((\LessThan0~4_combout\) # ((\LessThan0~10_combout\ & \LessThan0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~10_combout\,
	datab => \LessThan0~9_combout\,
	datac => counter(12),
	datad => \LessThan0~4_combout\,
	combout => \LessThan0~11_combout\);

-- Location: LCCOMB_X19_Y10_N24
\Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!\SW[0]~input_o\ & \SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X19_Y10_N10
\Mux1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\SW[0]~input_o\ & !\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X24_Y28_N0
\Mux1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = (\SW[0]~input_o\ & \SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux1~2_combout\);

-- Location: LCCOMB_X24_Y28_N10
\Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = \SW[0]~input_o\ $ (\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: CLKCTRL_G9
\CLOCK_50~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X33_Y12_N6
\UART|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~0_combout\ = \UART|counter\(0) $ (VCC)
-- \UART|Add0~1\ = CARRY(\UART|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(0),
	datad => VCC,
	combout => \UART|Add0~0_combout\,
	cout => \UART|Add0~1\);

-- Location: LCCOMB_X33_Y18_N26
\UART|Selector13~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector13~0_combout\ = (\UART|Add0~0_combout\ & \UART|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|Add0~0_combout\,
	datac => \UART|state.IDLE~q\,
	combout => \UART|Selector13~0_combout\);

-- Location: FF_X33_Y18_N27
\UART|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(0));

-- Location: LCCOMB_X33_Y12_N8
\UART|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~2_combout\ = (\UART|counter\(1) & (!\UART|Add0~1\)) # (!\UART|counter\(1) & ((\UART|Add0~1\) # (GND)))
-- \UART|Add0~3\ = CARRY((!\UART|Add0~1\) # (!\UART|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(1),
	datad => VCC,
	cin => \UART|Add0~1\,
	combout => \UART|Add0~2_combout\,
	cout => \UART|Add0~3\);

-- Location: LCCOMB_X33_Y18_N12
\UART|Selector12~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector12~0_combout\ = (\UART|state.IDLE~q\ & \UART|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datac => \UART|Add0~2_combout\,
	combout => \UART|Selector12~0_combout\);

-- Location: FF_X33_Y18_N13
\UART|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(1));

-- Location: LCCOMB_X33_Y12_N10
\UART|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~4_combout\ = (\UART|counter\(2) & (\UART|Add0~3\ $ (GND))) # (!\UART|counter\(2) & (!\UART|Add0~3\ & VCC))
-- \UART|Add0~5\ = CARRY((\UART|counter\(2) & !\UART|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(2),
	datad => VCC,
	cin => \UART|Add0~3\,
	combout => \UART|Add0~4_combout\,
	cout => \UART|Add0~5\);

-- Location: LCCOMB_X33_Y12_N0
\UART|Selector11~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector11~0_combout\ = (\UART|Add0~4_combout\ & \UART|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Add0~4_combout\,
	datad => \UART|state.IDLE~q\,
	combout => \UART|Selector11~0_combout\);

-- Location: FF_X33_Y12_N1
\UART|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(2));

-- Location: LCCOMB_X33_Y12_N12
\UART|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~6_combout\ = (\UART|counter\(3) & (!\UART|Add0~5\)) # (!\UART|counter\(3) & ((\UART|Add0~5\) # (GND)))
-- \UART|Add0~7\ = CARRY((!\UART|Add0~5\) # (!\UART|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(3),
	datad => VCC,
	cin => \UART|Add0~5\,
	combout => \UART|Add0~6_combout\,
	cout => \UART|Add0~7\);

-- Location: LCCOMB_X33_Y18_N14
\UART|Selector10~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector10~0_combout\ = (\UART|state.IDLE~q\ & (!\UART|Equal0~3_combout\ & \UART|Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datac => \UART|Equal0~3_combout\,
	datad => \UART|Add0~6_combout\,
	combout => \UART|Selector10~0_combout\);

-- Location: FF_X33_Y18_N15
\UART|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(3));

-- Location: LCCOMB_X33_Y12_N14
\UART|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~8_combout\ = (\UART|counter\(4) & (\UART|Add0~7\ $ (GND))) # (!\UART|counter\(4) & (!\UART|Add0~7\ & VCC))
-- \UART|Add0~9\ = CARRY((\UART|counter\(4) & !\UART|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(4),
	datad => VCC,
	cin => \UART|Add0~7\,
	combout => \UART|Add0~8_combout\,
	cout => \UART|Add0~9\);

-- Location: LCCOMB_X33_Y18_N2
\UART|Selector9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector9~0_combout\ = (\UART|state.IDLE~q\ & (!\UART|Equal0~3_combout\ & \UART|Add0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datac => \UART|Equal0~3_combout\,
	datad => \UART|Add0~8_combout\,
	combout => \UART|Selector9~0_combout\);

-- Location: FF_X33_Y18_N3
\UART|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(4));

-- Location: LCCOMB_X33_Y12_N16
\UART|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~10_combout\ = (\UART|counter\(5) & (!\UART|Add0~9\)) # (!\UART|counter\(5) & ((\UART|Add0~9\) # (GND)))
-- \UART|Add0~11\ = CARRY((!\UART|Add0~9\) # (!\UART|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(5),
	datad => VCC,
	cin => \UART|Add0~9\,
	combout => \UART|Add0~10_combout\,
	cout => \UART|Add0~11\);

-- Location: LCCOMB_X33_Y12_N2
\UART|Selector8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector8~0_combout\ = (\UART|Add0~10_combout\ & \UART|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|Add0~10_combout\,
	datad => \UART|state.IDLE~q\,
	combout => \UART|Selector8~0_combout\);

-- Location: FF_X33_Y12_N3
\UART|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(5));

-- Location: LCCOMB_X33_Y12_N18
\UART|Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~12_combout\ = (\UART|counter\(6) & (\UART|Add0~11\ $ (GND))) # (!\UART|counter\(6) & (!\UART|Add0~11\ & VCC))
-- \UART|Add0~13\ = CARRY((\UART|counter\(6) & !\UART|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \UART|counter\(6),
	datad => VCC,
	cin => \UART|Add0~11\,
	combout => \UART|Add0~12_combout\,
	cout => \UART|Add0~13\);

-- Location: LCCOMB_X33_Y18_N20
\UART|Selector7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector7~0_combout\ = (\UART|state.IDLE~q\ & (!\UART|Equal0~3_combout\ & \UART|Add0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datac => \UART|Equal0~3_combout\,
	datad => \UART|Add0~12_combout\,
	combout => \UART|Selector7~0_combout\);

-- Location: FF_X33_Y18_N21
\UART|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(6));

-- Location: LCCOMB_X33_Y12_N20
\UART|Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~14_combout\ = (\UART|counter\(7) & (!\UART|Add0~13\)) # (!\UART|counter\(7) & ((\UART|Add0~13\) # (GND)))
-- \UART|Add0~15\ = CARRY((!\UART|Add0~13\) # (!\UART|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \UART|counter\(7),
	datad => VCC,
	cin => \UART|Add0~13\,
	combout => \UART|Add0~14_combout\,
	cout => \UART|Add0~15\);

-- Location: LCCOMB_X33_Y18_N30
\UART|Selector6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector6~0_combout\ = (\UART|state.IDLE~q\ & \UART|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datad => \UART|Add0~14_combout\,
	combout => \UART|Selector6~0_combout\);

-- Location: FF_X33_Y18_N31
\UART|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(7));

-- Location: LCCOMB_X33_Y12_N22
\UART|Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~16_combout\ = (\UART|counter\(8) & (\UART|Add0~15\ $ (GND))) # (!\UART|counter\(8) & (!\UART|Add0~15\ & VCC))
-- \UART|Add0~17\ = CARRY((\UART|counter\(8) & !\UART|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(8),
	datad => VCC,
	cin => \UART|Add0~15\,
	combout => \UART|Add0~16_combout\,
	cout => \UART|Add0~17\);

-- Location: LCCOMB_X33_Y18_N22
\UART|Selector5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector5~0_combout\ = (\UART|Add0~16_combout\ & \UART|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|Add0~16_combout\,
	datac => \UART|state.IDLE~q\,
	combout => \UART|Selector5~0_combout\);

-- Location: FF_X33_Y18_N23
\UART|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(8));

-- Location: LCCOMB_X33_Y12_N24
\UART|Add0~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~18_combout\ = (\UART|counter\(9) & (!\UART|Add0~17\)) # (!\UART|counter\(9) & ((\UART|Add0~17\) # (GND)))
-- \UART|Add0~19\ = CARRY((!\UART|Add0~17\) # (!\UART|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(9),
	datad => VCC,
	cin => \UART|Add0~17\,
	combout => \UART|Add0~18_combout\,
	cout => \UART|Add0~19\);

-- Location: LCCOMB_X33_Y12_N4
\UART|Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector4~0_combout\ = (\UART|Add0~18_combout\ & \UART|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|Add0~18_combout\,
	datad => \UART|state.IDLE~q\,
	combout => \UART|Selector4~0_combout\);

-- Location: FF_X33_Y12_N5
\UART|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(9));

-- Location: LCCOMB_X33_Y12_N26
\UART|Add0~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~20_combout\ = (\UART|counter\(10) & (\UART|Add0~19\ $ (GND))) # (!\UART|counter\(10) & (!\UART|Add0~19\ & VCC))
-- \UART|Add0~21\ = CARRY((\UART|counter\(10) & !\UART|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \UART|counter\(10),
	datad => VCC,
	cin => \UART|Add0~19\,
	combout => \UART|Add0~20_combout\,
	cout => \UART|Add0~21\);

-- Location: LCCOMB_X33_Y18_N28
\UART|Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector3~0_combout\ = (\UART|state.IDLE~q\ & (!\UART|Equal0~3_combout\ & \UART|Add0~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datac => \UART|Equal0~3_combout\,
	datad => \UART|Add0~20_combout\,
	combout => \UART|Selector3~0_combout\);

-- Location: FF_X33_Y18_N29
\UART|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(10));

-- Location: LCCOMB_X33_Y12_N28
\UART|Add0~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~22_combout\ = (\UART|counter\(11) & (!\UART|Add0~21\)) # (!\UART|counter\(11) & ((\UART|Add0~21\) # (GND)))
-- \UART|Add0~23\ = CARRY((!\UART|Add0~21\) # (!\UART|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(11),
	datad => VCC,
	cin => \UART|Add0~21\,
	combout => \UART|Add0~22_combout\,
	cout => \UART|Add0~23\);

-- Location: LCCOMB_X33_Y18_N24
\UART|Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector2~0_combout\ = (\UART|state.IDLE~q\ & \UART|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datac => \UART|Add0~22_combout\,
	combout => \UART|Selector2~0_combout\);

-- Location: FF_X33_Y18_N25
\UART|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(11));

-- Location: LCCOMB_X33_Y18_N10
\UART|Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Equal0~2_combout\ = (!\UART|counter\(9) & (!\UART|counter\(11) & (!\UART|counter\(8) & \UART|counter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|counter\(9),
	datab => \UART|counter\(11),
	datac => \UART|counter\(8),
	datad => \UART|counter\(10),
	combout => \UART|Equal0~2_combout\);

-- Location: LCCOMB_X33_Y18_N0
\UART|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Equal0~0_combout\ = (\UART|counter\(1) & (!\UART|counter\(3) & (\UART|counter\(2) & \UART|counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|counter\(1),
	datab => \UART|counter\(3),
	datac => \UART|counter\(2),
	datad => \UART|counter\(0),
	combout => \UART|Equal0~0_combout\);

-- Location: LCCOMB_X33_Y18_N16
\UART|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Equal0~1_combout\ = (!\UART|counter\(5) & (\UART|counter\(4) & (!\UART|counter\(7) & \UART|counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|counter\(5),
	datab => \UART|counter\(4),
	datac => \UART|counter\(7),
	datad => \UART|counter\(6),
	combout => \UART|Equal0~1_combout\);

-- Location: LCCOMB_X33_Y12_N30
\UART|Add0~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Add0~24_combout\ = \UART|counter\(12) $ (!\UART|Add0~23\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART|counter\(12),
	cin => \UART|Add0~23\,
	combout => \UART|Add0~24_combout\);

-- Location: LCCOMB_X33_Y18_N18
\UART|Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector1~0_combout\ = (\UART|Add0~24_combout\ & (\UART|state.IDLE~q\ & !\UART|Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Add0~24_combout\,
	datab => \UART|state.IDLE~q\,
	datac => \UART|Equal0~3_combout\,
	combout => \UART|Selector1~0_combout\);

-- Location: FF_X33_Y18_N19
\UART|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|counter\(12));

-- Location: LCCOMB_X33_Y18_N4
\UART|Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Equal0~3_combout\ = (\UART|Equal0~2_combout\ & (\UART|Equal0~0_combout\ & (\UART|Equal0~1_combout\ & \UART|counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Equal0~2_combout\,
	datab => \UART|Equal0~0_combout\,
	datac => \UART|Equal0~1_combout\,
	datad => \UART|counter\(12),
	combout => \UART|Equal0~3_combout\);

-- Location: LCCOMB_X26_Y14_N18
\UART|Selector19~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector19~0_combout\ = (!\UART|Selector18~1_combout\ & (\UART|state.DATA_BITS~q\ & \UART|state.IDLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Selector18~1_combout\,
	datab => \UART|state.DATA_BITS~q\,
	datac => \UART|state.IDLE~q\,
	combout => \UART|Selector19~0_combout\);

-- Location: LCCOMB_X26_Y14_N8
\UART|Selector18~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector18~2_combout\ = (!\UART|Selector18~1_combout\ & (((\UART|state.START_BIT~q\ & !\UART|Equal0~3_combout\)) # (!\UART|state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Selector18~1_combout\,
	datab => \UART|state.IDLE~q\,
	datac => \UART|state.START_BIT~q\,
	datad => \UART|Equal0~3_combout\,
	combout => \UART|Selector18~2_combout\);

-- Location: FF_X26_Y14_N9
\UART|state.START_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector18~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|state.START_BIT~q\);

-- Location: LCCOMB_X26_Y14_N16
\UART|Selector19~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector19~1_combout\ = (\UART|Equal0~3_combout\ & (!\UART|state.STOP_BIT~q\ & ((\UART|Selector19~0_combout\) # (\UART|state.START_BIT~q\)))) # (!\UART|Equal0~3_combout\ & (\UART|Selector19~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Equal0~3_combout\,
	datab => \UART|Selector19~0_combout\,
	datac => \UART|state.START_BIT~q\,
	datad => \UART|state.STOP_BIT~q\,
	combout => \UART|Selector19~1_combout\);

-- Location: FF_X26_Y14_N17
\UART|state.DATA_BITS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector19~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|state.DATA_BITS~q\);

-- Location: LCCOMB_X26_Y14_N6
\UART|Selector14~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector14~0_combout\ = (\UART|bit_index\(2) & ((\UART|state.DATA_BITS~q\) # ((\UART|state.START_BIT~q\) # (\UART|state.STOP_BIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|bit_index\(2),
	datab => \UART|state.DATA_BITS~q\,
	datac => \UART|state.START_BIT~q\,
	datad => \UART|state.STOP_BIT~q\,
	combout => \UART|Selector14~0_combout\);

-- Location: LCCOMB_X26_Y14_N30
\UART|Selector15~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector15~0_combout\ = (\UART|state.DATA_BITS~q\ & (\UART|bit_index\(1) $ (((\UART|bit_index\(0) & !\UART|bit_index~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|bit_index\(0),
	datab => \UART|state.DATA_BITS~q\,
	datac => \UART|bit_index\(1),
	datad => \UART|bit_index~0_combout\,
	combout => \UART|Selector15~0_combout\);

-- Location: LCCOMB_X26_Y14_N22
\UART|Selector15~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector15~1_combout\ = (\UART|Selector15~0_combout\) # ((\UART|bit_index\(1) & ((\UART|state.START_BIT~q\) # (\UART|state.STOP_BIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Selector15~0_combout\,
	datab => \UART|state.START_BIT~q\,
	datac => \UART|bit_index\(1),
	datad => \UART|state.STOP_BIT~q\,
	combout => \UART|Selector15~1_combout\);

-- Location: FF_X26_Y14_N23
\UART|bit_index[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|bit_index\(1));

-- Location: LCCOMB_X26_Y14_N0
\UART|Selector0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector0~2_combout\ = (\UART|state.DATA_BITS~q\ & \UART|bit_index\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.DATA_BITS~q\,
	datac => \UART|bit_index\(1),
	combout => \UART|Selector0~2_combout\);

-- Location: LCCOMB_X26_Y14_N20
\UART|Selector14~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector14~1_combout\ = (\UART|Selector14~0_combout\) # ((\UART|Selector0~2_combout\ & (\UART|bit_index\(0) & \UART|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Selector14~0_combout\,
	datab => \UART|Selector0~2_combout\,
	datac => \UART|bit_index\(0),
	datad => \UART|Equal0~3_combout\,
	combout => \UART|Selector14~1_combout\);

-- Location: FF_X26_Y14_N21
\UART|bit_index[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector14~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|bit_index\(2));

-- Location: LCCOMB_X26_Y14_N12
\UART|bit_index~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|bit_index~0_combout\ = ((\UART|bit_index\(0) & (\UART|bit_index\(2) & \UART|bit_index\(1)))) # (!\UART|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|bit_index\(0),
	datab => \UART|bit_index\(2),
	datac => \UART|bit_index\(1),
	datad => \UART|Equal0~3_combout\,
	combout => \UART|bit_index~0_combout\);

-- Location: LCCOMB_X26_Y14_N4
\UART|Selector16~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector16~0_combout\ = (\UART|bit_index\(0) & ((\UART|state.START_BIT~q\) # (\UART|state.STOP_BIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|bit_index\(0),
	datac => \UART|state.START_BIT~q\,
	datad => \UART|state.STOP_BIT~q\,
	combout => \UART|Selector16~0_combout\);

-- Location: LCCOMB_X26_Y14_N10
\UART|Selector16~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector16~1_combout\ = (\UART|Selector16~0_combout\) # ((\UART|state.DATA_BITS~q\ & (\UART|bit_index~0_combout\ $ (!\UART|bit_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|bit_index~0_combout\,
	datab => \UART|Selector16~0_combout\,
	datac => \UART|bit_index\(0),
	datad => \UART|state.DATA_BITS~q\,
	combout => \UART|Selector16~1_combout\);

-- Location: FF_X26_Y14_N11
\UART|bit_index[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector16~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|bit_index\(0));

-- Location: LCCOMB_X26_Y14_N26
\UART|Selector18~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector18~1_combout\ = (\UART|bit_index\(0) & (\UART|Selector0~2_combout\ & (\UART|bit_index\(2) & \UART|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|bit_index\(0),
	datab => \UART|Selector0~2_combout\,
	datac => \UART|bit_index\(2),
	datad => \UART|Equal0~3_combout\,
	combout => \UART|Selector18~1_combout\);

-- Location: LCCOMB_X26_Y14_N2
\UART|Selector20~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector20~0_combout\ = (\UART|Selector18~1_combout\) # ((\UART|state.STOP_BIT~q\ & !\UART|Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|Selector18~1_combout\,
	datac => \UART|state.STOP_BIT~q\,
	datad => \UART|Equal0~3_combout\,
	combout => \UART|Selector20~0_combout\);

-- Location: FF_X26_Y14_N3
\UART|state.STOP_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector20~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|state.STOP_BIT~q\);

-- Location: LCCOMB_X33_Y18_N8
\UART|Selector19~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector19~2_combout\ = (!\UART|state.STOP_BIT~q\) # (!\UART|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|Equal0~3_combout\,
	datac => \UART|state.STOP_BIT~q\,
	combout => \UART|Selector19~2_combout\);

-- Location: FF_X33_Y18_N9
\UART|state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector19~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|state.IDLE~q\);

-- Location: LCCOMB_X26_Y14_N28
\UART|data_reg[3]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|data_reg[3]~0_combout\ = (\UART|data_reg\(3)) # (!\UART|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART|state.IDLE~q\,
	datac => \UART|data_reg\(3),
	combout => \UART|data_reg[3]~0_combout\);

-- Location: FF_X26_Y14_N29
\UART|data_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|data_reg[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|data_reg\(3));

-- Location: LCCOMB_X26_Y14_N14
\UART|Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector0~0_combout\ = (\UART|state.DATA_BITS~q\ & (\UART|bit_index\(1) & (\UART|bit_index\(0) $ (\UART|bit_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|bit_index\(0),
	datab => \UART|state.DATA_BITS~q\,
	datac => \UART|bit_index\(1),
	datad => \UART|bit_index\(2),
	combout => \UART|Selector0~0_combout\);

-- Location: LCCOMB_X26_Y14_N24
\UART|Selector0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \UART|Selector0~1_combout\ = ((\UART|state.STOP_BIT~q\) # ((\UART|data_reg\(3) & \UART|Selector0~0_combout\))) # (!\UART|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART|data_reg\(3),
	datab => \UART|Selector0~0_combout\,
	datac => \UART|state.IDLE~q\,
	datad => \UART|state.STOP_BIT~q\,
	combout => \UART|Selector0~1_combout\);

-- Location: FF_X26_Y14_N25
\UART|tx\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART|tx~q\);
END structure;


