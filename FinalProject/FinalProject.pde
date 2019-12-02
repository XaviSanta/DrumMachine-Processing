/* Xavi Santamaria */
import controlP5.*;
import java.util.*; 

ControlP5 cp5;
String fileName;
DropdownList dropDownList;

void setup() {
  size(1024, 768);
  cp5 = new ControlP5(this);

  setupAudio();  

  setupMicrphone();
  
  setupRecorderButtons();
  setupRecorderIn(0);
  
  setupRecorderOutButton();
  setupRecorderOut();
  
  setupSliders();
  setupDropDown();

  setupPlayPauseToggle();
  setupClearButton();

  setupStepButtons();
}



void mouseClicked() {  
  if (isInStepButtonRange(mouseX, mouseY)) {
    getStepButton(mouseX, mouseY).activate();
  }
}

void mouseMoved() {
  if (isInStepButtonRange(mouseX, mouseY)) {
     hoverButton = getStepButton(mouseX, mouseY).id;
  }
  else {
    hoverButton = -1;
  }
}

void setupRecorderButtons() {

  for (int i = 0; i < 7; i++) {
    String volRow = "Record" + Integer.toString(1+i);
    cp5.addButton(volRow)
      .setPosition(30, size*i + height*.5)
      .setSize(size*2, size)
      .setColorBackground(buttonStepColorOff)
      .setColorForeground(secondaryColor)
      .setColorActive(buttonStepColorOn);
  }
}

void setupRecorderOutButton() {
  cp5.addToggle("RecordOutput")
      .setPosition(width*.9, height*.4)
      .setSize(size + size/2, size)
      .setColorBackground(buttonStepColorOff)
      .setColorForeground(secondaryColor)
      .setColorActive(buttonStepColorOn);
}

void setupSliders() {
  cp5.addSlider("MasterVolume")
    .setPosition(30, 50)
    .setSize(100, 20)
    .setRange(-24, 24)
    .setValue(0)
    .setColorBackground(buttonStepColorOff)
    .setColorForeground(buttonStepColorOn);


  for (int i = 0; i < 7; i++) {
    String volRow = "Volume" + Integer.toString(1+i);
    cp5.addSlider(volRow)
      .setPosition(width*.15+size*16 + 5, size*i + height*.5 + size/2.5)
      .setSize(80, 10)
      .setRange(-24, 24)
      .setValue(0)
      .setColorBackground(buttonStepColorOff)
      .setColorForeground(buttonStepColorOn);
  }
}

void setupDropDown() {
  dropDownList = cp5.addDropdownList("Playlist")
    .setPosition(30, 80)
    .setBackgroundColor(buttonStepColorOn)
    .setItemHeight(20)
    .setBarHeight(20)
    .setValue(1)
    .setOpen(false)
    .setColorBackground(buttonStepColorOff)
    .setColorActive(tableColor)
    .setColorForeground(buttonStepColorOn);

  for (int i = 0; i < playlistName.length; i++) {
    dropDownList.addItem(playlistName[i], i);
  }
}



void setupPlayPauseToggle() {
  cp5.addToggle("PlayPause")
    .setPosition(width*.9, 50)
    .setSize(35, 35)
    .setValue(false)
    .setColorBackground(buttonStepColorOff)
    .setColorForeground(secondaryColor)
    .setColorActive(buttonStepColorOn);
}

void PlayPause(boolean theFlag) {
  playToggle = theFlag;
  time = millis(); //To start from the initial column
}


void setupClearButton() {
  cp5.addButton("Clear")
    .setPosition(width*.85, 50)
    .setSize(35, 35)
    .setColorBackground(buttonStepColorOff)
    .setColorForeground(secondaryColor)
    .setColorActive(buttonStepColorOn);
}

void Clear() {
  for (int i = 0; i < sBList.size(); i++) {
    sBList.get(i).isClicked = false;
  }
}
