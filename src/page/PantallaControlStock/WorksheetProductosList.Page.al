/// <summary>
/// Page Generic Table View (ID 50135).
/// </summary>
page 50200 "Worksheet Productos - List"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Item;
    SourceTableTemporary = true;
    SourceTableView = sorting("No. 2");
    Caption = 'Product variant worksheet', Comment = 'ESP="Lista de productos y variantes"';

    layout
    {
        area(Content)
        {
            group(filtrofecha)
            {
                Caption = 'Periodo de movimientos';
                field(fechainicio; fechaini)
                {
                    ApplicationArea = all;
                    caption = 'Fecha de inicio';
                    Editable = true;

                    trigger OnValidate()
                    begin
                        LoadDayCaptions();
                    end;
                }
            }
            repeater(GroupName)
            {
                Editable = false;
                IndentationColumn = Rec.Indent;
                IndentationControls = ItemDesc;
                ShowAsTree = true;

                field(ItemDesc; Rec.Description)
                {
                    ApplicationArea = All;
                    Visible = true;
                    StyleExpr = StyleText;
                    Caption = 'Item';
                }
                field(provfield1; provfield[1])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[1];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        if Rec.Indent > 0 then
                            EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[1])
                        else
                            EnSal.LoadItem(Rec."No.", '', fechas[1]);
                        EnSal.Run();

                    end;
                }
                field(provfield2; provfield[2])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[2];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        if Rec.Indent > 0 then
                            EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[2])
                        else
                            EnSal.LoadItem(Rec."No.", '', fechas[2]);
                        EnSal.Run();
                    end;
                }
                field(provfield3; provfield[3])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[3];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        if Rec.Indent > 0 then
                            EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[3])
                        else
                            EnSal.LoadItem(Rec."No.", '', fechas[3]);
                        EnSal.Run();
                    end;
                }
                field(provfield4; provfield[4])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[4];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        if Rec.Indent > 0 then
                            EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[4])
                        else
                            EnSal.LoadItem(Rec."No.", '', fechas[4]);
                        EnSal.Run();
                    end;
                }
                field(provfield5; provfield[5])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[5];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[5]);
                        EnSal.Run();
                    end;
                }
                field(provfield6; provfield[6])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[6];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[6]);
                        EnSal.Run();
                    end;
                }
                field(provfield7; provfield[7])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[7];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[7]);
                        EnSal.Run();
                    end;
                }
                field(provfield8; provfield[8])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[8];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[8]);
                        EnSal.Run();
                    end;
                }
                field(provfield9; provfield[9])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[9];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[9]);
                        EnSal.Run();
                    end;
                }
                field(provfield10; provfield[10])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[10];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[10]);
                        EnSal.Run();
                    end;
                }
                field(provfield11; provfield[11])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[11];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[11]);
                        EnSal.Run();
                    end;

                }
                field(provfield12; provfield[12])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[12];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[12]);
                        EnSal.Run();
                    end;
                }
                field(provfield13; provfield[13])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[13];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[13]);
                        EnSal.Run();
                    end;
                }
                field(provfield14; provfield[14])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[14];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[14]);
                        EnSal.Run();
                    end;
                }
                field(provfield15; provfield[15])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[15];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[15]);
                        EnSal.Run();
                    end;
                }
                field(provfield16; provfield[16])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[16];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[16]);
                        EnSal.Run();
                    end;
                }
                field(provfield17; provfield[17])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[17];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[17]);
                        EnSal.Run();
                    end;
                }
                field(provfield18; provfield[18])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[18];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[18]);
                        EnSal.Run();
                    end;
                }
                field(provfield19; provfield[19])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[19];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[19]);
                        EnSal.Run();
                    end;
                }
                field(provfield20; provfield[20])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[20];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[20]);
                        EnSal.Run();
                    end;
                }
                field(provfield21; provfield[21])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[21];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[21]);
                        EnSal.Run();
                    end;
                }
                field(provfield22; provfield[22])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[22];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[22]);
                        EnSal.Run();
                    end;
                }
                field(provfield23; provfield[23])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[23];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[23]);
                        EnSal.Run();
                    end;
                }
                field(provfield24; provfield[24])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[24];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[24]);
                        EnSal.Run();
                    end;
                }
                field(provfield25; provfield[25])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[25];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[25]);
                        EnSal.Run();
                    end;
                }
                field(provfield26; provfield[26])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[26];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[26]);
                        EnSal.Run();
                    end;
                }
                field(provfield27; provfield[27])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[27];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[27]);
                        EnSal.Run();
                    end;
                }
                field(provfield28; provfield[28])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[28];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[28]);
                        EnSal.Run();
                    end;
                }
                field(provfield29; provfield[29])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[29];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[29]);
                        EnSal.Run();
                    end;
                }
                field(provfield30; provfield[30])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[30];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[30]);
                        EnSal.Run();
                    end;
                }
                field(provfield31; provfield[31])
                {
                    ApplicationArea = All;
                    CaptionClass = provfieldcaparr[31];

                    trigger OnDrillDown()
                    var
                        EnSal: Page EntradasSalidas;
                    begin
                        EnSal.LoadItem(Rec."No.", Rec.CodVariante, fechas[31]);
                        EnSal.Run();
                    end;
                }

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Refrescar)
            {

                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CurrPage.Update();

                end;
            }

            action(Clean)
            {

                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Delete;
                Enabled = false;

                trigger OnAction()
                var
                    items: Record Item;
                begin
                    items.SetFilter("No.", 'TEST*');
                    items.DeleteAll();

                end;
            }
        }
    }

    trigger OnInit()
    var
        udAlmacen: Record "Stockkeeping Unit";
        udAlmacenAux: Record "Stockkeeping Unit";
        variants: Record "Item Variant";
        variantesRecorridas: List of [Code[10]];
        realItem: Record Item;
        ItemOrder: Code[10];
        ItemOrder2: Code[10];
        RealItemNo: Code[20];
    begin
        ItemOrder := '000000000';
        ItemOrder2 := '0000000000';
        if realItem.FindSet() then
            repeat
                // Utilizar los itemorder para ordenar los productos y sus variantes en la hoja
                ItemOrder := IncStr(ItemOrder);

                Rec.Init();
                Rec.Copy(realItem);
                Rec.Indent := 0;
                Rec."No. 2" := ItemOrder + ItemOrder2;
                Rec.Insert();

                RealItemNo := Rec."No.";

                Clear(udAlmacen);
                udAlmacen.SetRange("Item No.", Rec."No.");
                if udAlmacen.FindSet() then
                    repeat
                        if not variantesRecorridas.Contains(udAlmacen."Variant Code") then begin
                            // usamos el filtro este para solo buscar una variante, en todos los almacenes que pueda estar
                            ItemOrder2 := IncStr(ItemOrder2);

                            Clear(udAlmacenAux);
                            udAlmacenAux.SetRange("Item No.", Rec."No.");
                            udAlmacenAux.SetRange("Variant Code", udAlmacen."Variant Code");
                            if udAlmacenAux.Count() > 0 then begin
                                variantesRecorridas.Add(udAlmacen."Variant Code");
                                if udAlmacenAux.FindSet() then
                                    repeat
                                    // hacer algo referente al inventario si procede aqui
                                    until udAlmacenAux.Next() = 0;
                            end;

                            if variants.Get(RealItemNo, udAlmacen."Variant Code") then begin
                                Clear(Rec."No.");
                                Rec.Init();
                                // Rec.Description := variants.Description + ' ' + udAlmacen."Location Code";
                                Rec.Description := variants.Description;
                                Rec.Indent := 1;
                                Rec."No." := ItemOrder2;
                                Rec.CodVariante := variants.Code;
                                Rec."No. 2" := ItemOrder + ItemOrder2;
                                Rec.Insert();
                            end;

                        end;


                    until udAlmacen.Next() = 0;

            until realItem.Next() = 0;

        fechaini := Today;
        LoadDayCaptions();

        Rec.Reset();
    end;

    trigger OnAfterGetRecord()
    var
        IsVariant: Boolean;
        i: Integer;
    begin
        if Rec.Indent = 0 then begin
            StyleText := 'Strong';
            IsVariant := false;
        end else begin
            StyleText := 'None';
            IsVariant := true;
        end;

        for i := 1 to ArrayLen(provfield) do begin
            provfield[i] := CalculaInventario(Rec."No.", Rec.CodVariante, IsVariant, LoadDayCaptions() [i]);
        end;
    end;

    /// <summary>
    /// Carga en el array de valores los contenidos de los campos a mostrar
    /// </summary>
    /// <param name="codigoItem">Code[20].</param>
    /// <param name="codigoVariante">Code[10].</param>
    /// <param name="fecha">Date.</param>
    /// <returns>Valor del campo</returns>
    procedure cargarCampo(codigoItem: Code[20]; codigoVariante: Code[10]; fecha: Date): Integer
    var
        movimientos: Record "Item Ledger Entry";
        cantidad: Integer;
    begin
        movimientos.Reset();
        movimientos.SetRange(movimientos."Item No.", codigoItem);
        movimientos.SetRange(movimientos."Variant Code", codigoVariante);
        movimientos.SetRange(movimientos."Posting Date", fecha);

        if movimientos.FindSet() then
            repeat
            begin
                cantidad += movimientos.Quantity;
            end;
            until movimientos.Next() = 0;

        exit(cantidad);

    end;

    local procedure LoadDayCaptions(): array[31] of Date
    var
        i: Integer;
        movingDate: Date;
        dates: array[31] of Date;
    begin
        movingDate := fechaini;
        for i := 1 to ArrayLen(provfieldcaparr) do begin
            movingDate := CalcDate('<+1D>', movingDate);
            provfieldcaparr[i] := Format(movingDate);
            dates[i] := movingDate;
            fechas[i] := movingDate;
        end;

        exit(dates);
    end;

    local procedure CalculaInventario(itemRef: Code[20]; variantRef: Code[10]; isVariant: Boolean; SelDate: Date): Integer
    var
        LinCompra: Record "Purchase Line";
        totalCompra: Integer;
        LineaVenta: Record "Sales Line";
        totalVenta: Integer;
        OrdenProd: Record "Production Order";
        totalProd: Integer;
        ProcComponents: Record "Prod. Order Component";
        ConsumoComponentes: Integer;
        cantidad: Integer;
    // AsDatetime: DateTime;
    // AsDatetimeEnd: DateTime;
    // i: Integer;
    begin

        totalCompra := 0;
        totalVenta := 0;
        totalProd := 0;
        ConsumoComponentes := 0;

        LinCompra.SetRange("No.", itemRef);
        LinCompra.SetRange("Planned Receipt Date", SelDate);
        LinCompra.SetRange(Type, LinCompra.Type::Item);
        if isVariant then
            LinCompra.SetRange("Variant Code", variantRef);
        if LinCompra.FindSet() then
            repeat
                totalCompra += LinCompra.Quantity - LinCompra."Quantity Received";
            until LinCompra.Next() = 0;

        LineaVenta.SetRange("No.", itemRef);
        LineaVenta.SetRange("Planned Shipment Date", SelDate);
        LineaVenta.SetRange(Type, LineaVenta.Type::Item);
        if isVariant then
            LineaVenta.SetRange("Variant Code", variantRef);
        if LineaVenta.FindSet() then
            repeat
                totalVenta += LineaVenta.Quantity - LineaVenta."Quantity Shipped";
            until LineaVenta.Next() = 0;

        //AsDatetime := CREATEDATETIME(SelDate, 0T); // Esta tabla usa datetime en vez de date, creamos un datetime con tiempo a 0
        //AsDatetimeEnd := CreateDateTime(CalcDate('<+1D>', SelDate), 0T);

        OrdenProd.SetRange("Source No.", itemRef);
        // OrdenProd.SetRange("Ending Date-Time", AsDatetime, AsDatetimeEnd);
        OrdenProd.SetRange("Due Date", SelDate);
        if isVariant then
            OrdenProd.SetRange("Variant Code", variantRef);
        if OrdenProd.FindSet() then
            repeat
                totalProd += OrdenProd.Quantity;
            until OrdenProd.Next() = 0;


        // TODO Revisar linea produccion
        ProcComponents.SetRange("Item No.", itemRef);
        ProcComponents.SetRange("Due Date", SelDate);
        if isVariant then
            ProcComponents.SetRange("Variant Code", variantRef);
        if ProcComponents.FindSet() then
            repeat
                ConsumoComponentes += ProcComponents."Expected Quantity" - ProcComponents."Remaining Quantity";
            until ProcComponents.Next() = 0;

        cantidad := totalCompra + totalProd - totalVenta - ConsumoComponentes;

        exit(cantidad);

    end;

    var
        // itemsRec: Record Item;
        StyleText: Text;

        provfield: array[31] of Integer;
        provfieldcaparr: array[31] of Text;
        fechas: array[31] of date;

        fechaini: Date;

}