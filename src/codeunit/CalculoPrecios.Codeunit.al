codeunit 50220 CalculoPrecios
{

    /// <summary>
    /// Calcula precio unitario de un producto a una fecha especifica
    /// </summary>
    /// <param name="ItemNo">Nº del producto</param>
    /// <param name="CurrentDate">Fecha del periodo actual</param>
    /// <param name="CurrGroupId">Grupo de origen de datos</param>   
    /// <param name="CurrContactNo">Nº contacto de origen de datos</param>    
    /// <param name="CurrMinQty">Cantidad minima de origen de datos</param>    
    /// <returns>Precio unitario</returns>
    procedure GetPeriodItemPrice(ItemNo: Code[20]; CurrentDate: Date; CurrGroupId: Integer; CurrContactNo: Code[20]; CurrMinQty: Decimal): Decimal
    var
        IfPriceCalculation: Interface "Price Calculation";
        PriceCalculationHandler: Enum "Price Calculation Handler";
        TempPriceListLine: Record "Price List Line" temporary;
        TempPriceCalculationBuffer: Record "Price Calculation Buffer" temporary;
        PriceCalculation: Codeunit "Price Calculation - V16";
        PriceSourceList: Codeunit "Price Source List";
        AssetType: Enum "Price Asset Type";
        AmountType: Enum "Price Amount Type";
        PriceType: Enum "Price Type";
        PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.";
        bestPrice, bestDiscount : Decimal;
    begin
        IfPriceCalculation := PriceCalculationHandler::"Business Central (Version 16.0)";

        PriceSourceList := InitPriceSourceList(CurrContactNo, CurrGroupId);

        TempPriceCalculationBuffer."Asset Type" := AssetType::Item;
        TempPriceCalculationBuffer."Asset No." := ItemNo;
        TempPriceCalculationBuffer."Price Type" := PriceType::Sale;
        TempPriceCalculationBuffer."Document Date" := CurrentDate;
        TempPriceCalculationBuffer."Allow Line Disc." := true;
        TempPriceCalculationBuffer.Quantity := CurrMinQty;
        TempPriceCalculationBuffer."Qty. per Unit of Measure" := 1;

        PriceCalculationBufferMgt.Set(TempPriceCalculationBuffer, PriceSourceList);

        if PriceCalculation.FindLines(AmountType::Price, TempPriceListLine, PriceCalculationBufferMgt, false) then
            PriceCalculation.CalcBestAmount(AmountType::Price, PriceCalculationBufferMgt, TempPriceListLine);

        bestPrice := TempPriceListLine."Unit Price";

        if PriceCalculation.FindLines(AmountType::Discount, TempPriceListLine, PriceCalculationBufferMgt, false) then
            PriceCalculation.CalcBestAmount(AmountType::Discount, PriceCalculationBufferMgt, TempPriceListLine);

        bestDiscount := TempPriceListLine."Line Discount %";

        if TempPriceListLine."Asset No." = '' then
            exit(0);

        exit(TempPriceListLine."Unit Price");
    end;

    /// <summary>
    /// Calcula % descuento de un producto a una fecha especificia
    /// </summary>
    /// <param name="ItemNo">Nº del producto</param>
    /// <param name="CurrentDate">Fecha del periodo actual</param>
    /// <param name="CurrGroupId">Grupo de origen de datos</param>       
    /// <param name="CurrContactNo">Nº contacto de origen de datos</param>    
    /// <param name="CurrMinQty">Cantidad minima de origen de datos</param>        
    /// <returns>% de descuento</returns>
    procedure GetPeriodItemDiscount(ItemNo: Code[20]; CurrentDate: Date; CurrGroupId: Integer; CurrContactNo: Code[20]; CurrMinQty: Decimal): Decimal
    var
        TempPriceListLine: Record "Price List Line" temporary;
        TempPriceCalculationBuffer: Record "Price Calculation Buffer" temporary;
        PriceCalculation: Codeunit "Price Calculation - V16";
        PriceSourceList: Codeunit "Price Source List";
        PriceCalculationBufferMgt: Codeunit "Price Calculation Buffer Mgt.";
        AssetType: Enum "Price Asset Type";
        AmountType: Enum "Price Amount Type";
        PriceType: Enum "Price Type";
    begin
        PriceSourceList := InitPriceSourceList(CurrContactNo, CurrGroupId);

        TempPriceCalculationBuffer."Asset Type" := AssetType::Item;
        TempPriceCalculationBuffer."Asset No." := ItemNo;
        TempPriceCalculationBuffer."Price Type" := PriceType::Sale;
        TempPriceCalculationBuffer."Document Date" := CurrentDate;
        TempPriceCalculationBuffer."Allow Line Disc." := true;
        TempPriceCalculationBuffer.Quantity := CurrMinQty;
        TempPriceCalculationBuffer."Qty. per Unit of Measure" := 1;

        PriceCalculationBufferMgt.Set(TempPriceCalculationBuffer, PriceSourceList);

        if PriceCalculation.FindLines(AmountType::Discount, TempPriceListLine, PriceCalculationBufferMgt, false) then
            PriceCalculation.CalcBestAmount(AmountType::Discount, PriceCalculationBufferMgt, TempPriceListLine);

        if TempPriceListLine."Asset No." = '' then
            exit(0);

        exit(TempPriceListLine."Line Discount %");
    end;

    /// <summary>
    /// Inicializa lista de precios origen de datos estandar
    /// </summary>
    /// <param name="CurrContactNo">Nº contacto</param>
    /// <param name="CurrGroupId">Nº grup</param>
    /// <returns>Lista de precios origen</returns>
    internal procedure InitPriceSourceList(CurrContactNo: Code[20]; CurrGroupId: Integer): Codeunit "Price Source List"
    var
        PriceSourceList: Codeunit "Price Source List";
        SourceType: Enum "Price Source Type";
    begin
        PriceSourceList.Init();
        if CurrContactNo <> '' then begin
            PriceSourceList.Add(SourceType::"Customer", GetCustFromContactNo(CurrContactNo));
            PriceSourceList.Add(SourceType::"Contact", CurrContactNo);
        end else
            if CurrGroupId <> 0 then begin
                PriceSourceList.Add(SourceType::"Customer Disc. Group");
                PriceSourceList.Add(SourceType::"Customer Price Group");
            end else
                PriceSourceList.Add(SourceType::"All Customers");

        exit(PriceSourceList);
    end;

    local procedure GetCustFromContactNo(ContactNo: Code[20]): Code[20]
    var
        recContactBusinessRelation: Record "Contact Business Relation";
        recCustomer: Record Customer;
        recContact: Record "Contact";
    begin
        if not recContact.Get(ContactNo) then
            exit('');

        // Coge el primer contacto de cliente de la tabla business relation
        recContactBusinessRelation.SetRange("Contact No.", recContact."No.");
        recContactBusinessRelation.SetRange("Link to Table", Enum::"Contact Business Relation Link To Table"::Customer);
        if recContactBusinessRelation.FindFirst() then
            exit(recContactBusinessRelation."No.");

        // Busca el primer cliente que tenga el contacto configurado como contacto principal
        recCustomer.SetRange("Primary Contact No.", recContact."No.");
        if recCustomer.FindFirst() then
            exit(recCustomer."No.");
    end;
}