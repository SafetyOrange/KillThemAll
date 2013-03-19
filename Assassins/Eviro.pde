class Enviro{
  PVector pos;
  float diam;
  float size;
  color c;
  boolean debug;
  
void prime(PVector _pos, float _size, float _diam, color _c){
  pos=_pos;
  size=_size;
  diam=_diam;
  c=_c;
  
}



void update(){
  
  fill(c);
  rect(pos.x, pos.y, size, size);
  
}




}
