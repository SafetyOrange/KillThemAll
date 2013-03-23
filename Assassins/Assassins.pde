titleScreen titlescreen;

Player player;
ArrayList<Sheep> sheep;
Target target;
Enviro enviro;

int gameState;  //Counter to determine the game state
int spawnBuffer = 60; //"Safe-Zone" buffer

boolean upTrue, downTrue, leftTrue, rightTrue = false;
boolean found;
boolean timeFreeze;

float peopleSize;
float tfCharge;

boolean displayInfo; //for debugging

void setup() {
  titlescreen = new titleScreen();


  gameState=1;// set to 0 to include the start screen. Turned off for debugging. 
  smooth();
  frameRate(60);
  size(900, 600);

  timeFreeze=false;
  tfCharge = 100;

  float peopleSize = 10;

  player = new Player();
  player.prime();

  sheep = new ArrayList<Sheep>(); 

  target = new Target();
  target.prime();

  enviro = new Enviro();

  found=false;
}

void draw() {
  background(255);
  println(gameState);
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
    text("Click for next level", width/2,height/2);
    if(mousePressed){
      gameState++;
    }
    break;
  case 3:
    lev2();
    break;
  case 4: 
    fill(0);
    textAlign(CENTER);
    textSize(32);
    text("Click for next level", width/2,height/2);
    if(mousePressed){
      gameState++;
    }    break;
  case 5: 
    //Level 3
//    lev3();
    break;
  case 6:
    break;
  case 7: 
    //Win Screen
    break; 
  }
}

void keyPressed() {
  if (keyCode=='W') {
    upTrue=true;
  }

  if (keyCode=='S') {
    downTrue=true;
  }

  if (keyCode=='A') {
    leftTrue=true;
  }

  if (keyCode=='D') {
    rightTrue=true;
  }

  if (keyCode==' ') {
    timeFreeze=true;
    //  println(timeFreeze);
  }
}

void keyReleased() {

  if (keyCode=='W') {
    upTrue=false;
  }

  if (keyCode=='S') {
    downTrue=false;
  }

  if (keyCode=='A') {
    leftTrue=false;
  }

  if (keyCode=='D') {
    rightTrue=false;
  }


  if (keyCode=='M') {
    found=true;
  }

  if (keyCode==' ') {
    timeFreeze=false;
    // println(timeFreeze);
  }

  if (keyCode=='R') {
    setup();
  }
}

void mouseClicked() {
  if (dist(mouseX, mouseY, target.pos.x, target.pos.y)<peopleSize/2) {
    found=true;
    gameState++;
  }

  for (int i=0; i<sheep.size(); i++) {
    Sheep temp = sheep.get(i); 
    if (dist(mouseX, mouseY, temp.pos.x, temp.pos.y)<peopleSize/2) {
      println(temp.wasStuck);
      //      if (temp.wasStuck==true && enviro.pos.dist(temp.pos)<enviro.diam/2) {
      //        println("Caught");
      //      }
      //      if (temp.time>=temp.stuck+temp.stuckTime) {
      //        println("Free");
      //      }
      //      if (temp.time>=temp.coolDown+temp.coolTime) {
      //        println("Vulnerable");
      //      }
    }
  }
}

