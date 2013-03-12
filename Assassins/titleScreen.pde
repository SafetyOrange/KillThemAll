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

