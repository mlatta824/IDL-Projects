pro tele_mag,d,b,t

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;
  ; Given the telescope diameter (in), brightness of area (mcd/m2) (Collegeville: 1.9), exposure time (s)
  ; Return theoretical magnitude limit of telescope at given exposure
  ;
  ; Written by Matthew Latta | Nov. 2024
  ;
  ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  aMag = 6.5 ; Average limiting magnitude of night sky (naked eye)
  aB = 0.171 ; Average brightness of dark skies (mcd/m2)
  dM = d * 0.0254 ; Telescope diameter (meters)
  dEye = 0.007 ; Average eye pupil diameter in the dark
  
  m_l = aMag - 2.5*alog10(b/aB); Magnitude limit of dark sky in area
  
  m_t = m_l + 5*alog10(dM/dEye)+(2.5*alog10(t)) ; Found this equation on the internet
  
  print,'Sky limit mag:',m_l
  print,'Theoretical telescope magnitude limit at',t,'seconds:',m_t
  

end