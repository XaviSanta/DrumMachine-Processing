/* Xavier Santamaria */
import controlP5.*;
import java.util.*; 

ControlP5 cp5;

/*
  In this function we set the size of the program, instantiate CP5, 
  and setup some Cp5 buttons, sliders, etc; and also setups recorders needed for 
  recording input/output sounds.
*/
void setup() {
  size(1024, 768); 
  instantiateCP5();
  
  // Instantiates the minim and out Line and writes the names of the playlist
  // we have. 
  setupAudio(); // ./Audio.pde
  
  // Instantiates the In Line so we can use the microphone later. 
  setupMicrophone(); // ./AudioRecorder.pde
  
  // Setup the buttons that are in each row to record custom sounds. 
  setupRecorderButtons(); // ./Cp5Components.pde
  
  // this recorderIn (input) is not used but I had to instantiate one recorder 
  // otherwise the comprobations I do in the draw throw errors. 
  setupRecorderIn(0); // ./AudioRecorder.pde
  
  // Setup the button to record output sound --> songs
  setupRecorderOutButton(); // ./Cp5Components.pde
  
  // Setup/ creates the recorder for the output sound to create songs
  setupRecorderOut(); // ./AudioRecorder.pde
  
  // Setup the slider for the master volume CP5
  setupMasterVolumeSlider(); // ./Cp5Components.pde
  
  // Setup the DropDownPlaylist to let user choose which playlist of sounds to use
  setupDropDownPlaylist(); // ./Cp5Components.pde
  
  // Save File = save in a file the buttons the user has clicked as a configuration
  setupSaveFileButton(); // ./Cp5Components.pde
  
  // Setup the dropDown to let the user choose the configuration of buttons they want to use
  setupDropDownFileButtons(); // ./Cp5Components.pde
  
  // Setup the CP5 button to play and pause the sounds
  setupPlayPauseToggle(); // ./Cp5Components.pde
  
  // Setup the Clear Button CP5 so the user can clear all the buttons in the drum machine
  setupClearButton(); // ./Cp5Components.pde

  // Step the buttons that once clicked produce sounds
  setupStepButtons(); // ./StepButton.pde
}

void instantiateCP5() {
 cp5 = new ControlP5(this); 
}

/*
  If the mouse is in the range of the StepButtons it get the ID of the button the mouse is
  on and activates that button
*/
void mouseClicked() {  
  if (isInStepButtonRange(mouseX, mouseY)) {
    getStepButton(mouseX, mouseY).activate();
  }
}

/*
  When the mouse is moved, 
    if is in the StepButtonRange it gets the id of that button and
  stores it in the variable hoverButton that, 
    else, set the hoverButton to -1 so no StepButton is hovered
*/
void mouseMoved() {
  if (isInStepButtonRange(mouseX, mouseY)) {
     hoverButton = getStepButton(mouseX, mouseY).id;
  }
  else {
    hoverButton = -1;
  }
}
