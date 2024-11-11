codeunit 50203 MyCodeunit
{

    // Codeunit Single instance, que incrementa el entero cada vez que se invoca
    SingleInstance = true;

    trigger OnRun()
    begin
        myInt += 1;
        Message(format(myInt));
        if dividir(0) then
            Message(GetLastErrorText());
    end;

    // Ejemplo funcion TryFunction para capturar errores
    // NOTA no se puede insertar en tablas REALES, pero si TEMPORALES
    [TryFunction]
    procedure dividir(entero: Integer)
    begin

        myInt := myInt / entero;

    end;

    var
        myInt: Integer;


    procedure actualizarFoto(recItem: Record Item)
    var
        path: text;
        instrs: InStream;
    begin
        if CargarImagen(recItem, path) then begin
            // recItem.Picture.ImportFile(path + recItem."No.");
        end;

    end;

    [TryFunction]
    procedure CargarImagen(recItem: Record Item; path: text)
    var
        fileMng: Codeunit "File Management";
        temprecItem: Record Item temporary;
    begin
        temprecItem := recItem;

        // temprecItem.Picture.ImportFile(path + recItem."No.");
    end;
}