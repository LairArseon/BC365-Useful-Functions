controladdin "Demo Control-AddIn"
{

    // Tamaño Horizontal
    HorizontalShrink = true;
    HorizontalStretch = true;
    MinimumWidth = 100;
    MinimumHeight = 100;

    // Tamaño Vertical
    VerticalShrink = true;
    VerticalStretch = true;
    RequestedHeight = 100;
    RequestedWidth = 100;

    // BUG version BC22
    //     StartupScript = './src/ControlAddIns/js/libraries/jquery-3.6.3.js';

    Scripts =
            './src/controlAddIn/js/libraries/jquery-3.6.3.js',
            './src/controlAddIn/js/libraries/bootstrap.js',
            './src/controlAddIn/js/libraries/bootstrap.min.js',
            './src/controlAddIn/js/ui.js',
            './src/controlAddIn/js/funciones.js',
            './src/controlAddIn/js/startup.js';


    StyleSheets =
            './src/controlAddIn/CSS/bootstrap.css',
            './src/controlAddIn/CSS/bootstrap.min.css',
            './src/controlAddIn/CSS/Lector.css';


    #region Eventos

    event ControlAddinListo();

    event BotonPulsado(TextoBoton: Text);

    #endregion


    #region Procedures

    procedure ArrancaAddIn();

    procedure OcultarSpinner();

    procedure PintarBotonDemo(Texto: Text; color: Text);

    procedure MostrarSpinner(Tiempo: Integer);

    procedure ThrowError(ErrorText: Text; JQSelector: Text);

    #endregion
}