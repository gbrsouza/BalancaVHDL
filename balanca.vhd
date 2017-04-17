entity calcula_media is 
    generic ( w : natural := 8 );

    port ( bal_a, bal_b, bal_c, bal_d : in bit_vector (w-1 downto 0); -- entrada
	   bal_s      : out bit_vector(w-1 downto 0)); -- sa�da

end calcula_media;	   

architecture arch_med of calcula_media is

    -- pesos
    signal c_in1, c_in2, c_in3, c_out1, c_out2, c_out3 : bit;
    signal fio1, fio2 : bit_vector (w-1 downto 0); 

    component adder_Wbits

        port (  a, b : in  bit_vector(w-1 downto 0); -- entradas
	cin  : in  bit;			     -- carry in
	s    : out bit_vector(w-1 downto 0); -- sa�das
	cout : out bit); 		     -- carry out

    end component;

    begin
	add1 : adder_Wbits port map (bal_a, bal_b, c_in1, fio1, c_out1);
	add2 : adder_Wbits port map (bal_c, bal_d, c_in2, fio2, c_out2);
	add3 : adder_Wbits port map (fio1, fio2, c_in3, bal_s, c_out3);


end arch_med;
