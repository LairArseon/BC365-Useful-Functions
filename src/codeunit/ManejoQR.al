codeunit 50208 ManejoQR
{

    var
        myInt: Integer;


    procedure CreateQRFromContent(Contenido: Text; var tBloblBar: Codeunit "Temp Blob")
    var
        iBarcode: Interface "Barcode Image Provider 2D";
        instrBar: InStream;
    begin
        iBarcode := Enum::"Barcode Image Provider 2D"::Dynamics2D;
        tBloblBar := iBarcode.EncodeImage(Contenido, Enum::"Barcode Symbology 2D"::"QR-Code");
    end;
}