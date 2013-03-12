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

