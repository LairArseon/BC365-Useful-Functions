page 50229 TestChart
{
    Caption = 'Test Chart', comment = 'ESP="Prueba Gráfico"';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Business Chart Buffer";

    layout
    {
        area(Content)
        {
            group(group1)
            {
                ShowCaption = false;

                usercontrol(BusinessChart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
                {
                    ApplicationArea = All;

                    trigger AddInReady()
                    var
                        buffer: Record "Business Chart Buffer";
                        recCustomer: Record Customer;
                        ColumnIter: Integer;
                    begin
                        Rec.Initialize();
                        // Index 0
                        Rec.AddMeasure('Sales', 1, Rec."Data Type"::Decimal, Enum::"Business Chart Type"::Column.AsInteger());
                        // Index 1
                        Rec.AddMeasure('Profit', 1, Rec."Data Type"::Decimal, Enum::"Business Chart Type"::Line.AsInteger());
                        Rec.SetXAxis('Customer', Rec."Data Type"::String);

                        recCustomer.SetFilter("No.", '?????');
                        if recCustomer.FindSet(false) then
                            repeat
                                recCustomer.CalcFields("Sales (LCY)", "Profit (LCY)");

                                if recCustomer."Sales (LCY)" <> 0 then begin

                                    Rec.AddColumn(recCustomer.Name);

                                    // El 0 hace referencia a la PRIMERA medida que se añade (Por algun motivo el array que contiene las referencias a las medidas empieza contando en 0)
                                    // El iterador de las columnas también empieza a contar en 0, y lo incrementamos manualmente uno a uno a medida que añadimos los valores al grafico
                                    Rec.SetValueByIndex(0, ColumnIter, recCustomer."Sales (LCY)");
                                    Rec.SetValueByIndex(1, ColumnIter, recCustomer."Profit (LCY)");

                                    ColumnIter += 1;

                                end;

                            until recCustomer.Next() = 0;

                        Rec.Update(CurrPage.BusinessChart);
                    end;

                    trigger DataPointClicked(point: JsonObject)
                    var
                        JsonText: Text;
                    begin
                        point.WriteTo(JsonText);
                        Message(JsonText);

                    end;

                    trigger Refresh()

                    var
                        myInt: Integer;
                    begin

                    end;
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}