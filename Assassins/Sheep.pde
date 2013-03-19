class Sheep {

  PVector sheepVel;
  PVector pos;
  
  color sheepColor;

  boolean wasStuck = false;    //Check to see if it's recently been stuck

  int coolDown;
  int stuck;
  int time;

  int coolTime;
  int stuckTime;

  void prime() { 
    
    sheepVel = new PVector(random(-2, 2), random(-2, 2));
    if (sheepVel.x<1) {
      sheepVel.x++;
    }
    if (sheepVel.y<1) {
      sheepVel.y++;
    }

    pos = new PVector(random(peopleSize/2, width-peopleSize/2), random(peopleSize/2+spawnBuffer, height-peopleSize/2));
    sheepColor = color(175, 175, 0);
    stuck=20000;
    coolTime=20000;
  }
  void drawSheep() {
    fill(sheepColor);
    stroke(0);
    ellipse(pos.x, pos.y, peopleSize, peopleSize);
  }

  void updateSheep() {
time=millis();


    if (timeFreeze==true && tfCharge>0) {
      pos.x+=0;
      pos.y+=0;
    }
    else {
      pos.add(sheepVel);
    }

    if (pos.x<=peopleSize/2 || pos.x>=width-peopleSize/2) {
      sheepVel.x*=-1;
    }
    if (pos.y<=(peopleSize/2)+spawnBuffer || pos.y>=height-peopleSize/2) {
      sheepVel.y*=-1;
    }


//    if (wasStuck==true) {
//      coolDown=0;
//      sheepVel = new PVector(random(-2, 2), random(-2, 2));
//    }
//
//    if (coolDown==coolTime) {
//      wasStuck=false;
//    }
  }
}

