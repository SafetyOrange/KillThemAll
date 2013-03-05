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

