pageextension 50202 CustomerCard extends "Customer Card"
{
    layout
    {
        addafter(Control149)
        {
            part(DragAndDrop; "Drag And Drop")
            {
                ApplicationArea = All;

            }
        }
    }

    trigger OnOpenPage()
    begin
        CurrPage.DragAndDrop.Page.SetRecRef(18, 140);
    end;

}