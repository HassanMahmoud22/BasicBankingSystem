function showForm(i) {
    var form = document.getElementById('formElement'.concat(i));
    var displaySetting = form.style.display;
    var transferButton = document.getElementById('transfer'.concat(i));
    if (displaySetting == 'block') {
        form.style.display = 'none';
        transferButton.innerHTML = 'Transfer';
    }
    else {
        form.style.display = 'block';
        transferButton.innerHTML = 'Back';
        var coll = document.getElementsByClassName("collapsible");
        var content = coll[i].nextElementSibling;
        content.style.maxHeight = content.scrollHeight + "px";
    }
}

function collabse(){
    var coll = document.getElementsByClassName("collapsible");
    var i;

    for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.maxHeight){
                content.style.maxHeight = null;
            } else {
                content.style.maxHeight = content.scrollHeight + "px";
            }
        });
    }
}
