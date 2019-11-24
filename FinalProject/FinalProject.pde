/* Xavi Santamaria */
import controlP5.*;
import java.util.*; 

ControlP5 cp5;
String fileName;


void setup() {
  size(1024, 768);
  cp5 = new ControlP5(this);
  
  setupAudio();  
  setupSliders();
  setupPlayPauseToggle();
  setupStepButtons();
}



void mouseClicked() {  
  if (isInStepButtonRange(mouseX, mouseY)) {
    getStepButton(mouseX, mouseY).activate();
  }
}

void setupSliders() {
  cp5.addSlider("MasterVolume")
    .setPosition(30, 50)
    .setSize(100, 20)
    .setRange(-24, 24)
    .setValue(0);
  
  for(int i = 0; i < 7; i++) {
    String volRow = "Volume" + Integer.toString(1+i);
    cp5.addSlider(volRow)
      .setPosition(width*.15+size*16 + 5, size*i + height*.5 + size/2.5)
      .setSize(80, 10)
      .setRange(-24, 24)
      .setValue(0);
  }
}

void setupPlayPauseToggle() {
  cp5.addToggle("PlayPause")
    .setPosition(width*.9,50)
    .setSize(35,35)
    .setValue(false);
}

void PlayPause(boolean theFlag) {
  playToggle = theFlag;
  time = millis(); //To start from the initial column
}
