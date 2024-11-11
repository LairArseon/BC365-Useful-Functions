page 50237 RealMovs
{
    Caption = 'Real movs reg', comment = 'ESP="Movimientos registrados real"';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mov Registro Seguimiento";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(DocumentNo; Rec.DocumentNo)
                {
                    ToolTip = 'Specifies the value of the DocumentNo field.';
                }
                field(MyField; Rec.MyField)
                {
                    ToolTip = 'Specifies the value of the MyField field.';
                }
            }
        }
    }

}