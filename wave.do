onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISCV_TOP/clk
add wave -noupdate /RISCV_TOP/reset
add wave -noupdate /RISCV_TOP/instruction
add wave -noupdate /RISCV_TOP/PC_out
add wave -noupdate /RISCV_TOP/read_data1
add wave -noupdate /RISCV_TOP/read_data2
add wave -noupdate /RISCV_TOP/ALU_result
add wave -noupdate /RISCV_TOP/Read_data
add wave -noupdate /RISCV_TOP/Rs1
add wave -noupdate /RISCV_TOP/Rs2
add wave -noupdate /RISCV_TOP/Rd
add wave -noupdate /RISCV_TOP/branch
add wave -noupdate /RISCV_TOP/MemRead
add wave -noupdate /RISCV_TOP/MemWrite
add wave -noupdate /RISCV_TOP/MemtoReg
add wave -noupdate /RISCV_TOP/ALUSrc
add wave -noupdate /RISCV_TOP/RegWrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {5998974 ps} {6000054 ps}
