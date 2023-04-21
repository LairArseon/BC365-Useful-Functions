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
}