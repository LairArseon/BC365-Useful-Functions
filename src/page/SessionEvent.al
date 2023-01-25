page 50214 SessionEvent
{
    Caption = 'Session Events';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Session Event";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Client Computer Name"; Rec."Client Computer Name")
                {
                    ApplicationArea = All;

                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;

                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;

                }
                field("Database Name"; Rec."Database Name")
                {
                    ApplicationArea = All;

                }
                field("Event Datetime"; Rec."Event Datetime")
                {
                    ApplicationArea = All;

                }
                field("Event Type"; Rec."Event Type")
                {
                    ApplicationArea = All;

                }
                field("Session ID"; Rec."Session ID")
                {
                    ApplicationArea = All;

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}