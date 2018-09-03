var progress;
function updateProgress(val) {
    document.getElementById('assignmentProgressText').value=val;
}

function getLastProgress(){
    // progress = document.getElementById('assignmentProgress').valueOf();
    // TODO: retrieve assignment progress from DB
}

function setCurrentProgress(){
    document.getElementById('assignmentProgressText').value=progress;
}
// Set the current progress to the text display
updateProgress(document.getElementById('customRange').valueOf()); //Placeholder 50, need to dynamically update progress from DB
// setCurrentProgress();
//TODO: get last progress, then set the current progress