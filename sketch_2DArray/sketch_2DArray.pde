//Kamden Wall
//
int[][] screen;
int col,row;
int squareWidth,squareHeight;


void setup() {
  size(1200,400); //3:1 ratio
  screen = new int[col][row];
  col = 120;
  row = 40;
  squareHeight = 10;
  squareWidth = 10;
}

void draw() {
  displayBackground();
}

void displayBackground() {
  //This will make the grid for the game
  for (int x=0; x<col;x+=squareWidth) {
    for (int y=0; y<row;y+=squareHeight) {
      fill(255);
      rect(x,y,x*squareWidth,y*squareHeight);
    }
  }
}