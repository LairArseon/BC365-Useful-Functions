codeunit 50215 "Prueba Almacena Globales" implements "Prueba Interfaz"
{

    EventSubscriberInstance = Manual;

    var
        TempGLEntry: Record "G/L Entry" temporary;
        TempVATEntry: Record "VAT Entry" temporary;
        TempValueEntry: Record "Value Entry" temporary;
        TempItemLedgerEntry: Record "Item Ledger Entry" temporary;
        TempFALedgEntry: Record "FA Ledger Entry" temporary;
        TempCustLedgEntry: Record "Cust. Ledger Entry" temporary;
        TempDtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry" temporary;
        TempVendLedgEntry: Record "Vendor Ledger Entry" temporary;
        TempDtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry" temporary;
        TempEmplLedgEntry: Record "Employee Ledger Entry" temporary;
        TempDtldEmplLedgEntry: Record "Detailed Employee Ledger Entry" temporary;
        TempBankAccLedgerEntry: Record "Bank Account Ledger Entry" temporary;
        TempResLedgerEntry: Record "Res. Ledger Entry" temporary;
        TempServiceLedgerEntry: Record "Service Ledger Entry" temporary;
        TempWarrantyLedgerEntry: Record "Warranty Ledger Entry" temporary;
        TempMaintenanceLedgerEntry: Record "Maintenance Ledger Entry" temporary;
        TempJobLedgerEntry: Record "Job Ledger Entry" temporary;
        TempExchRateAdjmtLedgEntry: Record "Exch. Rate Adjmt. Ledg. Entry" temporary;
        TempWarehouseEntry: Record "Warehouse Entry" temporary;
        TempPhysInventoryLedgerEntry: Record "Phys. Inventory Ledger Entry" temporary;
        TempCapacityLedgerEntry: Record "Capacity Ledger Entry" temporary;
        PreviewDocumentNumbers: List of [Code[20]];
        CommitPrevented: Boolean;
        ShowDocNo: Boolean;
        TransactionConsistent: Boolean;

    procedure BindEvents(Bind: Boolean)
    begin
        OnLeashBinding(Bind);
    end;

    procedure GetEntries(TableNo: Integer; var RecRef: RecordRef)
    begin
        case TableNo of
            Database::"G/L Entry":
                RecRef.GETTABLE(TempGLEntry);
            Database::"Cust. Ledger Entry":
                RecRef.GETTABLE(TempCustLedgEntry);
            Database::"Detailed Cust. Ledg. Entry":
                RecRef.GETTABLE(TempDtldCustLedgEntry);
            Database::"Vendor Ledger Entry":
                RecRef.GETTABLE(TempVendLedgEntry);
            Database::"Detailed Vendor Ledg. Entry":
                RecRef.GETTABLE(TempDtldVendLedgEntry);
            Database::"Employee Ledger Entry":
                RecRef.GETTABLE(TempEmplLedgEntry);
            Database::"Detailed Employee Ledger Entry":
                RecRef.GETTABLE(TempDtldEmplLedgEntry);
            Database::"VAT Entry":
                RecRef.GETTABLE(TempVATEntry);
            Database::"Value Entry":
                RecRef.GETTABLE(TempValueEntry);
            Database::"Item Ledger Entry":
                RecRef.GETTABLE(TempItemLedgerEntry);
            Database::"FA Ledger Entry":
                RecRef.GETTABLE(TempFALedgEntry);
            Database::"Bank Account Ledger Entry":
                RecRef.GETTABLE(TempBankAccLedgerEntry);
            Database::"Res. Ledger Entry":
                RecRef.GETTABLE(TempResLedgerEntry);
            Database::"Service Ledger Entry":
                RecRef.GETTABLE(TempServiceLedgerEntry);
            Database::"Warranty Ledger Entry":
                RecRef.GETTABLE(TempWarrantyLedgerEntry);
            Database::"Maintenance Ledger Entry":
                RecRef.GETTABLE(TempMaintenanceLedgerEntry);
            Database::"Job Ledger Entry":
                RecRef.GETTABLE(TempJobLedgerEntry);
            Database::"Exch. Rate Adjmt. Ledg. Entry":
                RecRef.GetTable(TempExchRateAdjmtLedgEntry);
            Database::"Warehouse Entry":
                RecRef.GetTable(TempWarehouseEntry);
            Database::"Phys. Inventory Ledger Entry":
                RecRef.GetTable(TempPhysInventoryLedgerEntry);
            Database::"Capacity Ledger Entry":
                RecRef.GetTable(TempCapacityLedgerEntry);
            else
                OnGetEntries(TableNo, RecRef);
        end
    end;

    procedure IsTransactionConsistent(): Boolean
    begin
        exit(TransactionConsistent);
    end;

    procedure ShowEntries(TableNo: Integer)
    var
        CustLedgEntriesPreview: Page "Cust. Ledg. Entries Preview";
        VendLedgEntriesPreview: Page "Vend. Ledg. Entries Preview";
        ItemLedgerEntriesPreview: Page "Item Ledger Entries Preview";
        EmplLedgerEntriesPreview: Page "Empl. Ledger Entries Preview";
    begin
        case TableNo of
            Database::"G/L Entry":
                Page.Run(Page::"G/L Entries Preview", TempGLEntry);
            Database::"Cust. Ledger Entry":
                begin
                    CustLedgEntriesPreview.Set(TempCustLedgEntry, TempDtldCustLedgEntry);
                    CustLedgEntriesPreview.Run();
                    Clear(CustLedgEntriesPreview);
                end;
            Database::"Detailed Cust. Ledg. Entry":
                Page.Run(Page::"Det. Cust. Ledg. Entr. Preview", TempDtldCustLedgEntry);
            Database::"Vendor Ledger Entry":
                begin
                    VendLedgEntriesPreview.Set(TempVendLedgEntry, TempDtldVendLedgEntry);
                    VendLedgEntriesPreview.Run();
                    Clear(VendLedgEntriesPreview);
                end;
            Database::"Detailed Vendor Ledg. Entry":
                Page.Run(Page::"Detailed Vend. Entries Preview", TempDtldVendLedgEntry);
            Database::"Employee Ledger Entry":
                begin
                    EmplLedgerEntriesPreview.Set(TempEmplLedgEntry, TempDtldEmplLedgEntry);
                    EmplLedgerEntriesPreview.Run();
                    Clear(EmplLedgerEntriesPreview);
                end;
            Database::"Detailed Employee Ledger Entry":
                Page.Run(Page::"Detailed Empl. Entries Preview", TempDtldEmplLedgEntry);
            Database::"VAT Entry":
                Page.Run(Page::"VAT Entries Preview", TempVATEntry);
            Database::"Value Entry":
                Page.Run(Page::"Value Entries Preview", TempValueEntry);
            Database::"Item Ledger Entry":
                begin
                    ItemLedgerEntriesPreview.Set(TempItemLedgerEntry, TempValueEntry);
                    ItemLedgerEntriesPreview.Run();
                    Clear(ItemLedgerEntriesPreview);
                end;
            Database::"FA Ledger Entry":
                Page.Run(Page::"FA Ledger Entries Preview", TempFALedgEntry);
            Database::"Bank Account Ledger Entry":
                Page.Run(Page::"Bank Acc. Ledg. Entr. Preview", TempBankAccLedgerEntry);
            Database::"Res. Ledger Entry":
                Page.Run(Page::"Resource Ledg. Entries Preview", TempResLedgerEntry);
            Database::"Service Ledger Entry":
                Page.Run(Page::"Service Ledger Entries Preview", TempServiceLedgerEntry);
            Database::"Warranty Ledger Entry":
                Page.Run(Page::"Warranty Ledg. Entries Preview", TempWarrantyLedgerEntry);
            Database::"Maintenance Ledger Entry":
                Page.Run(Page::"Maint. Ledg. Entries Preview", TempMaintenanceLedgerEntry);
            Database::"Job Ledger Entry":
                Page.Run(Page::"Job Ledger Entries Preview", TempJobLedgerEntry);
            Database::"Exch. Rate Adjmt. Ledg. Entry":
                Page.Run(Page::"Exch.Rate Adjmt. Ledg.Entries", TempExchRateAdjmtLedgEntry);
            Database::"Warehouse Entry":
                Page.Run(Page::"Warehouse Entries", TempWarehouseEntry);
            Database::"Phys. Inventory Ledger Entry":
                Page.Run(Page::"Phys. Inventory Ledger Entries", TempPhysInventoryLedgerEntry);
            Database::"Capacity Ledger Entry":
                Page.Run(Page::"Capacity Ledger Entries", TempCapacityLedgerEntry);
            else
                OnAfterShowEntries(TableNo);
        end;
    end;

    procedure FillDocumentEntry(var TempDocumentEntry: Record "Document Entry" temporary)
    begin
        TempDocumentEntry.DeleteAll();
        InsertDocumentEntry(TempGLEntry, TempDocumentEntry);
        InsertDocumentEntry(TempVATEntry, TempDocumentEntry);
        InsertDocumentEntry(TempValueEntry, TempDocumentEntry);
        InsertDocumentEntry(TempItemLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempCustLedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempDtldCustLedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempVendLedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempDtldVendLedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempEmplLedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempDtldEmplLedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempFALedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempBankAccLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempResLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempServiceLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempWarrantyLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempMaintenanceLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempJobLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempExchRateAdjmtLedgEntry, TempDocumentEntry);
        InsertDocumentEntry(TempWarehouseEntry, TempDocumentEntry);
        InsertDocumentEntry(TempPhysInventoryLedgerEntry, TempDocumentEntry);
        InsertDocumentEntry(TempCapacityLedgerEntry, TempDocumentEntry);

        OnAfterFillDocumentEntry(TempDocumentEntry);
    end;

    procedure InsertDocumentEntry(RecVar: Variant; var TempDocumentEntry: Record "Document Entry" temporary)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(RecVar);

        if RecRef.IsEmpty() then
            exit;

        TempDocumentEntry.Init();
        TempDocumentEntry."Entry No." := RecRef.Number;
        TempDocumentEntry."Table ID" := RecRef.Number;
        TempDocumentEntry."Table Name" := RecRef.Caption;
        TempDocumentEntry."No. of Records" := RecRef.Count();
        TempDocumentEntry.Insert();
    end;

    procedure PreventCommit()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        if CommitPrevented then
            exit;

        // Mark any table as inconsistent as long as it is not made consistent later in the transaction
        SalesInvoiceHeader.Init();
        SalesInvoiceHeader.Consistent(false);
        CommitPrevented := true;
    end;

    procedure SetShowDocumentNo(NewShowDocNo: Boolean)
    begin
        ShowDocNo := NewShowDocNo;
    end;


    [IntegrationEvent(false, false)]
    local procedure OnAfterFillDocumentEntry(var DocumentEntry: Record "Document Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetEntries(TableNo: Integer; var RecRef: RecordRef)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowEntries(TableNo: Integer)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnLeashBinding(Bind: Boolean)
    begin
    end;

}