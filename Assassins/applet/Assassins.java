import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class Assassins extends PApplet {

float peopleSize;
Player player;

public void setup(){
  size(600,600);
  background(255);
  
  
  float peopleSize = 10;
  
  player = new Player();
  player.prime();
  
  
}

public void draw(){
  player.drawPlayer();
  player.update();
  
}


class Player{
  
  float playerSpeed;
  float xPos;
  float yPos;
  
  public void prime(){
    playerSpeed = 5;
    peopleSize = 10;
  }
  
  public void drawPlayer(){
    fill(0,175,0);
    stroke(0);
    ellipse(xPos, yPos, peopleSize, peopleSize);
  }
  
  public void update(){
    
  }
  
}
class Sheep{
  
}
class Target{
  
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "Assassins" });
  }
}
