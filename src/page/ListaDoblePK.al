/// <summary>
/// Página usada para probar el metodo Find('=') para buscar registros específicos en una tabla con una PK de dos campos
/// </summary>
page 50211 ListaDoblePK
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TablaDoblePK;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(Maincode; Rec.Maincode)
                {
                    ApplicationArea = All;

                }
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TestFiltroContenido)
            {
                ApplicationArea = All;

                // Comprobar si registro está dentro de un record filtrado

                trigger OnAction();
                var
                    mcode: Code[20];
                    line: Integer;
                    recTabla: Record TablaDoblePK;
                begin
                    line := 1;
                    mcode := 'CODE1';

                    rec.Maincode := mcode;
                    rec.LineNo := line;

                    // rec.SetRange(Maincode, 'CODE2');
                    if rec.Find('=') then
                        Message('Found')
                    else
                        Message('Not Found');

                end;
            }
        }
    }
}