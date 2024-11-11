page 50233 "Test Generar Report HTML"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ConfTable;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(TextFiddle; Rec.TextFiddle)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RunReport)
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    reportHTML: Report "Report HTML";
                begin
                    reportHTML.AddContent(Rec.TextFiddle);
                    reportHTML.Run();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}