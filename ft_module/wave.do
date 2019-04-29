onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned :tb_ft_system:addr_a_i
add wave -noupdate -radix unsigned :tb_ft_system:addr_b_i
add wave -noupdate -radix unsigned :tb_ft_system:addr_o
add wave -noupdate :tb_ft_system:clk_i
add wave -noupdate -radix unsigned :tb_ft_system:data_a_i
add wave -noupdate -radix unsigned :tb_ft_system:data_b_i
add wave -noupdate -radix unsigned :tb_ft_system:data_o
add wave -noupdate :tb_ft_system:fetch_block_o
add wave -noupdate :tb_ft_system:we_a_i
add wave -noupdate :tb_ft_system:we_b_i
add wave -noupdate -radix hexadecimal :tb_ft_system:spc_i
add wave -noupdate -radix hexadecimal :tb_ft_system:spc_o
add wave -noupdate :tb_ft_system:dut:control_module:done
add wave -noupdate :tb_ft_system:dut:control_module:state
add wave -noupdate :tb_ft_system:dut:comparator_module:signal
add wave -noupdate -radix unsigned :tb_ft_system:dut:control_module:addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {359 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 318
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
WaveRestoreZoom {354 ps} {728 ps}
