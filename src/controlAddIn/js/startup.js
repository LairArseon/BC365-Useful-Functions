Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddinListo', '');


function ArrancaAddIn() 
{ 
    GlobalUI = InitialiseUI(); 
}

function MostrarSpinner(tiempo)
{
    GlobalUI.ShowSpinner(tiempo);
}

function OcultarSpinner()
{
    GlobalUI.HideSpinner();
}

function ThrowError(ErrorText, FieldName)
{
    GlobalUI.HideSpinner();

    alert(ErrorText);
    $(FieldName).val('');
    $(FieldName).css("borderColor", "red");
    $(FieldName).css("background-color", "lightcoral");
    $(FieldName).focus();
}

function PintarBotonDemo(Text, Color)
{
    let Boton = new Button(Text, Color)
    GlobalUI.ContenedorAddIn.append(Boton.UIElement);

}