/// <summary>
/// Página de Ficha con campos que se colorean y una factbox
/// </summary>
page 50207 FichaBase
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = TablaBase2;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                }
                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
                field(DescriptionLong; Rec.DescriptionLong)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(imagefact; ImageFact)
            {
                ApplicationArea = all;
                SubPageLink = Number = field(Number);
            }
        }
    }

}