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
                field(Imagenes; Rec.Imagenes)
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
                field(Next; lbl_next)
                {
                    ApplicationArea = all;
                    DrillDown = true;
                    ShowCaption = false;

                    trigger OnDrillDown()
                    begin
                        // Message(Format(Rec.Imagenes.Count()));
                        ImportItemPictureFromURL();
                    end;
                }
            }
        }
    }

    var
        lbl_next: Label 'Siguiente';

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


}