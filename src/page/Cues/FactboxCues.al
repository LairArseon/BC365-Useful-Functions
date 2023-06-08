page 50228 FactBoxCues
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TablaCues;

    layout
    {
        area(Content)
        {
            cuegroup(Cues)
            {
                field(CuePagBase; Rec.CuePagBase)
                {
                    Caption = 'Base Lines >0', comment = 'ESP="Lineas Base >0"';
                    ApplicationArea = All;
                    StyleExpr = StyleLinesCue;
                }


            }

        }

    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.CuePagBase > 0 then
            StyleLinesCue := 'Favorable';
    end;

    var
        StyleLinesCue: Text;

}