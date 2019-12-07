/* Xavier Santamaria */

void saveButtonsToFile() {
  String listButtonsClicked = "";
  for(StepButton sb : sBList) {
   if(sb.isClicked){
     listButtonsClicked += " " + sb.id;
   }
  }
  
  String[] splitedList = split(listButtonsClicked, ' ');
  saveStrings("/savedButtons/SavedButtons2.txt", splitedList);
  println("Configuration buttons saved in './savedButtons/SavedButtons2.txt'");
}

void activateButtonsFromFile(int n) {
  Clear();
  String[] idButtons = loadStrings("/savedButtons/SavedButtons" + n + ".txt");
  for(int i = 1; i < idButtons.length; i++) {
    sBList.get(Integer.parseInt(idButtons[i])).activate();
  }
}

void DDButtonsFile(int n) { // Drop Down Buttons
  activateButtonsFromFile(n);
}
