Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddinListo', '');

function ArrancaAddIn() {
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

    if (ErrorText != '')
        alert(ErrorText);

    if (FieldName != '') {
        $(FieldName).val('');
        $(FieldName).css("borderColor", "red");
        $(FieldName).css("background-color", "lightcoral");
        $(FieldName).focus();
    }
}

function CrearCuadroTexto(ContenidoInicial)
{
    try {
        let currentRow = GlobalUI.AppendRow();
        let currentCol = currentRow.appendCol(0);

        let textArea = $(`<textarea id="editor" name="editor"></textarea>`)
        currentCol.UIElement.append(textArea);

        $('#editor').each(function () {
            const editor = Jodit.make(this);
            editor.value = `<p>${ContenidoInicial}</p>`;
        });

    } catch (error) {
        console.error(error)
    }
}

function PintarBotonesConfirmarCancelar()
{
    let currentRow = GlobalUI.AppendRow();

    // Botones Completar/Cancelar
    let grupoBotones = $(`<div class="btn-group my-2" role="group"></div>`);
    let BotonConfirmar = $(`<button type="button" class="btn btn-outline-success">Confirmar</button>`);
    let BotonCancelar = $(`<button type="button" class="btn btn-outline-danger">Cancelar</button>`);
    currentRow.UIElement.append(grupoBotones);
    grupoBotones.append(BotonConfirmar);
    grupoBotones.append(BotonCancelar);

    BotonConfirmar.click(function () {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Cerrar', [true]);
    })
    BotonCancelar.click(function () {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Cerrar', [false]);
    })
}

function RecuperarTexto()
{
    console.log('Intento recuperar valor ' +  editor.value)
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('DevolverTexto', [editor.value]);
}