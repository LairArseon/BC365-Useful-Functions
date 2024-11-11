page 50240 Mod337
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Reservation Entry";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Source ID"; Rec."Source ID")
                {
                    ToolTip = 'Specifies which source ID the reservation entry is related to.';
                }
                field("Source Ref. No."; Rec."Source Ref. No.")
                {
                    ToolTip = 'Specifies a reference number for the line, which the reservation entry is related to.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies for which source type the reservation entry is related to.';
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    ToolTip = 'Specifies which source subtype the reservation entry is related to.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item that has been reserved in this entry.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies the lot number of the item that is being handled with the associated document line.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the serial number of the item that is being handled on the document line.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ToolTip = 'Specifies the package number of the item that is being handled with the associated document line.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity of the record.';
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                    ToolTip = 'Specifies the quantity of the item that has been reserved in the entry.';
                }
                field("Reservation Status"; Rec."Reservation Status")
                {
                    ToolTip = 'Specifies the status of the reservation.';
                }
                field("Source Batch Name"; Rec."Source Batch Name")
                {
                    ToolTip = 'Specifies the journal batch name if the reservation entry is related to a journal or requisition line.';
                }
                field("Source Prod. Order Line"; Rec."Source Prod. Order Line")
                {
                    ToolTip = 'Specifies the value of the Source Prod. Order Line field.';
                }
            }
        }
    }
}