class Sheep {

  float sheepSize;
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

    sheepSize = 20;
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

