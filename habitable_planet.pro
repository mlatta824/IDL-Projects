pro habitable_planet,starM,starL


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; Given the mass and luminosity of a star,
; Give the habitable distance(au), orbital period, orbital velocity
; 
; Written by Matthew Latta | Nov. 2024
; 
; Credit: Kassandra Martin-Wells (Potential Energy Plot)
; 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print,''
print,'Starting habitable_planet.pro'
print,''

; Constants/variables:

G = 6.67e-11 ; Gravitational constant
a_earth = 1.0 ; distance of earth from sun (au)
starKG = starM * 1.989e30
exo_rotate = 0.45

print,'Mass of selected star (kg): ',starKG
print,'Luminosity of selected star: ',starL
print,''
print,''
print,'Calculating habitable distance (a)'
print,''

; Calculate habitable distance of selected star

a_star = sqrt(starL)*a_earth ; rough calculation (a tad inaccurate for stars other than main sequence)

print,'Habitable distance: ',a_star
print,''
print,''
print,'Calculating orbital period'
print,''

a_starM = a_star * 1.496e11
p_star = sqrt((4*(!pi^2)*(a_starM^3))/(G*starKG)) ; calculate orbital period
p_starY = p_star / 3.154e7

print,'Orbital period (seconds): ',p_star
print,''
print,''
print,'Calculating orbital velocity'
print,''

v_star = (2*!pi*a_starM)/p_star ; calculate orbital velocity

print,'Orbital velocity: ',v_star
print,''
print,''

print,'Final Results:'
print,'Habitable distance(au):',a_star
print,'Orbital period (years):',p_starY
print,'Orbital velocity(m/s):',v_star

print,''
if starL gt 50 and starM gt 1.3 then begin
  print,'Star is likely a giant if it is an M-type star, results are not as accurate if giant'
endif

mass_planet =5.972e24
Troti=0.0D
dummyUgi=0.0D
Ugi=0.0D
Etot=0.0D

Troti=0.5D*mass_planet*((exo_rotate)^2.0D)
print,'The kinetic energy of this orbit is: ',Troti,' J'
dummyUgi=(-1.0D)*G*starKG/a_starM
Ugi=dummyUgi*mass_planet
print,'The gravitational potential energy of this orbit is: ',Ugi,' J'
Etot=Troti+Ugi

print,'Total Energy for this orbit is: ',Etot,' J'
print,''

dummyEcirc=0.0D
Ecirc=0.0D

dummyEcirc=(-1.0D)*G*starKG/(2.0D*a_starM)
Ecirc=dummyEcirc*mass_planet

conlist=['Circle','Ellipse','Parabola','Hyperbola']
contype=''

if Etot lt 0 then contype=conlist[1]
if Etot eq Ecirc then contype=conlist[0]
if Etot eq 0 then contype=conlist[2]
if Etot gt 0 then contype=conlist[3]

print,'The conic section of this orbit is: ',contype
print,''


dummyEcirc=0.0D
Ecirc=0.0D

dummyEcirc=(-1.0D)*G*starKG/(2.0D*a_starM)
Ecirc=dummyEcirc*mass_planet

print,'The Energy of an earth like exo_planets orbit at this separation would be: ',Ecirc,' J'
print,''

eps=0.0D
mu=0.0D
dummymu=0.0D
orbls=0.0D
decc1=0.0D
decc2a=0.0D
decc2b=0.0D
decc3=0.0D
decc4=0.0D
ecc=0.0D
gpara=0.0D

gpara=G*(starKG+mass_planet)
print,'The standard gravitational parameter is: ',gpara

dummymu=starKG/(starKG+mass_planet)
mu=dummymu*mass_planet
print,'The reduced mass of this orbit is: ',mu
eps=Etot/mu
print,'The specific energy of this orbit is: ',eps
orbls=(mass_planet*exo_rotate*a_starM)/mu
decc1=orbls^2.0D
;print,'decc1 = ',decc1
decc2a=decc1/gpara
;print,'decc2a = ',decc2a
decc3=2.0D*eps*decc2a
;print,'decc3 = ',decc3
decc2b=decc3/gpara
;print,'decc2b = ',decc2b
decc4=1+decc2b
;print,'decc4 = ',decc4
ecc=(decc4)^0.5D
ecc= sqrt(1-((a_starM^2)/(a_starM^2)))

print,'The specific orbital angular momentum of this orbit is: ',orbls,' (m/s)^2'
print,'The eccentricity of this orbit is: ',ecc
print,''

kcf=0.0D
ug=0.0D

kcf=((orbls*mu)^2.0D)/(2.0D*mass_planet)
print,'Centrifugal Potential Constant is: ',kcf
ug=Ugi*(-1.0D)*a_starM
print,'Gravitational Potential Constant is: ',ug

length=500
ueff=findgen(length)
rpos=findgen(length)
rmin=0.0D
rmin=1.0e-3*a_starM
rmax=0.0D
rmax=0.6e2*a_starM
rnow=0.0D
rnow=rmin

for i=0,length-1 do begin
  rpos[i]=rnow
  ueff[i]=(kcf/(rpos[i]^2.0))-(ug/rpos[i])
  rnow=rnow+((rmax-rmin)/length)
endfor

EtotR=findgen(length)
Trad=findgen(length)
zero_line=findgen(length)

for i=0,length-1 do begin
  EtotR[i]=Etot
  zero_line[i]=0.0
  Trad[i]=EtotR[i]-ueff[i]
endfor


rmax=0.0D
ymin=0.0D
ymax=0.0D
rmax=5.0e3*rmin
ymin=-2.0*abs(Etot)
ymax=2.0*abs(Etot)

Ux=0.0D
Uy=0.0D
Ex=0.0D
Ey=0.0D
Ty=0.0D

Ux=5.0e2*rmin
Uy=1.75*abs(Etot)
Ex=3.0e3*rmin
Ey=-1.2*Etot
Tx=3.0e3*rmin
Ty=-0.2*Etot

plot, rpos, ueff, xrange = [rmin,rmax], yrange = [ymin,ymax], $
  title='Orbital Energy Plot'
xyouts,Ux,Uy,'Ueff',charsize = 1.5
oplot, rpos, EtotR,linestyle=2
xyouts,Ex,Ey,'Etot',charsize = 1.5
oplot, rpos, Trad, color=180
xyouts,Tx,Ty,'Trad',charsize = 1.5, color=180
oplot, rpos, zero_line


print,' '
print,'These results are assuming that the M-Class star is on the main sequence and that the exo-planet is earth-like in all aspects.'

print,''
print,'Completed.'

end







