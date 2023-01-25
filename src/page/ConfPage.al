/// <summary>
/// Page ConfPage (ID 50209).
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

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
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