AudioRecorder recorder;
AudioInput in;
int numCustom = 0;
float recorderTimer;

void setupMicrphone() {
  in = minim.getLineIn();  
}

void setupRecorder(){
  numCustom = numCustom % 7 + 1;
  recorder = minim.createRecorder(in,"/data/Custom"+numCustom+".wav");
}

void RecordSound() {
  if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
      recorder.save();
      println("Done saving.");
    }
    else 
    {
      setupRecorder();
      recorder.beginRecord();
      recorderTimer=0;
      println("BeginRecording.");
    }
}
