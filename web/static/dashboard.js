function onEventComplete(id) {
    var element = document.getElementById(id);
    element.parentNode.removeChild(element);
    return false;
}

function updateDashboard(){
    window.history.pushState("object or string", "Title", "/new-url");
}