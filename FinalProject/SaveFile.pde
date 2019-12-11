/* Xavier Santamaria */


void saveButtonsToFile() {
  String listButtonsClicked = "";
  for(StepButton sb : sBList) { // Iterate the list of buttons and save the id of the ones that are clicked
   if(sb.isClicked){
     listButtonsClicked += " " + sb.id; // Save it into a String, each id separated by spaces
   }
  }
  
  String[] splitedList = split(listButtonsClicked, ' '); // split the idString into a list of ids
  saveStrings("/savedButtons/SavedButtons2.txt", splitedList); // Save into the file
  println("Configuration buttons saved in './savedButtons/SavedButtons2.txt'");
}

/*
  This function activates the buttons given a configuration chosen by the user
  First we clear, desactivate all the buttons, then we read from the file the user has chosen
  and save in a list of strings the Ids of that buttons. 
  Then we loop activating all the buttons
*/
void activateButtonsFromFile(int n) {
  Clear();
  String[] idButtons = loadStrings("/savedButtons/SavedButtons" + n + ".txt");
  for(int i = 1; i < idButtons.length; i++) {
    sBList.get(Integer.parseInt(idButtons[i])).activate();
  }
}
