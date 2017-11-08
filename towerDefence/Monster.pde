class Monster {
  int monX, monY;
  int col,row;
  int frames;
  
  Monster() {
    col = 15;
    row = 20;
    
    monX = int(random(0,col));
    monY = 0;
    
    frames = 60;
    
    screen[monX][monY] = 2;
  }
  
  void move() {
  //this gets the monster to move down
    if (frameCount % frames == 0) {
    
      for (int x=col-1; x>=0; x--) {
      
        for (int y=row-1; y>=0; y--) {
            
          if (screen[x][y] == 2) {
            screen[x][y] = 0;
            
            if (y < row-1) {
              screen[x][y+1] = 2;
            }
          }
        }
      }
    }
  }
   
}