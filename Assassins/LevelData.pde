  void lev1(){
    player.drawPlayer();
    player.update();

    for (int i=0;i<sheep.length;i++) {
      sheep[i].drawSheep();
      sheep[i].updateSheep();
    }

    target.drawTarget();
    target.update();
    
    
    
  }
  
  
  
  
  
  
  
