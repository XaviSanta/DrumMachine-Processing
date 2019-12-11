/* Xavier Santamaria */

int size = 45;
ArrayList<StepButton> sBList = new ArrayList<StepButton>(); // List of stepButtons

/*
  Creates all the buttons needed which is a double for, 16 columns and 7 rows
*/
void setupStepButtons() { 
  int id = 0;
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sB = new StepButton(i, j, id);
      sBList.add(sB); // List of StepButtons
      id++;
    }
  }
}

/*
  check if coordenates are in the range of the StepButtons
*/
boolean isInStepButtonRange(int x, int y) {
  if (x < 152 || x > 152 + 16 * size || 
    y < 382 || y > 382 + 7 *  size) {
    return false;
  } else {
    return true;
  }
}

/*
  get the StepButton given some coordenates 
*/
StepButton getStepButton(int x, int y) {
  int id = getButtonIdFromCoordenates(x, y);
  return sBList.get(id);
}

/*
  get the ID of the button given some coordenates
*/
int getButtonIdFromCoordenates(int x, int y) {
  int xInitial = 154; // x Where the first stepbutton is
  int yInitial = 385; // y Where the first stepbutton is

  int col = (x-xInitial)/size;
  int row = (y-yInitial)/size;
  int id  = col*7 + row;
  return id;
}

// CLAS STEP BUTTON -----------------------------------------------
class StepButton { 
  int col, row, id; 
  boolean isClicked;
  
  // Constructor
  StepButton (int col, int row, int id) {  
    this.col = col;
    this.row = row;
    this.id = id;
    isClicked = false;
  }

  /*
    Activate the button. 
    If it was activated already ->set is clicked to false 
    Else -> set isClicked to true and playTheSound of the row 
  */ 
  void activate() {
    if (isClicked) {
      isClicked = false;
    } else {
      isClicked = true;
      playSound();
    }
  }

  /*
    Trigger the sound of that row
  */
  void playSound() {
    sound[row].trigger();
  }
  
  /*
    We use translate for better clear code in the rect()
  */
  void drawSquare() {
    setButtonColor(); // It changes the color if the mouse is in tha location of the button (Hover)

    translate(width*.15 + col*size, height*.5 + row*size);
    
    rect(0, 0, size, size, 15, 15, 15, 15);
    drawNumber(); // Draw the numbers that appear in the UI
    
    translate(-width*.15 -col*size, -height*.5 -row*size);
    
    stroke(255);
    strokeWeight(2);
  }
  
  /*
    set different color of a button depending if the mouse is on top of the button or if it is clicked or not
  */
  void setButtonColor() {
    if(hoverButton == id) { // If hover button has the same id as the button id, use a secondary color and bigger stroke
      stroke(secondaryColor);
      strokeWeight(4);
    }
    else {
      stroke(255);
      strokeWeight(2);
    }
    if (this.isClicked) {
      fill(buttonStepColorOn);
    } else {
      fill(buttonStepColorOff);
    }
  }
  
  /*
    Draw the numbers that appear in the UI
  */
  void drawNumber() {
    if (row == 0 && (col % 4) == 0) { // Draw the 1, 2, 3, 4 numbers if we are in the first row and col%4
      translate(size/2 - 3, -size*0.1);
      fill(buttonStepColorOff);
      textSize(15);
      
      int number = 4*col/16+1; //number will be either 1, 2, 3 or 4 depending on the column the button is
      text(number, 0, 0); 
      
      translate(-size/2 + 3, size*0.1);
    }
    if (row == 6) { // If we are in the last row, draw the 1 to 16 numbers that represent each column
      translate(size/2 - 5, size*1.5);
      fill(buttonStepColorOff);
      textSize(15);
      
      text(col + 1, 0, 0);
      
      translate(-size/2 + 5, -size*1.5);
    }
  }
} 
