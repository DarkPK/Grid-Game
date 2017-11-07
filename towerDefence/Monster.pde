class monster {
  int monX, monY;
  int col,row;
  
  monster() {
    col = 15;
    row = 20;
    
    monX = int(random(0,col));
    monY = 0;
  }
  
  void move() {
  //this gets the monster to move down
    if (frameCount % 30 == 0) {
    
      for (int x=col-1; x>=0; x--) {
      
        for (int y=row-1; y>=0; y--) {
          
          if (y < charY) {
            
            if (screen[x][y] == 2) {
            
              if (y == row-1 && monY == y && monX == x) {
                screen[x][y] = 2;
              }
            
              else {
                screen[x][y+1] = 2;
              }
            }
          }
        }
      }
    }
  }
  
}