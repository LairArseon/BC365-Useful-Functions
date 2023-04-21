page 50224 "Subpage ControlAddIn"
{
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            usercontrol(DemoAddIn; "Demo Control-AddIn")
            {
                ApplicationArea = All;

                trigger ControlAddinListo()
                begin
                    CurrPage.DemoAddIn.ArrancaAddIn();

                    CurrPage.DemoAddIn.PintarBotonDemo('BotonDemo', 'primary');
                end;

                trigger BotonPulsado(TextoBoton: Text)
                begin

                    // Message('Pulsado');

                    if TextoBoton = 'BotonDemo' then
                        CurrPage.DemoAddIn.MostrarSpinner(5);

                end;
            }
        }
    }
}