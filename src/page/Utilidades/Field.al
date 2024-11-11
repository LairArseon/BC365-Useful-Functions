page 50231 Fields
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Field;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the ID number of the field in the table.';
                }
                field(FieldName; Rec.FieldName)
                {
                    ToolTip = 'Specifies the name of the field in the table.';
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ToolTip = 'Specifies the caption of the field, that is, the name that will be shown in the user interface.';
                }
                field(Class; Rec.Class)
                {
                    ToolTip = 'Specifies the type of class. Normal is data entry, FlowFields calculate and display results immediately, and FlowFilters display results based on user-defined filter values that affect the calculation of a FlowField.';
                }
                field(IsPartOfPrimaryKey; Rec.IsPartOfPrimaryKey)
                {
                    ToolTip = 'Specifies the value of the IsPartOfPrimaryKey field.';
                }
                field(TableNo; Rec.TableNo)
                {
                    ToolTip = 'Specifies the table number.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the type of the field in the table, which indicates the type of data it contains.';

                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                    begin

                    end;
                }
            }
        }
    }

    [TryFunction]
    procedure EscribirDato()
    var
        RecCustomer: Record Customer temporary;
    begin
        RecCustomer.init;
        RecCustomer.Insert();
    end;

    procedure ValidarDato()
    var
        RecCustomer: Record Customer temporary;
    begin
        if EscribirDato() then begin

            RecCustomer.init;
            RecCustomer.Insert();

        end
    end;


}