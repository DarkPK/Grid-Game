//Kamden Wall
//2D array project (Grid style Game)
//


//the grid
int[][] screen;
int col,row;
int squareWidth,squareHeight;

//different sprites
int charX,charY,monsterX,monsterY;
int facing;
int spearX,spearY;

//make spear leave
int spearAttack;
int spearTime;



void setup() {
  size(600,800); //3:4 ratio
  col = 15;
  row = 20;
  getValuesOfBoard();
  getMonsters();
}

void draw() {
  monCharDetection();
  spearMonCollision();
  displayBackground();
  moveMonsterD();
  moveMonsterU();
  stopSpear();
}



void keyPressed() {
  if (key == 'w') {
    if (charY >= 1) {
      moveCharU();
    }
  }
  
  else if (key == 'a') {
    if (charX >= 1) {
      moveCharL();
    }
  }
  
  else if (key == 's') {
    if (charY < row-1) {
      moveCharD();
    }
  }
  
  else if (key == 'd') {
    if (charX < col-1) {
      moveCharR();
    }
  }
  
  else if (key == ' ') {
    spear();
  }
}




void moveCharU() {
  //moves character up
  screen[charX][charY] = 0;
  charY --;
  screen[charX][charY] = 1;
  facing = 0;
}



void moveCharD() {
  //moves character up
  screen[charX][charY] = 0;
  charY ++;
  screen[charX][charY] = 1;
  facing = 2;
}



void moveCharL() {
  //moves character up
  screen[charX][charY] = 0;
  charX --;
  screen[charX][charY] = 1;
  facing = 3;
}



void moveCharR() {
  //moves character up
  screen[charX][charY] = 0;
  charX ++;
  screen[charX][charY] = 1;
  facing = 1;
}



void getValuesOfBoard() {
  //sets the board values
  screen = new int[col][row];
  squareWidth = width/col;
  squareHeight = height/row;
  
  //sets the character
  charX = col/2;
  charY = row-1;
  screen[charX][charY] = 1;
  facing = 0;
  
  //this makes the spear leave
  spearAttack = millis();
}



void getMonsters() {
  //sets the value of monster(s)
  monsterX = int(random(col));
  monsterY = int(random(row-1));
  screen[monsterX][monsterY] = 2;
}



void moveMonsterD() {
  //this gets the monster to move down
  if (frameCount % 30 == 0) {
    
    for (int x=col-1; x>=0; x--) {
      
      for (int y=row-1; y>=0; y--) {
        
        if (screen[x][y] == 2) {
          screen[x][y] = 0;
          
          if (y < charY) {
            
            if (y == row-1) {
              screen[x][y] = 2;
              monsterX = x;
              monsterY = y;
            }
            
            else {
              screen[x][y+1] = 2;
              monsterX = x;
              monsterY = y+1;
            }
          }
        }
      }
    }
  }
}



void moveMonsterU() {
  //moves the monster up
  if (frameCount % 30 == 0) {
    
    for (int x=col-1; x>=0; x--) {
      
      for (int y=row-1; y>=0; y--) {
        
        if (y < charY) {
          
          if (y == 0) {
            screen[x][y] = 2;
            monsterX = x;
            monsterY = y;
          }
          
          else {
            screen[x][y-1] = 2; 
            monsterX = x;
            monsterY = y-1;
          }
        }
      }
    }
  }
}



void displayBackground() {
  //This will make the grid for the game
  for (int x=0; x<col;x++) {
    for (int y=0; y<row;y++) {
      if (screen[x][y] == 1) {
        fill(0);
      }
      
      else if (screen[x][y] == 2) {
        fill(255,0,0);
      }
      
      else if (screen[x][y] == 3) {
        fill(0,249,255);
      }
      
      else {
        fill(255);
      }
      
      noStroke();
      rect(x*squareWidth,y*squareHeight,squareWidth,squareHeight);
    }
  }
}



void monCharDetection() {
  //checks if you touch monster
  if (charX == monsterX && charY == monsterY) {
    screen[charX][charY] = 2;
    charX = col/2;
    charY = row-1;
    screen[col/2][row-1] = 1;
  }
}



void spear() {
  //this is your attack
  if (facing == 0 && charY != 0) {
    screen[charX][charY-1] = 3;
    spearX = charX;
    spearY = charY-1;
    spearTime = spearAttack;
  }
  
  else if (facing == 1&& charX != col-1) {
    screen[charX+1][charY] = 3;
    spearX = charX+1;
    spearY = charY;
    spearTime = spearAttack;
  }
  
  else if (facing == 2 && charY != row-1) {
    screen[charX][charY+1] = 3;
    spearX = charX;
    spearY = charY+1;
    spearTime = spearAttack;
  }
  
  else if (facing == 3 && charX != 0){
    screen[charX-1][charY] = 3;
    spearX = charX-1;
    spearY = charY;
    spearTime = spearAttack;
  } 
}


void stopSpear() {
  //stops the spear
 if (spearAttack - spearTime >= 1000) {
   screen[spearX][spearY] = 0;
  }
}



void spearMonCollision() {
  //this will make yyou kill the monster
  if (monsterX == spearX && monsterY == spearY) {
    screen[monsterX][monsterY] = 0;
    monsterX = 0;
    monsterY = 0;
    spearTime = spearAttack;
  }
}