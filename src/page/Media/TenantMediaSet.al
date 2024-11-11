page 50216 TenantMediaset
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Tenant Media Set";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(MediaID; Rec."Media ID")
                {
                    ApplicationArea = All;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }
                field("Media Index"; Rec."Media Index")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}