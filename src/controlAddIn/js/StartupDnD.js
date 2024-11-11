var navControlContainer;
var navControl;

$(document).ready(function () {
    CreateControl();
});

function CreateControl() {
    navControlContainer = $("#controlAddIn");
    navControlContainer.append('<div class="wrapper"><div id="drop-files" ondragover="return false"><p>Arrastre aquí sus ficheros</p></div></div></div>');
    navControl = $("#drop-files");

    jQuery.event.props.push('dataTransfer');

    navControl.bind('drop', function (e) {
        var files = e.dataTransfer.files;
        $.each(files, function (index, file) {
            var filename = file.name;
            
            if (file.size < 10485760) {
                var fileReader = new FileReader();
                fileReader.onload = (function (file) {
                    var contentType = fileReader.result.split(',')[0].replace("data:","").replace(";base64","");
                    var base64Content = fileReader.result.split(',')[1];
                    var droppedFile = { Filename: filename, FileExtension: '.' + filename.split('.').pop(), ContentType: contentType, Data: base64Content };
                    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("DataRead", [droppedFile]);
                });

                fileReader.readAsDataURL(file);
            } else {
                var droppedFile = { Filename: filename, FileExtension: '.' + filename.split('.').pop(), Data: '' };
                //console.log(droppedFile);
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("DataRead", [droppedFile]);
            }
        });
    });

    navControl.bind('dragenter', function (e) {
        e.dataTransfer.dragEffect = "copy";
        $(this).css({ 'border': '2px dashed grey' });
        return false;
    });
    navControl.bind('drop', function () {
        $(this).css({ 'border': '4px dashed grey' });
        return false;
    });
    navControl.bind('dragleave', function () {
        $(this).css({ 'border': '4px dashed grey' });
        return false;
    });
};