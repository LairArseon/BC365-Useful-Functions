/// <summary>
/// Información de las sesiones activas en el entorno
/// </summary>
page 50212 ConcSesions
{
    PageType = List;
    Caption = 'Concurrent Session List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Active Session";

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
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;

                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;

                }
                field("Server Computer Name"; Rec."Server Computer Name")
                {
                    ApplicationArea = All;

                }
                field("Session ID"; Rec."Session ID")
                {
                    ApplicationArea = All;

                }
                field("Server Instance Name"; Rec."Server Instance Name")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}