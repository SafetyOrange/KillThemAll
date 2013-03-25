titleScreen titlescreen;

Player player;
ArrayList<Sheep> sheep;
Target target;
Enviro enviro;
Enviro enviro2;


int gameState;                  //Counter to determine the game state
int spawnBuffer = 60;           //"Safe-Zone" buffer

boolean upTrue, downTrue, leftTrue, rightTrue = false;
boolean found;
boolean timeFreeze;
boolean nextScreen;
boolean fail;

float peopleSize;
float tfCharge;

boolean displayInfo;           //for debugging

void setup() {
  prime();
}

void draw() {
  background(255);
  fill(0);
  textSize(16);
  text("Press 'R' to reset", width-130, 15);
  
 switch(gameState) {           //Level Manager. Data located in LevelData
   
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
  
  if (timeFreeze==true) {          //Time Freeze Formula
    tfCharge-=1;
    if (tfCharge<0) {
      tfCharge=0;
    }
  }
  else {
    tfCharge+=1;
    if (tfCharge>100) {
      tfCharge=100;
    }
  }
}

