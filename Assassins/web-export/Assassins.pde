titleScreen titlescreen;

float peopleSize;
Player player;
Sheep[] sheep;
Target target;

int gameState;  //Counter to determine the game state

boolean upTrue, downTrue, leftTrue, rightTrue = false;
boolean found;
boolean timeFreeze;

void setup() {
  titlescreen = new titleScreen();
  gameState=1;// set to 0 to include the start screen. Turned off for debugging. 
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

class Player {

  float playerSpeed;
  PVector pos;
  int health;
  boolean alive;

  void prime() {
    playerSpeed = 5;
    pos = new PVector(20, 20);
    health = 100;
    alive = true;
  }

  void drawPlayer() {
    fill(0, 175, 0);
    stroke(0);
    ellipse(pos.x, pos.y, peopleSize, peopleSize);
  }

  void update() {

    //collision detection: Player against sheep
    for (int i=0;i<sheep.length;i++) {   
      if (pos.dist(sheep[i].pos) < (peopleSize)) {
        sheep[i].sheepVel.x *= -1; 
        sheep[i].sheepVel.y *= -1;
        health-=2;
        println(health);
      }
    }
    //sheep against sheep
    for (int i=0;i<sheep.length;i++) {
      for (int j=0;j<sheep.length;j++) {   

        if (sheep[i].pos.dist(sheep[j].pos) < (peopleSize) && sheep[i] != sheep[j]) {
          //          sheep[i].sheepVel.x *= -1; 
          //          sheep[i].sheepVel.y *= -1;
        }
      }
    }


    if (upTrue==true) {
      pos.y -= playerSpeed;
    }

    if (downTrue==true) {
      pos.y += playerSpeed;
    }

    if (leftTrue==true) {
      pos.x -= playerSpeed;
    }

    if (rightTrue==true) {
      pos.x += playerSpeed;
    }
  }
}

class Sheep {

  PVector sheepVel;
  PVector pos;
  int direction = int(random(3)); //this isn't used anywhere? Were you planning to?
  color sheepColor;

  void prime() {
    sheepVel = new PVector(random(-2, 2), random(-2, 2));
    if (sheepVel.x<1) {
      sheepVel.x++;
    }
    if (sheepVel.y<1) {
      sheepVel.y++;
    }

    pos = new PVector(random(peopleSize, width-peopleSize), random(peopleSize, height-peopleSize));
    sheepColor = color(175, 175, 0);
  }
  void drawSheep() {
    fill(sheepColor);
    stroke(0);
    ellipse(pos.x, pos.y, peopleSize, peopleSize);
  }

  void updateSheep() {

    if (timeFreeze==true) {
      pos.x+=0;
      pos.y+=0;
    }
    else {
      pos.add(sheepVel);
    }

    if (pos.x<=peopleSize/2 || pos.x>=width-peopleSize/2) {
      sheepVel.x*=-1;
    }
    if (pos.y<=peopleSize/2 || pos.y>=height-peopleSize/2) {
      sheepVel.y*=-1;
    }
  }
}

class Target {

  float lerp=-.01;
  PVector pos;
  PVector targetVel;
  color targetColor;

  void prime() {
    targetColor = color(175, 175, 0);
    targetVel= new PVector(random(-2, 2), random(-2, 2));

    if (targetVel.x<1) {
      targetVel.x++;
    }
    if (targetVel.y<1) {
      targetVel.y++;
      peopleSize = 20;
    }
    pos= new PVector(random(peopleSize, width-peopleSize), random(peopleSize, height-peopleSize));
  }

  void drawTarget() {
    fill(targetColor);
    stroke(0);
    ellipse(pos.x, pos.y, peopleSize, peopleSize);
  }

  void update() {



    if (timeFreeze==true) {
      pos.x+=0;
      pos.y+=0;
    }
    else {
      if (pos.dist(player.pos) < 200) {
        pos.lerp(player.pos, lerp);
        if (pos.x<=peopleSize|| pos.x>=width-peopleSize) {
          lerp/=10;
        }

        if (pos.y<=peopleSize || pos.y>=height-peopleSize) {
          lerp/=5;
        }
      }

      pos.add(targetVel);
      lerp=-.01;
    }


    if (pos.x<=peopleSize/2 || pos.x>=width-peopleSize/2) {
      //  lerp=0;
      targetVel.x*=-1;
    }

    if (pos.y<=peopleSize/2 || pos.y>=height-peopleSize/2) {
      // lerp=0;
      targetVel.y*=-1;
    }


    if (found==true) {
      targetColor = color(175, 0, 0);
    }
  }
}

class titleScreen {
  PImage screen;
  titleScreen() {
    screen = loadImage("assassinsTitleScreen.png");
  }
  void update() {
    //display title screen image
    image(screen, 0, 0);
    //check to see if mouse is clicking the start button
    //the start button on the template is at x = 259, y = 526
    //the size of the button: width = 231 height = 62
    if (mousePressed) {
      if (mouseX>259 && mouseX<259+231 && mouseY>526 && mouseY<526+62) {
        //start button is pressed
        //change stage to the next one
        //reset any timer variable if necessary
        gameState = 1;
      }
    }
  }
}


