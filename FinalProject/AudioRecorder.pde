/* Xavier Santamaria */

AudioRecorder recorder;
AudioRecorder recorderOut;
int counterSongs = 0;
AudioInput in;
int numCustom = 0;
float recorderTimer;
boolean microhponeWorks = false;
/*
  Instantiates the In Line so we can use the microphone later. 
  The try catch is to avoid error in execution if the computer doesn't have a
  input sound / microphone
*/
void setupMicrophone() {
  try{
    in = minim.getLineIn(); 
    microhponeWorks = true; // Set it to true so we can draw later that the user is recording
  } catch (Exception e) {
    println("ERROR setting up microphone. " + e);
  }
}

/*
  instantiate the microphone
*/
void setupRecorderIn(int n) {
  recorder = minim.createRecorder(in, "/data/Custom"+n+".wav");
}

/*
  instantiate the output recorder
*/
void setupRecorderOut() {
  recorderOut = minim.createRecorder(out, "/recordedSongs/song" + counterSongs +".wav");
}

/*
  CP5 button func, 
    if its recroding -> Stop and save the song in a new file 'song:counterSongs.wav'
    else -> setup a new recorder and start recording
*/
void RecordOutput() {
  if ( recorderOut.isRecording() ) saveRecordOut();
  else {
    setupRecorderOut();
    recorderOut.beginRecord();
    println("Recording...");
  }
}

/*
  When recording a new sound, mute the out sounds, so we can record a clean sound
  and set the Timer of the trigger to 0. This timer is used to stop automatically 
  the recorder of the sound so it doesnt gets too long because it should be short
  because its a Sample sound.
*/
void startRecording() {
  out.mute();
  recorder.beginRecord();
  recorderTimer=0; 
  println("BeginRecording");
}

/*
  Save the Sample sound. After that we can unmute the out to listen again the sounds
  And automatically set the playlist to the custom one so we can start listening to
  the new sound we have recorded.
*/
void saveRecord() {
  recorder.save();
  recorder.endRecord();
  out.unmute();
  println("Done saveing.");
  setPlaylist(2); // 2 = Custom playlist
}

/*
  Save the song we recorded to a new file. 
*/
void saveRecordOut() {
  recorderOut.save();
  recorderOut.endRecord();
  println("Done saving. New song available in './recordedSongs/song" + counterSongs + ".wav' \n");
  counterSongs++;
}

/*
  Here till the end of the file, CP5 functions for all the record buttons for each row,
  once clicked if they were already recording stop and save. If they weren't, start the 
  recording for that row.
*/
void Record1() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(1);
    startRecording();
  }
}

void Record2() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(2);
    startRecording();
  }
}

void Record3() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(3);
    startRecording();
  }
}

void Record4() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(4);
    startRecording();
  }
}

void Record5() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(5);
    startRecording();
  }
}

void Record6() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(6);
    startRecording();
  }
}

void Record7() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(7);
    startRecording();
  }
}
