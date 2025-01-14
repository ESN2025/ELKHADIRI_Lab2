library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab_two is
    port (
        clk                 : in  std_logic;                      -- Input clock
        reset               : in  std_logic;                      -- Input reset (active high)
        leds                : out std_logic_vector(7 downto 0);   -- LED output
		  output_av            : out std_logic_vector(31 downto 0)   -- LED output
    );
end entity Lab_two;

architecture Behavioral of Lab_two is

	
		  
	
	    component Lab2_sys is
        port (
            clk_clk                         : in  std_logic                     := 'X'; -- clk
            leds_external_connection_export : out std_logic_vector(7 downto 0);         -- export
            out_readdata                    : out std_logic_vector(31 downto 0);        -- readdata
            reset_reset_n                   : in  std_logic                     := 'X'  -- reset_n
        );
    end component Lab2_sys;
	 
begin

    u0 : component Lab2_sys
        port map (
            clk_clk                         => clk,                         --                      clk.clk
            leds_external_connection_export => leds, -- leds_external_connection.export
            out_readdata                    => output_av,                    --                      out.readdata
            reset_reset_n                   => reset                    --                    reset.reset_n
        );

		  


end architecture Behavioral;



