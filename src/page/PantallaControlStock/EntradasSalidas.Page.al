/// <summary>
/// Page "EntradasSalidas" (ID 50137).
/// </summary>
page 50201 EntradasSalidas
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Product In-Outs', Comment = 'ESP="Entradas - Salidas Producto"';
    UsageCategory = Administration;
    SourceTable = Item;
    SourceTableTemporary = True;

    layout
    {
        area(Content)
        {
            group(Entradas)
            {

                part(LinCompra; PLines)
                {
                    ApplicationArea = All;
                    SubPageLink = "No." = field("No."), "Planned Receipt Date" = field(FechaReferenciaStock), "Variant Code" = field("CodVariante"), Type = filter(Item);

                }
                part(ProdLines; ProdLines)
                {
                    ApplicationArea = All;
                    SubPageLink = "Source No." = field("No."), "Due Date" = field(FechaReferenciaStock), "Variant Code" = field("CodVariante");

                }


            }
            group(Salidas)
            {

                part(LinVenta; SLines)
                {
                    ApplicationArea = All;
                    SubPageLink = "No." = field("No."), "Planned Shipment Date" = field(FechaReferenciaStock), "Variant Code" = field("CodVariante"), Type = filter(Item);

                }
                part(ProdOrderComp; ProdOrderComp)
                {
                    Editable = false;
                    ApplicationArea = All;
                    SubPageLink = "Item No." = field("No."), "Due Date" = field(FechaReferenciaStock), "Variant Code" = field("CodVariante");

                }
            }
        }
    }

    /// <summary>
    /// LoadItem.
    /// </summary>
    /// <param name="ItemNo">Code[20].</param>
    /// <param name="VarCode">Code[10].</param>
    /// <param name="DateInd">Date.</param>
    procedure LoadItem(ItemNo: Code[20]; VarCode: Code[10]; DateInd: Date)
    begin
        Rec.Init();
        Rec."No." := ItemNo;
        Rec.Insert();
        Rec.CodVariante := VarCode; // Por ser un campo libre de code[10]
        Rec.FechaReferenciaStock := DateInd; // Por ser un campo libre de tipo Date
        Rec.Modify();
    end;

}