/* Xavier Santamaria */
import controlP5.*;
import java.util.*; 

ControlP5 cp5;
String fileName;

void setup() {
  size(1024, 768);
  cp5 = new ControlP5(this);
  
  setupAudio();  
  setupMicrphone();
  
  setupRecorderButtons();
  // this recorderIn (input) is not used but i had to instantiate one recorder 
  // otherwise the comprobations i do in the draw throw errors
  setupRecorderIn(0); 
  
  setupRecorderOutButton(); // Save the song
  setupRecorderOut();
  
  setupMasterVolumeSlider();
  setupDropDownPlaylist();
  
  setupSaveFileButton(); // Save File = save in a file the buttons the user has clicked as a configuration
  setupDropDownFileButtons();
  
  setupPlayPauseToggle();
  setupClearButton();

  setupStepButtons(); // Step button are the buttons that once clicked produce sounds
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
