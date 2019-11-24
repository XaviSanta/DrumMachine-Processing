/* Xavi Santamaria */
import controlP5.*;
import java.util.*; 

ControlP5 cp5;
String fileName;


void setup() {
  size(1024, 768);

  setupAudio();  

  time = millis();

  setupSliders();
  setupStepButtons();
}



void mouseClicked() {  
  if (isInStepButtonRange(mouseX, mouseY)) {
    getStepButton(mouseX, mouseY).activate();
  }
}

void setupSliders() {
  cp5 = new ControlP5(this);
  cp5.addSlider("MasterVolume").setPosition(30, 50).setSize(80, 10).setRange(-24, 24).setValue(0);
  for(int i = 0; i < 7; i++) {
    String volName = "volName" + Integer.toString(i);
    cp5.addSlider(volName).setPosition(30, 45*i + height*.5).setSize(80, 10).setRange(-24, 24).setValue(0);
  
  }
}

void MasterVolume(int theMVol) {
  for(int i = 0; i < audioList.size(); i++){
    AudioPlayer p = audioList.get(i);
    p.setGain(theMVol);
  }
}
