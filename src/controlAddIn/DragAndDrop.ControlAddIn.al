controladdin DragAndDrop
{

    HorizontalStretch = true;
    MinimumHeight = 200;
    RequestedHeight = 200;
    VerticalShrink = false;


    // BUG version BC22
    StartupScript = './src/controlAddIn/js/StartupDnD.js';

    Images = './src/controlAddIn/DnDIco.png';

    Scripts =
            './src/controlAddIn/js/libraries/jquery-3.6.3.js',
            './src/controlAddIn/js/libraries/bootstrap.js',
            './src/controlAddIn/js/libraries/bootstrap.min.js';
    //     './src/controlAddIn/js/DragAndDrop.js';

    StyleSheets =
            './src/controlAddIn/CSS/style.css',
            './src/controlAddIn/CSS/bootstrap.css',
            './src/controlAddIn/CSS/bootstrap.min.css';


    /// <summary>
    /// DataRead.
    /// </summary>
    /// <param name="Data">JsonObject.</param>
    event DataRead(Data: JsonObject);

}