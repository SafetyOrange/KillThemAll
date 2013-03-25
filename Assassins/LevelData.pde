void prime(){
   titlescreen = new titleScreen();

  gameState=0;                 // set to 0 to include the start screen. Turned off for debugging. 
  smooth();
  frameRate(60);
  size(900, 600);

  timeFreeze=false;
  nextScreen=false;
  fail=false;
  tfCharge = 100;

  float peopleSize = 10;

  player = new Player();
  player.prime();

  sheep = new ArrayList<Sheep>(); 

  target = new Target();
  target.prime();

  enviro = new Enviro();
  enviro2 = new Enviro();


  found=false;
}





void lev1() {
  player.drawPlayer();
  player.update();

  fill(0);
  rectMode(CORNER);                        //TIMEFREEZE BAR
  rect(20, 20, tfCharge, 5);

  while (sheep.size () <10) {             //add sheep until there are 100 of them. Prime them. 
    Sheep temp = new Sheep();
    temp.prime();
    sheep.add(temp);
  }  

  for (int i=0; i<sheep.size(); i++) {      //draw and update sheep
    Sheep temp = sheep.get(i); 
    temp.updateSheep();
    temp.drawSheep();
  }

  target.drawTarget();
  target.update();
  target.attraction(enviro);           //Put the name of an instance of an object 
                                      //in this function to make target lerp to that 
                                     //occasionally


  enviro.prime(new PVector(100, 500), 20, 150, #5FD823, 2);
  enviro.update();

                                    //I made new instance in the main class so we can reference these specifically
  enviro2.prime(new PVector(500, 200), 10, 75, #5FD823, 1);
  enviro2.update();
}






void lev2() {
  player.drawPlayer();
  player.update();

  fill(0);
  rectMode(CORNER);                        //TIMEFREEZE BAR
  rect(20, 20, tfCharge, 5);


  while (sheep.size () <25) {         //add sheep until there are 100 of them. Prime them. 
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

  enviro.prime(new PVector(200, 200), 20, 150, #5FD823, 3);
  enviro.update();

  enviro.prime(new PVector(500, 500), 10, 75, #5FD823, 1);
  enviro.update();
}






void lev3() {
  player.drawPlayer();
  player.update();

  fill(0);
  rectMode(CORNER);                        //TIMEFREEZE BAR
  rect(20, 20, tfCharge, 5);


  while (sheep.size () <100) {         //add sheep until there are 100 of them. Prime them. 
    Sheep temp = new Sheep();
    temp.prime();
    sheep.add(temp);
  }  

  for (int i=0; i<sheep.size(); i++) {   //draw and update sheep
    Sheep temp = sheep.get(i); 
    temp.updateSheep();
    temp.drawSheep();
  }

  target.drawTarget();
  target.update();
}




//This is the part of the code that dictates level progression

void gameManager(){
  
switch(gameState) {
   
  case 0:
    //draw title screen
    titlescreen.update();
    break;
    
  case 1:
    lev1(); // Level 1 == LEV1
    break;
    
  case 2:
    //draw transition screen
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Press enter for next level", width/2, height/2);
    if (nextScreen) {
      gameState++;
      found=false;
      player.health=100;
    }
    break;
    
  case 3:
    lev2();
    break;
    
  case 4: 
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Press enter for next level", width/2, height/2);
    if (nextScreen) {
      gameState++;
    }    
    break;
  case 5: 
    //Level 3
    lev3();
    break;
  case 6: 
    //Win Screen
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("You did it. Press 'R' to play again.", width/2, height/2);
    break;
  case 7:
    //game over screen
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("You have died. Press 'R' to restart.", width/2, height/2);
    break;
  case 100:
    //Killed an innocent
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("You killed an innocent person. Press 'R' to restart.", width/2, height/2);
    break;
  }
}
