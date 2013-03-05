class Player{
  
  float playerSpeed;
  float xPos;
  float yPos;
  
  void prime(){
    playerSpeed = 5;
    peopleSize = 10;
  }
  
  void drawPlayer(){
    fill(0,175,0);
    stroke(0);
    ellipse(xPos, yPos, peopleSize, peopleSize);
  }
  
  void update(){
    
  }
  
}
