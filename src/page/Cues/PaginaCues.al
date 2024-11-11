page 50227 PaginaCues
{
    Caption = 'Base Card', comment = 'ESP="Ficha Base"';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TablaCues;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(Cues)
            {
                CuegroupLayout = Wide;

                field(CuePagBase; Rec.CuePagBase)
                {
                    Caption = 'Base Lines >0', comment = 'ESP="Lineas Base >0"';
                    ApplicationArea = All;
                    StyleExpr = StyleLinesCue;

                }

                field(CueAction; lbl_CueAction)
                {
                    ShowCaption = false;
                    Caption = 'Action From a Page Cue', comment = 'ESP="Acción desde una Pila en página"';
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        Message('Funciona');
                    end;
                }

                actions
                {
                    // Las actions dentro de los cuegroups solo son visibles desde el RoleCenter
                }
            }
        }

        area(FactBoxes)
        {
            part(CuesPart; FactBoxCues)
            {
                ApplicationArea = All;
                SubPageLink = ClearKey = field(ClearKey);
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(CalcularRestoEnActions)
            {
                ApplicationArea = All;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Caption = 'Calculate Remainder', comment = 'ESP="Calcular Resto"';

                // Función para probar como funciona el cálculo de la codeunit Math de IEEERemainder
                // Devuelve el resto de la división, pero en caso de que el resto sea mayor que la mitad
                // del divisor, devuelve la diferencia como valor negativo, por ejemplo:
                // 10/5 -> 0
                // 11/5 -> 1
                // 12/5 -> 2
                // 13/5 -> -2
                // 14/5 -> -1
                // 15/5 -> 0
                trigger OnAction()
                var
                    math: Codeunit Math;
                    pagValue: Page "Solicitar Valor";
                    valor: Text;
                    dividendo: Decimal;
                    divisor: Decimal;
                begin

                    pagValue.SetCaptions('Dividendo', 'Dividendo');
                    pagValue.SetFieldType(FieldType::Decimal);
                    if pagValue.RunModal() = Action::OK then begin
                        pagValue.GetValue(valor);
                        Evaluate(dividendo, valor)
                    end;


                    Clear(pagValue);
                    Clear(valor);
                    pagValue.SetCaptions('Divisor', 'Divisor');
                    pagValue.SetFieldType(FieldType::Decimal);
                    if pagValue.RunModal() = Action::OK then begin
                        pagValue.GetValue(valor);
                        Evaluate(divisor, valor)
                    end;

                    Message(Format(Math.IEEERemainder(dividendo, divisor)));
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin

        // Las páginas que tiran de una tabla cuya clave primaria es un code vacío deben inicializarse en caso de que no se haya hecho antes
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.CuePagBase > 0 then
            StyleLinesCue := 'Favorable';
    end;

    var
        StyleLinesCue: Text;
        lbl_CueAction: Label 'TestCueAction';
}