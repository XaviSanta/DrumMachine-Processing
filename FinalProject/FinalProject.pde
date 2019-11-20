/* Xavi Santamaria */
import ddf.minim.*;
import controlP5.*;
import java.util.*; 

Minim minim;
ControlP5 cp5;

ArrayList<StepButton> sBList = new ArrayList<StepButton>();

void setup() {
  size(1024, 768, P3D);

  createButtons();
}

void createButtons() {
  int counter = 0;
  for (int i = 0; i < 4*4; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sB = new StepButton(i, j, counter);
      sBList.add(sB);
      counter++;
    }
  }
}
