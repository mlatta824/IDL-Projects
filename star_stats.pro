pro star_stats,apM,d_star

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Given the apparent magnitude (apM) and distance of a star (d_star) in parsecs:
; Return luminosity and absolute magnitude of star
; 
; Written by Matthew Latta | Nov. 2024
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sun_abM = 4.83

abM = apM-5*alog10(d_star/10.0)

starL = 2.512^(4.83-abM)

print,'Absolute Magnitude: ',abM
print,'Luminosity (suns): ',starL

end