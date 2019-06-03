  
  competitions = Competition.create([
    { name: '100m dash Rio 2016' }, 
    { name: '100m dash Tokyo 2020' }, 
    { name: 'Javelin Tokyo 2020' }])
  
  competitions[0].finished!
  competitions[1].ongoing!
  competitions[2].ongoing!
  
  #Javelin
  Result.create(athlete: :Mario, value: 10, unit: :m, competition: competitions[2])
  Result.create(athlete: :Mario, value: 9, unit: :m, competition: competitions[2])
  Result.create(athlete: :Mario, value: 11.1, unit: :m, competition: competitions[2])
  
  Result.create(athlete: :Link, value: 10, unit: :m, competition: competitions[2])
  Result.create(athlete: :Link, value: 10, unit: :m, competition: competitions[2])
  Result.create(athlete: :Link, value: 15, unit: :m, competition: competitions[2])
  
  Result.create(athlete: :Pichu, value: 3.2, unit: :m, competition: competitions[2])
  Result.create(athlete: :Pichu, value: 2, unit: :m, competition: competitions[2])
  Result.create(athlete: :Pichu, value: 2, unit: :m, competition: competitions[2])
  
  #100m
  Result.create(athlete: :Fox, value: 12.3, unit: :s, competition: competitions[1])
  Result.create(athlete: :Pikachu, value: 9.1, unit: :s, competition: competitions[1])
  Result.create(athlete: :Sonic, value: 1.7, unit: :s, competition: competitions[1])
