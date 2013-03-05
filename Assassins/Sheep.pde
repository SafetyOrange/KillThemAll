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
   xPos+=sheepSpeedX;
   yPos+=sheepSpeedY;


    if (xPos<=peopleSize/2 || xPos>=width-peopleSize/2) {
      sheepSpeedX*=-1;
    }

    if (yPos<=peopleSize/2 || yPos>=height-peopleSize/2) {
      sheepSpeedY*=-1;
    }

  }
}

