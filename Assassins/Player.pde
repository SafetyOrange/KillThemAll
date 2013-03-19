class Player {

  float playerSpeed;
  PVector pos;
  int health;
  boolean alive;

  void prime() {
    playerSpeed = 5;
    pos = new PVector(width/2, 20);
    health = 100;
    alive = true;
  }

  void drawPlayer() {
    fill(0, 175, 0);
    stroke(0);
    ellipse(pos.x, pos.y, peopleSize, peopleSize);
  }

  void update() {

    //   collision detection: Player against sheep


    //    for (int i=0;i<sheep.length;i++) {    //commenting out while working on arraylist
    for (int i=0; i<sheep.size(); i++) {
      Sheep tempSheep = sheep.get(i);
      if (pos.dist(tempSheep.pos) < peopleSize) {
        tempSheep.sheepVel.x *=-1;
        tempSheep.sheepVel.y*=-1;
      }
    }


    //      if (pos.dist(sheep[i].pos) < (peopleSize)) {
    //        sheep[i].sheepVel.x *= -1; 
    //        sheep[i].sheepVel.y *= -1;
    //        if(health>0)  health-=1;
    //      }
    //    }

    fill(0, 255, 0);
    rectMode(CORNER);                         //HEALTH BAR!
    rect(20, 10, health, 5);


    //sheep against sheep
    for (int i=0; i<sheep.size(); i++) {
      for (int j=0; j<sheep.size(); j++) {
        Sheep tempSheep1 = sheep.get(i);
        Sheep tempSheep2 = sheep.get(j);

        if (tempSheep1.pos.dist(tempSheep2.pos) < peopleSize && tempSheep1 != tempSheep2) { //if sheep are touching and if they are not the same sheep
//          tempSheep1.sheepVel.x *= -1; 
//          tempSheep1.sheepVel.y *= -1;
        }
      }
    }    


    /*   for (int i=0;i<sheep.length;i++) {
     for (int j=0;j<sheep.length;j++) {   
     
     if (sheep[i].pos.dist(sheep[j].pos) < (peopleSize) && sheep[i] != sheep[j]) {
     //          sheep[i].sheepVel.x *= -1; 
     //          sheep[i].sheepVel.y *= -1;
     }
     }
     }
     */


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

