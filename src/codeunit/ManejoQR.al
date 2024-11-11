codeunit 50208 ManejoQR
{

    var
        myInt: Integer;


    procedure CreateQRFromContent(Contenido: Text; var tBloblBar: Codeunit "Temp Blob")
    var
        iBarcode: Interface "Barcode Image Provider 2D";
        instrBar: InStream;
        recBarcodeEncodeSettings2D: Record "Barcode Encode Settings 2D";
    begin
        recBarcodeEncodeSettings2D.Init();

        // https://www.qrcode.com/en/howto/code.html
        recBarcodeEncodeSettings2D."Error Correction Level" := recBarcodeEncodeSettings2D."Error Correction Level"::Low;
        recBarcodeEncodeSettings2D."Module Size" := 5;
        recBarcodeEncodeSettings2D."Quite Zone Width" := 5;

        // https://en.wikipedia.org/wiki/Code_page
        recBarcodeEncodeSettings2D."Code Page" := 28591;

        iBarcode := Enum::"Barcode Image Provider 2D"::Dynamics2D;
        tBloblBar := iBarcode.EncodeImage(Contenido, Enum::"Barcode Symbology 2D"::"QR-Code", recBarcodeEncodeSettings2D);
    end;
}