onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary :tb_ft_module:dut:clk_i
add wave -noupdate -radix binary :tb_ft_module:dut:we_a_i
add wave -noupdate -radix binary :tb_ft_module:dut:we_b_i
add wave -noupdate -radix unsigned :tb_ft_module:dut:addr_a_i
add wave -noupdate -radix unsigned :tb_ft_module:dut:addr_b_i
add wave -noupdate -radix unsigned :tb_ft_module:dut:data_a_i
add wave -noupdate -radix unsigned :tb_ft_module:dut:data_b_i
add wave -noupdate -radix hexadecimal :tb_ft_module:dut:spc_i
add wave -noupdate -radix hexadecimal :tb_ft_module:dut:spc_o
add wave -noupdate -radix unsigned :tb_ft_module:dut:addr_o
add wave -noupdate -radix unsigned :tb_ft_module:dut:data_o
add wave -noupdate -radix binary :tb_ft_module:dut:halt_o
add wave -noupdate -radix binary :tb_ft_module:dut:resume_o
add wave -noupdate -radix binary :tb_ft_module:dut:error
add wave -noupdate -radix unsigned :tb_ft_module:dut:addr
add wave -noupdate -radix unsigned :tb_ft_module:dut:data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {541 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
configure wave -valuecolwidth 108
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {806 ps}
