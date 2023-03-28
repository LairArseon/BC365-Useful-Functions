page 50223 FactContacto
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TablaQR;

    layout
    {
        area(Content)
        {
            group(Contacto)
            {
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                }
                field(QRContacto; Rec.QRContacto)
                {
                    ApplicationArea = All;
                }
            }
            group(Web)
            {
                field(QRWeb; Rec.QRWeb)
                {
                    ApplicationArea = All;
                }
                field(SitioWeb; Rec.Web)
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(UploadPFP)
            {
                ApplicationArea = All;
                Image = UserSetup;

                trigger OnAction()
                var
                    DialogTitle: Label 'Importar imagen';
                    VarFilter: Text;
                    PFPInStr: InStream;
                begin
                    VarFilter := 'PFP';
                    UploadIntoStream(DialogTitle, '', '', VarFilter, PFPInStr);
                    Rec.Picture.ImportStream(PFPInStr, 'Foto perfil');
                    Rec.Modify();
                end;
            }

        }
    }
}