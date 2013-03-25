
void keyPressed() {                //Player input
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
  }

  if (keyCode==ENTER) {
    nextScreen=true;
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
  }

  if (keyCode=='R') {
    setup();
  }

  if (keyCode==ENTER) {
    nextScreen=false;
  }
}

void mouseClicked() {
  if (dist(mouseX, mouseY, target.pos.x, target.pos.y)<peopleSize) {      //KILL TARGET
    found=true;
    gameState++;
    println("Found.");
    found=false;
    target.prime();
    player.pos = new PVector(width/2, 20);                                //reset player location
  }

  for (int i=0; i<sheep.size(); i++) {
    Sheep temp = sheep.get(i); 
    if (dist(mouseX, mouseY, temp.pos.x, temp.pos.y)<peopleSize/2) {        // KILL INNOCENT

      gameState  = 100;
    }
  }
}
