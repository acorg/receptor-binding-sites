reinitialize
load 6tzb_clean.pse, protein
space cmyk
set bg_rgb=[1,1,1]

# seperate and color monomers
create mono1, chain A or chain B
create mono2, chain C or chain D
create mono3, chain E or chain F
create receptor, not polymer.protein
color gray20, mono1 and polymer.protein
color white, mono2
color gray60, mono3

delete 6TZB

# view angle
center receptor
zoom receptor, 8
rotate x, 10
translate [2, 0, 0], all

# color bjorn7 sites and rbs
select mysel, resi 145+155+156+158+159+189+193 and mono1
color marine, mysel

select mysel, (resi 134-137 or resi 98+153+183+184+190+194 or resi 226+228) and mono1
color wheat, mysel

# color and stylize receptor
color brown, receptor
show sticks, receptor
show spheres, receptor
set valence, 0
set_bond stick_radius, 0.13, receptor
set sphere_scale, 0.25, receptor
set stick_radius, .07
set sphere_scale, .18
set sphere_scale, .13, elem H
set stick_quality, 50
set sphere_quality, 4

set stick_color, black
show surface, mono1
show surface, mono2
show surface, mono3

select mysel, mono1 and not (resi 131-160 or resi 182-198 or resi 226-228)
hide cartoon, mysel

set transparency, 0.18, mono1
set transparency, 0, mono2
set transparency, 0, mono3

set surface_quality, 2
set ray_trace_mode, 0
set ambient_occlusion_mode, 1
set ambient_occlusion_scale, 10
set ray_shadow, 0
set ambient, 0.5
set direct, 0.5
set shininess, 0
set reflect, 0
set spec_reflect, 0
set reflect_power, 0
set depth_cue, 1
set fog_start, 0.45
set antialias, 3
set dash_gap, 0
set dash_color, black
set dash_gap, .15
set dash_length, .05
set dash_round_ends, 0
set dash_radius, .05
set surface_color_smoothing_threshold, 1.2
set orthoscopic, on

set hash_max, 300
util.performance(0)

clip far, -1000
clip near, 1000
deselect

ray 1200,1200
png out.png

