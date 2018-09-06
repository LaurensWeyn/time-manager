var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];

function updateProgress(val) {
    document.getElementById('assignmentProgressText').value=val+"%";
    document.getElementById('formProgress').value=val;
}

function setCurrentProgress(){
    document.getElementById('assignmentProgressText').value=progress;
}

function getDate(){
    var monthsSinceYearStart;
    var date = document.getElementById('dateInput').valueOf();
    var dateParts = date.split(" ");
    // DAY, Month, Year, - , Hours:Minutes
    var dueDay = dateParts[0];
    var dueMonth = dateParts[1];
    var dueYear = dateParts[2];
    var dueTime = dateParts[4];
    dueTime = dueTime.split(":");

    monthsSinceYearStart = months.indexOf(dueMonth);
    var dueHours = dueTime[0];
    var dueMinutes = dueTime[1];
    // 1 minute	60 seconds
    // 1 hour	3600 seconds
    // 1 day	86400 seconds
    // 1 month (30.44 days)	2629743 seconds
    // 1 year (365.24 days)	31556926 seconds
    document.getElementById("dueTime").value = monthsSinceYearStart*2629743 + dueHours*3600+dueMinutes*60 + (dueYear - 1970)*31556926 +dueDay*86400 ;
}
// TODO: inverse conversion of the date to autofill date field

function setDateString(epochTime){
    var d = new Date(0); // The 0 there is the key, which sets the date to the epoch
    d.setUTCSeconds(epochTime);
    return d.toDateString();
}