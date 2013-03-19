class Enviro{
  
  PVector pos;
  float diam;
  float size;
  color c;
  boolean debug = true;    //When activated, this will show the range of the distraction
  
void prime(PVector _pos, float _size, float _diam, color _c){
  pos=_pos;
  size=_size;
  diam=_diam;
  c=_c;
  
}



void update(){
  rectMode(CENTER);
  fill(c);
  rect(pos.x, pos.y, size, size);
  
  if(debug==true){
    fill(c, 50);
    ellipse(pos.x,pos.y,diam,diam);
  
}

}


}
