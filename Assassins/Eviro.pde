class Enviro {

  PVector pos;
  float diam;
  float size;
  color c;
  int coolness;


  boolean debug = true;    //When activated, this will show the range of the distraction

  void prime(PVector _pos, float _size, float _diam, color _c, int _coolness) {
    pos=_pos;
    size=_size;
    diam=_diam;
    c=_c;
    coolness=_coolness;
    
    for (int i=0; i<sheep.size(); i++) {
        Sheep temp = sheep.get(i); 
        temp.stuckTime = coolness*1000;
        temp.coolTime = (coolness+2)*1000;
    }
  }



  void update() {
    rectMode(CENTER);
    fill(c);
    rect(pos.x, pos.y, size, size);

    if (debug==true) {
      fill(c, 50);
      ellipse(pos.x, pos.y, diam, diam);

//  This part of the code dictates the effect that //
//  environmental hazards have on sheep. Proceeed  //
//  with caution                                   //

//  Set "stuckTime" and "coolTime" in LevelData


      for (int i=0; i<sheep.size(); i++) {
        Sheep temp = sheep.get(i); 
        

        if (temp.wasStuck==false && pos.dist(temp.pos)<diam/2) {
          temp.sheepVel.x=0;
          temp.sheepVel.y=0;
          temp.stuck=temp.time;
          temp.wasStuck=true;
    //      println("Caught");
        }
        if (temp.time==temp.stuck+temp.stuckTime) {
    //      println("Free");
          temp.coolDown=temp.time;
          temp.sheepVel = new PVector(random(-2, 2), random(-2, 2));
        }
        if (temp.time==temp.coolDown+temp.coolTime) {
   //       println("Vulnerable");
          temp.wasStuck=false;
        }
      }
    }
  }
}

