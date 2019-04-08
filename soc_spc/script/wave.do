onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate :tb_soc_pc:clk_i
add wave -noupdate :tb_soc_pc:rst_ni
add wave -noupdate :tb_soc_pc:fetch_en_i
add wave -noupdate -radix hexadecimal :tb_soc_pc:inst_addr
add wave -noupdate :tb_soc_pc:signal
add wave -noupdate -radix hexadecimal :tb_soc_pc:spc_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 183
configure wave -valuecolwidth 76
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
WaveRestoreZoom {195 ps} {253 ps}
