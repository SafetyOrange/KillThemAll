void lev1() {
  player.drawPlayer();
  player.update();

 while(sheep.size() <20) { //add sheep until there are 100 of them. Prime them. 
    Sheep temp = new Sheep();
    temp.prime();
    sheep.add(temp);
  }  

  for (int i=0; i<sheep.size(); i++) { //draw and update sheep
    Sheep temp = sheep.get(i); 
    temp.updateSheep();
    temp.drawSheep();
    
  }

  target.drawTarget();
  target.update();
  
  enviro.prime(new PVector(200,200), 20, 150, #5FD823, 3);
  enviro.update();
  
  enviro.prime(new PVector(500, 500), 10, 75, #5FD823, 1);
  enviro.update();
 
}

