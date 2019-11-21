/* Xavi Santamaria */
import controlP5.*;
import java.util.*; 

ControlP5 cp5;
String fileName;


void setup() {
  size(1024, 768, P3D);
  
  setupAudio();  
  
  setupStepButtons();
}



void mouseClicked() {  
  if (isInStepButtonRange(mouseX, mouseY)) {
    getStepButton(mouseX, mouseY).activate();
    
  }
}
