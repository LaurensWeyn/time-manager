function onEventComplete(id, events) {
    var element = document.getElementById(id);
    element.parentNode.parentNode.parentNode.parentNode.removeChild(element.parentNode.parentNode.parentNode);
    // If events is empty, remove the date header
    if (events.valueOf() == true){
        element.parentNode.parentNode.parentNode.parentNode.removeChild(element.parentNode.parentNode.parentNode);
    }
    return false;
}

function updateDashboard(){
    window.history.pushState("object or string", "Title", "/new-url");
}