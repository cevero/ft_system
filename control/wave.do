onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate :tb_control:dut:clk
add wave -noupdate :tb_control:dut:error_i
add wave -noupdate :tb_control:dut:done_o
add wave -noupdate -radix unsigned :tb_control:dut:replay_addr_o
add wave -noupdate :tb_control:dut:done
add wave -noupdate :tb_control:dut:state
add wave -noupdate -radix unsigned :tb_control:dut:addr
add wave -noupdate -radix unsigned :tb_control:dut:iterator
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {623 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 272
configure wave -valuecolwidth 100
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
WaveRestoreZoom {228 ps} {392 ps}
