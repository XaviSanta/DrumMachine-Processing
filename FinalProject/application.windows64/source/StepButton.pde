/* Xavier Santamaria */

int size = 45;
ArrayList<StepButton> sBList = new ArrayList<StepButton>();

void setupStepButtons() {
  int id = 0;
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sB = new StepButton(i, j, id);
      sBList.add(sB);
      id++;
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

  int col = (x-xInitial)/size;
  int row = (y-yInitial)/size;
  return col * 7 + row;
}

class StepButton { 
  int col, row, id; 
  boolean isClicked;
  
  
  StepButton (int col, int row, int id) {  
    this.col = col;
    this.row = row;
    this.id = id;
    isClicked = false;
  } 

  int getId() {
    return id;
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
    sound[row].trigger();
  }

  void drawSquare() {
    setButtonColor();

    translate(width*.15 + col*size, height*.5 + row*size);
    
    rect(0, 0, size, size, 15, 15, 15, 15);
    drawNumber();
    
    translate(-width*.15 -col*size, -height*.5 -row*size);
    
    stroke(255);
    strokeWeight(2);
  }

  void hover() {
    stroke(255,234,21);
    drawSquare();
    
  }
  
  void setButtonColor() {
    if(hoverButton == id) {
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

  void drawNumber() {
    if (row == 0 && (col % 4) == 0) {
      translate(size/2 - 3, -size*0.1);
      fill(buttonStepColorOff);
      textSize(15);
      
      text(4*col/16+1, 0, 0); //To write 1, 2, 3, 4
      
      translate(-size/2 + 3, size*0.1);
    }
    if (row == 6) {
      translate(size/2 - 5, size*1.5);
      fill(buttonStepColorOff);
      textSize(15);
      
      text(col + 1, 0, 0);
      
      translate(-size/2 + 5, -size*1.5);
    }
  }
} 
