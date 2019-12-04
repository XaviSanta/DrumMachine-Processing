int hoverButton;

void draw() {
  background(0);
  strokeWeight(2);
  
  drawTable();
  
  if (playToggle) drawMetronome();
  
  drawMeshStepButtons();
  drawSynth();
  
  checkRecording();
  
  drawHoveredButton();
  
  showPlaylistName();
}



void drawTable() {
  stroke(0);
  fill(tableColor);
  rect(0, 0, width, height, 35, 35, 35, 35);
}

void drawMeshStepButtons() {
  stroke(0);
  for(int i = 0; i < sBList.size(); i++){
    sBList.get(i).drawSquare();
  }
}

void drawSynth() {
  translate(0,100);
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    // draw a line from one buffer position to the next for both channels
    line( x1, 50 - out.left.get(i)*50, x2, 50 - out.left.get(i+1)*50);
    //line( x1, 150 - out.right.get(i)*50, x2, 150 - out.right.get(i+1)*50);
  }  
  translate(0,-100);
}

void drawMetronome() {
  xMetronome = calculateMetronomeXPosition();
  fill(buttonStepColorOn);
  rect(xMetronome, y +5, size, size -10, 80, 80, 5,5);
}

void checkRecording() {
  if(microhponeWorks) {
    if(recorder.isRecording()){
      recorderTimer++;
      text("Recording...", 30, height*.5 - 20);
      if(recorderTimer > 30){
        saveRecord();
      }
    }
  }
  
 if(recorderOut.isRecording()) {
    text("Recording...", width*.9, height*.4 - 20);
 }
}

void drawHoveredButton() { 
  if(hoverButton != -1) sBList.get(hoverButton).drawSquare(); 
}

void showPlaylistName() {
  textAlign(CENTER);
  textSize(18);
  text("Playing " + playlistName[iPlaylist] + " playlist", width/2, 25);
  textAlign(LEFT);
  textSize(12);
}
