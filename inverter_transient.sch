v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 -130 170 {}
N -90 -80 -50 -80 {lab=in}
N -90 -80 -90 40 {lab=in}
N -90 40 -50 40 {lab=in}
N -180 -20 -180 0 {lab=in}
N -180 -20 -90 -20 {lab=in}
N -10 70 -10 120 {lab=0}
N -180 60 -180 120 {lab=0}
N -180 120 -10 120 {lab=0}
N -10 -160 -10 -110 {lab=#net1}
N -320 -160 -10 -160 {lab=#net1}
N -320 -160 -320 -40 {lab=#net1}
N -320 20 -320 120 {lab=0}
N -320 120 -180 120 {lab=0}
N -10 -80 70 -80 {lab=#net1}
N 70 -160 70 -80 {lab=#net1}
N -10 -160 70 -160 {lab=#net1}
N -10 40 70 40 {lab=0}
N 70 40 70 120 {lab=0}
N -10 120 70 120 {lab=0}
N -10 -50 -10 10 {lab=out}
N -10 -20 70 -20 {lab=out}
N -180 120 -180 160 {lab=0}
C {sky130_fd_pr/nfet_01v8.sym} -30 40 0 0 {name=M1
W=6
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -30 -80 0 0 {name=M2
W=18
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -180 30 0 0 {name=V1 value="PULSE(0 1.8 0 100p 100p 5n 10n)"}
C {vsource.sym} -320 -10 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} -180 -20 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 70 -20 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} -180 160 0 0 {name=l1 lab=0}
C {code.sym} -120 180 0 0 {name=TT_MODELS
only_toplevel=true
value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {code_shown.sym} 230 -40 0 0 {name=SPICE only_toplevel=false value="
.option wnflag=0
.option savecurrents

.control
save all
tran 0.01n 50n
plot in out
.endc
"}
