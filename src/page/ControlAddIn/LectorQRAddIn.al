page 50232 "Lector QR Addin"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                ShowCaption = false;


                usercontrol(LectorQR; LectorQR)
                {
                    ApplicationArea = All;

                    trigger ControlAddinListo()
                    begin
                        CurrPage.LectorQR.ArrancaAddIn();

                    end;

                    trigger BotonPulsado(TextoBoton: Text)
                    begin

                    end;
                }
            }
        }
    }
}