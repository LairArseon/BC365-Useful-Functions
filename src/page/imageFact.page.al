/// <summary>
/// Factbox de imagenes para insertar en páginas y con funcion de subir imagen y campo solo label
/// </summary>
page 50208 ImageFact
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TablaBase2;

    layout
    {
        area(Content)
        {
            group(Foto)
            {
                field(QR; Rec.QR)
                {
                    ApplicationArea = All;

                }
                field(Imagen; Rec.Image)
                {
                    ApplicationArea = All;

                }
                field(URL; Rec.URL)
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                    MultiLine = true;

                }
            }
            group(Menu)
            {
                field(Load; lbl_Load)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    ShowCaption = false;

                    trigger OnDrillDown()
                    begin
                        ImportItemPictureFromURL();
                        CreateQRFromContent();
                    end;
                }
            }
        }
    }

    var
        lbl_Load: Label 'Cargar';

    /// <summary>
    /// ImportItemPictureFromURL.
    /// Añadir imágenes desde url
    /// </summary>
    procedure ImportItemPictureFromURL()
    var
        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;
    begin
        if not Client.Get(Rec.URL, Response) then
            Error(GetLastErrorText());
        Response.Content.ReadAs(InStr);
        if Rec.FindFirst() then begin
            Clear(Rec.Image);
            Rec.Image.ImportStream(InStr, 'Demo picture for item', 'image/png');
        end;

    end;

    procedure CreateQRFromContent()
    var
        tbloblBar: Codeunit "Temp Blob";
        iBarcode: Interface "Barcode Image Provider 2D";
        instrBar: InStream;
    begin
        iBarcode := Enum::"Barcode Image Provider 2D"::Dynamics2D;
        tbloblBar := iBarcode.EncodeImage(Rec.DescriptionLong, Enum::"Barcode Symbology 2D"::"QR-Code");
        instrBar := tbloblBar.CreateInStream();
        Rec.QR.ImportStream(instrBar, 'QR Estandar');
    end;


}