/// <summary>
/// Inicializar tabla de configuración al abrir la página si no hay registro para no tener que crearlo a mano
/// </summary>
page 50209 ConfPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ConfTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Up; Rec.Up)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

    end;
}