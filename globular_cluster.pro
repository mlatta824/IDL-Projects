pro globular_cluster,apM,abM,T
  
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;
  ; Given apparent magnitude, absolute magnitude, and Temp.
  ; Output frequency, distance
  ; 
  ; Written by Matthew Latta | Nov. 2024
  ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  print, ''
  print, 'starting globular_cluster.pro'
  print, ''
  
  w = 0.0029 ; Wien's Constant
  
  
  print, 'apprent magnitude: ',apM
  print, 'absolute magnitude: ',abM
  print, 'Temperature: ',T
  print, ''
  print, ''
  print, 'calculating frequency'
  print, ''
  
  f = w/T ; calculates frequency, f (lambda)
  
  print, 'Frequency: ',f
  
  print, ''
  print, ''
  print, 'calculating potential distances'
  print, ''
  
  abM_10 = apM
  abM_50 = apM - 5 * alog10(50/10)
  abM_100 = apM - 5 * alog10(100/10)
  abM_500 = apM - 5 * alog10(500/10)
  abM_1000 = apM - 5 * alog10(1000/10)
  abM_1500 = apM - 5 * alog10(1500/10)
  abM_2000 = apM - 5 * alog10(2000/10)
  abM_3000 = apM - 5 * alog10(3000/10)
  abM_4000 = apM - 5 * alog10(4000/10)
  abM_5000 = apM - 5 * alog10(5000/10)
  
  print, 'Possible distances: '
  print, '10 pc:',abM_10
  print, '50 pc:',abM_50
  print, '100 pc:',abM_100
  print, '500 pc:',abM_500
  print, '1000 pc:',abM_1000
  print, '1500 pc:',abM_1500
  print, '2000 pc:',abM_2000
  print, '3000 pc:',abM_3000
  print, '4000 pc:',abM_4000
  print, '5000 pc:',abM_5000
  
  abMList = [abM_10,abM_50,abM_100,abM_500,abM_1000,abM_1500,abM_2000,abM_3000,abM_4000,abM_5000]
  distList = [10,50,100,500,1000,1500,2000,3000,4000,5000]
  diffList = abs(abMList - abM)
  
  estDist = where(diffList eq min(diffList))
  print, 'Rough Estimated Distance:',distList[estDist]



end
