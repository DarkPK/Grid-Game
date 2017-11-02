//Kamden Wall
//2D array project (Grid style Game)
//

int[][] screen;
int col,row;
int squareWidth,squareHeight;
int charX,charY,monsterX,monsterY;
int facing;


void setup() {
  size(600,800); //3:4 ratio
  col = 15;
  row = 20;
  getValuesOfBoard();
  getMonsters();
}

void draw() {
  monCharDetection();
  moveMonster();
  displayBackground();
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
    if (facing == 0) {
      if (charY != 1) {
        screen[charX][charY-1] = 3;
      }
    }
    else if (facing == 1) {
      if (charX != col-1) {
        screen[charX+1][charY] = 3;
      }
    }
    else if (facing == 2) {
      if (charY != row-1) {
        screen[charX][charY+1] = 3;
      }
    }
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
}

void getMonsters() {
  //sets the value of monster(s)
  monsterX = int(random(col));
  monsterY = int(random(row-1));
  screen[monsterX][monsterY] = 2;
}

void moveMonster() {
  //this gets the monster to move towards you
  if (frameCount % 30 == 0) {
    for (int x=col-1; x>=0; x--) {
      for (int y=row-1; y>=0; y--) {
        if (screen[x][y] == 2) {
          screen[x][y] = 0;
          if (monsterY < charY) {
            if (monsterY <= col-1) {
              screen[x][y+1] = 2;
            }
          }
          else if (monsterY > charY) {
            if (monsterY != 0) {
              screen[x][y-1] = 2;
            }
          }
          if (monsterX < charX) {
            if (monsterX <= row-1) {
              screen[x+1][y] = 2;
            }
          }
          else if (monsterX > charX) {
            if (monsterX != 0) {
              screen[x-1][y] = 2;
            }
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