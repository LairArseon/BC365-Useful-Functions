/// <summary>
/// Página lista ejemplo con varias funciones
/// </summary>
page 50206 PaginaBase
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TablaBase2;
    Editable = true;
    CardPageId = FichaBase;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
                field(DescriptionLong; Rec.DescriptionLong)
                {
                    ApplicationArea = All;
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(FactBoxes)
        {
            part(imagefact; ImageFact)
            {
                ApplicationArea = all;
                SubPageLink = Number = field(Number);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()
                var
                    tBase: Record TablaBase2;
                    tBlob: Codeunit "Temp Blob";
                    inst: InStream;
                    filename: Text;
                begin
                    CurrPage.SetSelectionFilter(tBase);
                    if tBase.FindFirst() then begin

                        filename := 'Imagen';

                        // tBlob.CreateInStream(inst);

                        UploadIntoStream(
                            '',
                            '',
                            '',
                            filename,
                            inst
                        );

                        tBase.Imagenes.ImportStream(inst, filename);
                        tBase.Modify();
                    end;
                end;
            }
            action(TableInfo_BI_LDR)
            {
                // Informacion Tabla // TableInfo // Table Information
                ApplicationArea = All;
                Caption = 'Inspect Table', Comment = 'ESP="Inspeccionar Tabla"';
                Promoted = true;
                Image = CreateLinesFromJob;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Displays the Table information pertaining the current company.', Comment = 'ESP="Muestra la información de la tabla perteneciente a la compañía actual."';

                trigger OnAction()
                var
                    Pageid: Integer;
                begin
                    Pageid := 18; // El valor del número identificador de la tabla
                    Hyperlink(GetUrl(ClientType::Current, CompanyName, ObjectType::Table, Pageid));
                end;
            }
            action(ImportarURL)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ImportItemPictureFromURL();
                end;
            }
            action(RunModalBucle)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ProcRunModalBucle();
                end;
            }

            action(InfoEntorno)
            {
                ApplicationArea = All;
                Image = Info;

                trigger OnAction()
                var
                    EnvInfo: Codeunit InformacionEntorno;
                begin
                    EnvInfo.EvaluaEntorno();
                end;
            }
        }

    }


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

    /// <summary>
    /// ProcRunModalBucle.
    /// Abre ventanas en modal dentro de un bucle
    /// </summary>
    local procedure ProcRunModalBucle()
    var
        recTabBase: Record TablaBase2;
        recTabBaseTemp: Record TablaBase2 temporary;
        confDialog: Dialog;
        fichaB: Page FichaBase;
        dialogBase: Page DialogBase;
        actionvar: Action;
    begin
        if recTabBase.FindSet() then
            repeat
                // confDialog.Open('Documento Propuesto', Rec.Description);
                recTabBaseTemp := recTabBase;
                recTabBaseTemp.Insert();

                Clear(fichaB);
                Clear(dialogBase);

                dialogBase.SetVar(recTabBaseTemp.Description);
                actionvar := dialogBase.RunModal();

                if actionvar = Action::OK then begin
                    recTabBaseTemp.Description := dialogBase.GetVar();
                    recTabBaseTemp.Modify();
                    Commit();
                end;


            // fichaB.SetRecord(recTabBase);
            // fichaB.RunModal();

            until recTabBase.Next() = 0;
    end;

}