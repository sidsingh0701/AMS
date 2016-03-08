onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /test_fixture/a1/a19/clock
add wave -noupdate -radix hexadecimal /test_fixture/a1/a19/element1
add wave -noupdate -radix hexadecimal /test_fixture/a1/a19/element2
add wave -noupdate -radix hexadecimal /test_fixture/a1/a19/new1
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/clock
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/reset
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/data
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/FinalOutput
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/addressI
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/dataI
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/NewRowFlag
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/count
add wave -noupdate -radix hexadecimal /test_fixture/a1/a17/FirstFlag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {308300 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 325
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
WaveRestoreZoom {235700 ps} {423 ns}
