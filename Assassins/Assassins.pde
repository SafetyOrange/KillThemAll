titleScreen titlescreen;

float peopleSize;
Player player;
Sheep[] sheep;
Target target;

int gameState;  //Counter to determine the game state

boolean upTrue, downTrue, leftTrue, rightTrue = false;
boolean found;
boolean timeFreeze;
float tfCharge;

void setup() {
  titlescreen = new titleScreen();
  gameState=1;// set to 0 to include the start screen. Turned off for debugging. 
  smooth();
  frameRate(60);
  size(600, 600);

  timeFreeze=false;
  tfCharge = 100;

  float peopleSize = 10;

  player = new Player();
  player.prime();

  sheep = new Sheep[200];
  for (int i=0;i<sheep.length;i++) {
    sheep[i] = new Sheep();
    sheep[i].prime();

    target = new Target();
    target.prime();

    found=false;
  }
}

void draw() {
  background(255);
  switch(gameState) { 
  case 0:
    //draw title screen
    titlescreen.update();
    break;
  case 1:
    player.drawPlayer();
    player.update();

    for (int i=0;i<sheep.length;i++) {
      sheep[i].drawSheep();
      sheep[i].updateSheep();
    }

    target.drawTarget();
    target.update();


    if (timeFreeze==true) {
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

    fill(0);
    rect(20, 20, tfCharge, 5);
    println(tfCharge);
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
    println("Found.");
  }
}

