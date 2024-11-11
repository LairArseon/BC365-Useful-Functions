interface "Prueba Interfaz"
{
    procedure BindEvents(Bind: Boolean)

    procedure GetEntries(TableNo: Integer; var RecRef: RecordRef)

    procedure IsTransactionConsistent(): Boolean

    procedure ShowEntries(TableNo: Integer)

    procedure FillDocumentEntry(var TempDocumentEntry: Record "Document Entry" temporary)

    procedure InsertDocumentEntry(RecVar: Variant; var TempDocumentEntry: Record "Document Entry" temporary)
}