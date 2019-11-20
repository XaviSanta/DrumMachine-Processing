int size = 45;

class StepButton{ 
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
  return true;
}

StepButton getStepButton(int x, int y) {
  int xInitial = 154;
  int yInitial = 385;

  println("Row,Col ", (x-xInitial)/size, (y-yInitial)/size);
  int row = (x-xInitial)/size;
  int col = (y-yInitial)/size;
  
  
  //StepButton sb = sBList.get(ID);
  //println(sb.getID());
  //return sb;
  return null;
}
