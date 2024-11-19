pro globular_cluster_adv,apM,abM,T


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;
  ; Given the b_v, apparent magnitude, absolute magnitude, Luminosity, and Temp.
  ; Output wavelength, distance
  ; 
  ; Written by Matthew Latta | Nov. 2024
  ;
  ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  print, ''
  print, 'starting globular_cluster_adv.pro'
  print, ''

  w = 0.0029 ; Wien's Constant


  print, 'apprent magnitude: ',apM
  print, 'absolute magnitude: ',abM
  print, 'Temperature (K): ',T
  print, ''
  print, ''
  print, 'calculating wavelength'
  print, ''

  wave_len = w/T ; calculates wavelengrh, wave_len (lambda)
  wave_lenNM = wave_len * 1e9

  print, 'Wavelength (nm): ',wave_lenNM

  print, ''
  print, ''
  print, 'calculating potential distances'
  print, ''
  
  abM_list = []
  dist_list = []
  
  
  for i = 1.0, 12000.0 do begin
    dist_list = [dist_list,i]
    abM_list = [abM_list,apM-5*alog10(i/10.0)]
  endfor
  
  diff_list = abs(abM_list - abM)

  estDist = where(diff_list eq min(diff_list))
  print, 'Rough Estimated Distance (pc):',dist_list[estDist]
  print, 'What ifs:'
  print, '10 pc',abM_list[10]
  print, '50 pc',abM_list[50]
  print, '100 pc',abM_list[100]
  print, '500 pc',abM_list[500]
  print, '1000 pc',abM_list[1000]
  print, '5000 pc',abM_list[5000]
  print, '10000 pc',abM_list[10000]

end
