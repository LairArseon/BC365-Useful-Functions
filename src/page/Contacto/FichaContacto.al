page 50222 FichaContacto
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TablaQR;

    layout
    {
        area(Content)
        {
            group(Personal)
            {
                field(Titulo; Rec.Titulo)
                {
                    ApplicationArea = All;
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field(PrimerApellido; Rec.Apellido1)
                {
                    ApplicationArea = All;
                }
                field(SegundoApellido; Rec.Apellido2)
                {
                    ApplicationArea = All;
                }
                field(Tlfn; Rec.Tlfn)
                {
                    ApplicationArea = All;
                }
                field(Movil; Rec.TlfnMov)
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field(FechaNacimiento; Rec.FechaNaci)
                {
                    ApplicationArea = All;
                }
                field(Direccion; Rec.Direccion)
                {
                    ApplicationArea = All;
                }
                field(Direccion2; Rec.Direccion2)
                {
                    ApplicationArea = All;
                }
                field(Web; Rec.Web)
                {
                    ApplicationArea = All;
                }
            }
            group(Trabajo)
            {
                field(Org; Rec.Org)
                {
                    ApplicationArea = All;
                }
                field(Profesion; Rec.Profesion)
                {
                    ApplicationArea = All;
                }
                field(TlfnTra; Rec.TlfnTra)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
            part(DatosContacto; FactContacto)
            {
                ApplicationArea = all;
                SubPageLink = AutoKey = field(AutoKey);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(QR)
            {
                ApplicationArea = All;
                Image = CustomerContact;

                trigger OnAction();
                var
                    QRMng: Codeunit ManejoQR;
                    Contenido: Text;

                    tblobContacto: Codeunit "Temp Blob";
                    instrContacto: InStream;

                    tblobWeb: Codeunit "Temp Blob";
                    instrWeb: InStream;
                begin
                    Contenido := Rec.CrearContenidoVCard();

                    // Qr Contacto
                    QRMng.CreateQRFromContent(Contenido, tblobContacto);
                    instrContacto := tblobContacto.CreateInStream();
                    Rec.QRContacto.ImportStream(instrContacto, 'QR vCard');

                    // QR Web
                    QRMng.CreateQRFromContent(Rec.Web, tblobWeb);
                    instrWeb := tblobWeb.CreateInStream();
                    Rec.QRWeb.ImportStream(instrWeb, 'QR Web');
                end;
            }
        }
    }



}