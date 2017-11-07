//Kamden Wall
//2D array project (Grid style Game)
//


//the grid
int[][] screen;
int col,row;
int squareWidth,squareHeight;

//different sprites
int charX,charY;



void setup() {
  size(600,800); //3:4 ratio
  col = 15;
  row = 20;
  getValuesOfBoard();
}


void draw() {
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
}




void moveCharU() {
  //moves character up
  screen[charX][charY] = 0;
  charY --;
  screen[charX][charY] = 1;
}



void moveCharD() {
  //moves character up
  screen[charX][charY] = 0;
  charY ++;
  screen[charX][charY] = 1;
}



void moveCharL() {
  //moves character up
  screen[charX][charY] = 0;
  charX --;
  screen[charX][charY] = 1;
}



void moveCharR() {
  //moves character up
  screen[charX][charY] = 0;
  charX ++;
  screen[charX][charY] = 1;
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