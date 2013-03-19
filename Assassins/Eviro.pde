class Enviro{
  
  PVector pos;
  float diam;
  float size;
  color c;
  float coolness;
  boolean debug = true;    //When activated, this will show the range of the distraction
  
void prime(PVector _pos, float _size, float _diam, color _c, float _coolness){
  pos=_pos;
  size=_size;
  diam=_diam;
  c=_c;
  coolness=_coolness;
  
}



void update(){
  rectMode(CENTER);
  fill(c);
  rect(pos.x, pos.y, size, size);
  
  if(debug==true){
    fill(c, 50);
    ellipse(pos.x,pos.y,diam,diam);
    
    
    
    
    for (int i=0; i<sheep.size(); i++) {
      Sheep temp = sheep.get(i); 
      if(pos.dist(temp.pos)<diam/2){
        temp.sheepVel.x=0;
        temp.sheepVel.y=0;
      }
    }
  
}

}


}
