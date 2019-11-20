void draw() {
  background(0);
  drawTable();
  drawMeshStepButtons();
}

public void drawTable() {
  //rotateX(0.1);
  stroke(0);
  fill(tableColor);
  //rect(width*.05, height*.05, width*.9, height*.9);
  rect(0, 0, width, height, 35, 35, 35, 35);
}

public void drawMeshStepButtons() {
  strokeWeight(2);
  stroke(0);
  translate(width*.15, height*.5);
  int counter = 0;
  for (int i = 0; i < 4*4; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sb = sBList.get(counter);
      if(sb.isClicked){
        fill(buttonStepColorOn);
      } else {
        fill(buttonStepColorOff);
      }
      translate(i*size, j*size);
      rect(0, 0, size, size, 15, 15, 15, 15);
      translate(-i*size, -j*size);
      
      counter++;
    }
  }
}

void mouseClicked() {  
  if (isInStepButtonRange(mouseX, mouseY)) {
    getStepButton(mouseX, mouseY).activate();
    
  }
}
