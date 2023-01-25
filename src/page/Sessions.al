page 50213 Sesions
{
    PageType = List;
    Caption = 'Session List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Session";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Application Name"; Rec."Application Name")
                {
                    ApplicationArea = All;

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;

                }
                field("Connection ID"; Rec."Connection ID")
                {
                    ApplicationArea = All;

                }
                field("My Session"; Rec."My Session")
                {
                    ApplicationArea = All;

                }
                field("Host Name"; Rec."Host Name")
                {
                    ApplicationArea = All;

                }
                field("Login Type"; Rec."Login Type")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}