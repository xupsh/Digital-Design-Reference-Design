onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clock_opt

do {wave.do}

view wave
view structure
view signals

do {clock.udo}

run -all

quit -force
