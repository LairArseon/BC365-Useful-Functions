InitializeControl('controlAddIn');
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady', null);

function InitializeControl(controlId) {
    alert('Hi')
}

function InitializeFileDragAndDrop() {

    FactBox = $("#controlAddIn");
    // FactBox.css("background-color", "LightBlue"); 

    var imgURL = Microsoft.Dynamics.NAV.GetImageResource('DnDIco.png');
    FactBox.append("<div><img src='" + imgURL +"'/></div>");   
    
    // Prevent default drag behaviors
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
        FactBox.addEventListener(eventName, preventDefaults, false)
        document.body.addEventListener(eventName, preventDefaults, false)
    });

    FactBox.click(function(){ alert ('Hi')})
  
    // Highlight drop area when item is dragged over it
    ['dragenter', 'dragover'].forEach(eventName => {
        FactBox.addEventListener(eventName, highlight, false)
    });
  
    //Unhiglight
    ['dragleave', 'drop'].forEach(eventName => {
        FactBox.addEventListener(eventName, unhighlight, false)
    });
    
    // Handle dropped files
    FactBox.addEventListener('drop', handleDrop, false)

}

function preventDefaults (e) {
    e.preventDefault()
    e.stopPropagation()
}

function highlight(e) {
    FactBox.style.border = "thick dotted blue";
}

function unhighlight(e) {
    FactBox.style.border = "";
}

function handleDrop(e) {
    var dt = e.dataTransfer
    var files = dt.files

    handleFiles(files)
}

var filesCount = 0;

function handleFiles(files) {
    files = [...files]
    filesCount = files.length
    files.forEach(uploadFile)
}

function uploadFile(file, i) {
    var reader = new FileReader();
    reader.addEventListener("loadend", function() {
        // reader.result contains the contents of blob
        var base64data = reader.result;
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnFileUpload',[file.name,base64data,filesCount == (i + 1)]);
     });
     reader.readAsDataURL(file);
}