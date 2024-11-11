controladdin LectorQR
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 300;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =
            './src/controlAddIn/js/libraries/jquery-3.6.3.js',
            './src/controlAddIn/js/libraries/bootstrap.js',
            './src/controlAddIn/js/libraries/qr-scanner-worker.min.js',
            './src/controlAddIn/js/libraries/qr-scanner.min.js',
            './src/controlAddIn/js/libraries/bootstrap.min.js',
            './src/controlAddIn/js/LectorQR.js';


    StyleSheets =
            './src/controlAddIn/CSS/style.css',
            './src/controlAddIn/CSS/bootstrap.css',
            './src/controlAddIn/CSS/bootstrap.min.css';


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