pageextension 50203 ItemExtension extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst(processing)
        {
            action(SearchRecord)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    recItem: Record Item;
                begin
                    recItem.SetFilter("No.", 'A*');
                    if recItem.FindFirst() then
                        Rec.Get(recItem.RecordId);
                end;
            }
        }
    }

}