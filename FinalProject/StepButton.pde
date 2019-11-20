int size = 45;

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
    isClicked = !isClicked;
  }
} 

boolean isInStepButtonRange(int x, int y) {
  if (x < 154 || x > 154 + 4 * 4 * size || 
      y < 385 || y > 385 + 7 *     size) {
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

  //println("Row,Col ", (x-xInitial)/size, (y-yInitial)/size);
  int row = (x-xInitial)/size;
  int col = (y-yInitial)/size;
  println(mouseX, mouseY);
  return row * 7 + col;
}
