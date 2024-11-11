page 50236 PreviewMovs
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mov Registro Seguimiento";
    SourceTableTemporary = true;

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