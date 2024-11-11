controladdin TextEditor
{
    RequestedHeight = 600;
    MinimumHeight = 600;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;

    Scripts =
            './src/controlAddIn/js/libraries/jquery-3.6.3.js',
            './src/controlAddIn/js/libraries/bootstrap.js',
            './src/controlAddIn/js/libraries/jodit.min.js',
            './src/controlAddIn/js/ui.js',
            './src/controlAddIn/js/TextEditor.js';


    StyleSheets =
            './src/controlAddIn/CSS/bootstrap.min.css',
            './src/controlAddIn/CSS/jodit.min.css',
            './src/controlAddIn/CSS/style.css';

    #region Events

    event ControlAddinListo();

    event Cerrar(Confirmar: Boolean);

    event DevolverTexto(TextoContenido: Text);

    #endregion

    #region procedures

    procedure ArrancaAddIn();

    procedure CrearCuadroTexto(TextoInicial: Text);

    procedure PintarBotonesConfirmarCancelar();

    procedure RecuperarTexto();

    procedure MostrarSpinner(Segundos: Integer);

    procedure OcultarSpinner();

    #endregion
}