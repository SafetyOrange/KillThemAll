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
  
  gameManager();                  //Progression structure. See Level Data
  
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

