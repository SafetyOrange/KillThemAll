void lev1() {
  player.drawPlayer();
  player.update();

 while(sheep.size() <10) { //add sheep until there are 100 of them. Prime them. 
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
  target.attraction(enviro); //Put the name of an instance of an object 
                            //in this function to make target lerp to that 
                            //occasionally

  
  enviro.prime(new PVector(100,500), 20, 150, #5FD823, 2);
  enviro.update();
  
  //I made new instance in the main class so we can reference these specifically
  enviro2.prime(new PVector(500, 200), 10, 75, #5FD823, 1);
  enviro2.update();
}

void lev2() {
  player.health=100; //reset health
  player.drawPlayer();
  player.update();

 while(sheep.size() <25) { //add sheep until there are 100 of them. Prime them. 
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

