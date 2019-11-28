int size = 45;
ArrayList<StepButton> sBList = new ArrayList<StepButton>();

void setupStepButtons() {
  int counter = 0;
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sB = new StepButton(i, j, counter);
      sBList.add(sB);
      counter++;
    }
  }
}

boolean isInStepButtonRange(int x, int y) {
  if (x < 152 || x > 152 + 16 * size || 
    y < 382 || y > 382 + 7 *  size) {
    return false;
  } else {
    return true;
  }
}

StepButton getStepButton(int x, int y) {
  int id = getButtonIdFromCoordenates(x, y);
  return sBList.get(id);
}

int getButtonIdFromCoordenates(int x, int y) {
  int xInitial = 154;
  int yInitial = 385;

  int row = (x-xInitial)/size;
  int col = (y-yInitial)/size;
  return row * 7 + col;
}

class StepButton { 
  int row, col, id; 
  boolean isClicked;
  
  StepButton (int row, int col, int id) {  
    this.row = row;
    this.col = col;
    this.id = id;
    isClicked = false;
  } 

  int getId() {
    return id;
  }

  int getButtonRow() { 
    return row;
  }

  int getButtonCol() { 
    return col;
  }

  void activate() {
    if (isClicked) {
      isClicked = false;
    } else {
      isClicked = true;
      playSound();
    }
  }

  void playSound() {
    sound[col].trigger();
  }

  void drawSquare() {
    setButtonColor();

    translate(width*.15 + row*size, height*.5 + col*size);
    
    rect(0, 0, size, size, 15, 15, 15, 15);
    drawNumber();
    
    translate(-width*.15 -row*size, -height*.5 -col*size);
  }

  void hover() {
    stroke(255,234,21);
    drawSquare();
    
  }
  
  void setButtonColor() {
    if(hoverButton == id) stroke(secondaryColor);
    else stroke(255);
    
    if (this.isClicked) {
      fill(buttonStepColorOn);
    } else {
      fill(buttonStepColorOff);
    }
  }

  void drawNumber() {
    if (col == 0 && (row % 4) == 0) {
      translate(size/2 - 3, -size*0.1);
      fill(buttonStepColorOn);
      textSize(15);
      text(4*row/16+1, 0, 0); //To write 1, 2, 3, 4
      translate(-size/2 + 3, size*0.1);
    }
    if (col == 6) {
      translate(size/2 - 5, size*1.5);
      fill(buttonStepColorOn);
      textSize(15);
      text(row + 1, 0, 0);
      translate(-size/2 + 5, -size*1.5);
    }
  }
} 
