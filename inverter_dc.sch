v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 -70 160 {}
N -30 -90 10 -90 {lab=in}
N -30 -90 -30 30 {lab=in}
N -30 30 10 30 {lab=in}
N -120 -30 -120 -10 {lab=in}
N -120 -30 -30 -30 {lab=in}
N 50 60 50 110 {lab=0}
N -120 50 -120 110 {lab=0}
N -120 110 50 110 {lab=0}
N 50 -170 50 -120 {lab=#net1}
N -260 -170 50 -170 {lab=#net1}
N -260 -170 -260 -50 {lab=#net1}
N -260 10 -260 110 {lab=0}
N -260 110 -120 110 {lab=0}
N 50 -90 130 -90 {lab=#net1}
N 130 -170 130 -90 {lab=#net1}
N 50 -170 130 -170 {lab=#net1}
N 50 30 130 30 {lab=0}
N 130 30 130 110 {lab=0}
N 50 110 130 110 {lab=0}
N 50 -60 50 -0 {lab=out}
N 50 -30 130 -30 {lab=out}
N -120 110 -120 150 {lab=0}
C {sky130_fd_pr/nfet_01v8.sym} 30 30 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 30 -90 0 0 {name=M2
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
C {vsource.sym} -120 20 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -260 -20 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} -120 -30 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 130 -30 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} -120 150 0 0 {name=l1 lab=0}
C {code.sym} -60 170 0 0 {name=TT_MODELS
only_toplevel=true
value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {code_shown.sym} 290 -50 0 0 {name=SPICE only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
dc v1 0 1.8 0.01
plot in out
op
.endc
"}
