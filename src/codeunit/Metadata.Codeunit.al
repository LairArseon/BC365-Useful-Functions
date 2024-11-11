codeunit 50221 ExtractMetadata
{
    trigger OnRun()
    begin
        SelectObject();
    end;

    procedure SelectObject()
    var
        pagNameValueLookup: Page "Name/Value Lookup";
        recNameValueBuffer: Record "Name/Value Buffer";
        MetadataRecRef: RecordRef;
        BlobFieldRef: FieldRef;
        TempBlob: Codeunit "Temp Blob";
    begin
        MetadataRecRef.Open(Database::"Object Metadata");
        if MetadataRecRef.FindSet() then
            repeat
                BlobFieldRef := MetadataRecRef.Field(9);
                BlobFieldRef.CalcField();
                TempBlob.FromFieldRef(BlobFieldRef);
                pagNameValueLookup.AddItem(Format(MetadataRecRef.RecordId), Format(TempBlob.Length()));
            until MetadataRecRef.Next() = 0;

        if pagNameValueLookup.RunModal() = Action::LookupOK then begin
            pagNameValueLookup.GetRecord(recNameValueBuffer);
            DownloadFromStream(TempBlob.CreateInStream(), '', '', '', recNameValueBuffer.Name);
        end;

    end;
}