float peopleSize;
Player player;
Sheep[] sheep;
Target target;

int gameState;  //Counter to determine the game state

boolean upTrue, downTrue, leftTrue, rightTrue = false;
boolean found;
boolean timeFreeze;

void setup() {
  gameState=0;
  smooth();
  frameRate(60);
  size(600, 600);
  
  timeFreeze=false;

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
  switch(gameState){ 
  case 0:
    player.drawPlayer();
    player.update();

    for (int i=0;i<sheep.length;i++) {
      sheep[i].drawSheep();
      sheep[i].updateSheep();
    }

    target.drawTarget();
    target.update();
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
  if (dist(mouseX, mouseY, target.xPos, target.yPos)<peopleSize/2) {
    found=true;
    println("Found.");
  }
}

