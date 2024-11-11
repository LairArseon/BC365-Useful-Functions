pageextension 50201 "Order Processor Extension" extends "Order Processor Role Center"
{
    layout
    {
        addafter(Control4)
        {
            part(ControlAddInDemo; "Subpage ControlAddIn")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(TextEditor)
            {
                ApplicationArea = All;
                Caption = 'Text Editor', comment = 'ESP="Editor de Texto"';
                Image = Edit;
                RunObject = Page TextEditor;
            }
        }
    }
}