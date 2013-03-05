float peopleSize;
Player player;

void setup(){
  size(600,600);
  background(255);
  
  
  float peopleSize = 10;
  
  player = new Player();
  player.prime();
  
  
}

void draw(){
  player.drawPlayer();
  player.update();
  
}


