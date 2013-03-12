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

class Player {

  float playerSpeed;
  float xPos;
  float yPos;

  void prime() {
    playerSpeed = 5;
    peopleSize = 20;
  }

  void drawPlayer() {
    fill(0, 175, 0);
    stroke(0);
    ellipse(xPos, yPos, peopleSize, peopleSize);
  }

  void update() {
    if (upTrue==true) {
      player.yPos -= player.playerSpeed;
    }

    if (downTrue==true) {
      player.yPos += player.playerSpeed;
    }

    if (leftTrue==true) {
      player.xPos -= player.playerSpeed;
    }

    if (rightTrue==true) {
      player.xPos += player.playerSpeed;
    }
  }
}

class Sheep {

  float sheepSpeedX;
  float sheepSpeedY;
  float xPos;
  float yPos;
  int direction = int(random(3));

  void prime() {
    sheepSpeedX= random(-2,2);
    sheepSpeedY= random(-2,2);
    if(sheepSpeedX<1){
      sheepSpeedX++;
    }
    if(sheepSpeedY<1){
      sheepSpeedY++;
    }
    
    peopleSize = 20;
    xPos=random(peopleSize, width-peopleSize);
    yPos=random(peopleSize, height-peopleSize);
  }
  void drawSheep() {
    fill(175, 175, 0);
    stroke(0);
    ellipse(xPos, yPos, peopleSize, peopleSize);
  }

  void updateSheep() {
    if(timeFreeze==true){
      xPos+=0;
      yPos+=0;
    }
  else{
   xPos+=sheepSpeedX;
   yPos+=sheepSpeedY;
  }

    if (xPos<=peopleSize/2 || xPos>=width-peopleSize/2) {
      sheepSpeedX*=-1;
    }

    if (yPos<=peopleSize/2 || yPos>=height-peopleSize/2) {
      sheepSpeedY*=-1;
    }

  }
}

class Target {

  float lerp=-.01;

  float targetSpeedX;
  float targetSpeedY;
  float xPos;
  float yPos;
  int c;

  void prime() {
    c=175;
    targetSpeedX= random(-2, 2);
    targetSpeedY= random(-2, 2);
    if (targetSpeedX<1) {
      targetSpeedX++;
    }
    if (targetSpeedY<1) {
      targetSpeedY++;
      peopleSize = 20;
    }
    xPos=random(peopleSize, width-peopleSize);
    yPos=random(peopleSize, height-peopleSize);
  }

  void drawTarget() {
    fill(175, c, 0);
    stroke(0);
    ellipse(xPos, yPos, peopleSize, peopleSize);
  }

  void update() {

    if (dist(xPos, yPos, player.xPos, player.yPos) < 200) {
      xPos = lerp(xPos, player.xPos, lerp);
      yPos = lerp(yPos, player.yPos, lerp);
      if (xPos<=peopleSize|| xPos>=width-peopleSize) {
        lerp/=10;
      }

      if (yPos<=peopleSize || yPos>=height-peopleSize) {
        lerp/=5;
      }
    }

    if (timeFreeze==true) {
      xPos+=0;
      yPos+=0;
    }
    else {
      xPos+=targetSpeedX;
      yPos+=targetSpeedY;
      lerp=-.01;
    }


    if (xPos<=peopleSize/2 || xPos>=width-peopleSize/2) {
      //  lerp=0;
      targetSpeedX*=-1;
    }

    if (yPos<=peopleSize/2 || yPos>=height-peopleSize/2) {
      // lerp=0;
      targetSpeedY*=-1;
    }

    if (found==true) {
      c=0;
    }
  }
}


