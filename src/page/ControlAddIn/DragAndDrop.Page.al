page 50230 "Drag And Drop"
{
    Caption = 'Drag And Drop', comment = 'ESP="Drag And Drop"';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            usercontrol(FileDragAndDrop; DragAndDrop)
            {
                ApplicationArea = All;

                trigger DataRead(Data: JsonObject)
                begin






                end;

                // trigger OnFileUpload(FileName: Text; FileAsText: Text; IsLastFile: Boolean)
                // var
                //     Base64Convert: Codeunit "Base64 Convert";
                //     TempBlob: Codeunit "Temp Blob";
                //     FileInStream: InStream;
                //     FileOutStream: OutStream;
                //     tempRecOutstream: OutStream;
                // begin
                //     TempBlob.CreateOutStream(FileOutStream, TextEncoding::UTF8);
                //     Base64Convert.FromBase64(FileAsText.Substring(FileAsText.IndexOf(',') + 1), FileOutStream);
                //     TempBlob.CreateInStream(FileInStream, TextEncoding::UTF8);

                //     tempRecDocumentBuffer.Id := 0;
                //     tempRecDocumentBuffer.Data.CreateOutStream(tempRecOutstream);

                //     CopyStream(tempRecOutstream, FileInStream);

                //     tempRecDocumentBuffer.Insert();

                //     fRef.Value := tempRecDocumentBuffer.Data;
                //     recRef.Modify();

                //     if IsLastFile then
                //         CurrPage.Update(false);
                // end;
            }
        }
    }


    procedure SetRecRef(TableNo: Integer; BlobFieldNo: Integer)
    var
        outStr: OutStream;
    begin

        recRef.Open(TableNo);
        fRef := recRef.Field(BlobFieldNo);

        if not ((fRef.Type = FieldType::Blob) or ((fRef.Type = FieldType::Media))) then
            Error('Referenced Field %1, %4 in Record %2, %5 mut be of type Blob or Media, it is of type %3 instead', BlobFieldNo, TableNo, fRef.Type, fRef.Caption, recRef.Caption);

    end;

    /// <summary>
    /// Save.
    /// </summary>
    /// <param name="DroppedFile">JsonObject.</param>
    local procedure UploadFile(DroppedFile: JsonObject)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        AuxInStream: InStream;
        AuxOutStream: OutStream;
        Base64Content: Text;
        ContentType: Text;
        FileExtension: Text;
        FileName: Text;
    begin
        FileName := GetTextValue(DroppedFile, 'Filename');
        FileExtension := GetTextValue(DroppedFile, 'FileExtension');
        ContentType := GetTextValue(DroppedFile, 'ContentType');
        Base64Content := GetTextValue(DroppedFile, 'Data', 0);

        if Base64Content <> '' then begin
            TempBlob.CreateOutStream(AuxOutStream);
            Base64Convert.FromBase64(Base64Content, AuxOutStream);

            if FileName <> '' then begin
                TempBlob.CreateInStream(AuxInStream);

                // StorageTypeDOCLDR.UploadFileFromDragAndDrop(TableId, SystemId, AuxInStream, FileName);

            end;
            CurrPage.Update(false);
        end;
    end;

    /// <summary>
    /// GetTextValue.
    /// </summary>
    /// <param name="Object">JsonObject.</param>
    /// <param name="KeyName">Text.</param>
    /// <returns>Return value of type Text.</returns>
    internal procedure GetTextValue(Object: JsonObject; KeyName: Text): Text
    begin
        exit(GetTextValue(Object, KeyName, '', 250));
    end;

    /// <summary>
    /// GetTextValue.
    /// </summary>
    /// <param name="Object">JsonObject.</param>
    /// <param name="KeyName">Text.</param>
    /// <param name="MaxLenght">Integer.</param>
    /// <returns>Return value of type Text.</returns>
    internal procedure GetTextValue(Object: JsonObject; KeyName: Text; MaxLenght: Integer): Text
    begin
        exit(GetTextValue(Object, KeyName, '', MaxLenght));
    end;

    /// <summary>
    /// GetTextValue.
    /// </summary>
    /// <param name="Object">JsonObject.</param>
    /// <param name="KeyName">Text.</param>
    /// <param name="DefaultValue">Text.</param>
    /// <param name="MaxLenght">Integer.</param>
    /// <returns>Return value of type Text.</returns>
    internal procedure GetTextValue(Object: JsonObject; KeyName: Text; DefaultValue: Text; MaxLenght: Integer): Text
    var
        Token: JsonToken;
        JsonVal: JsonValue;
    begin
        if not Object.Contains(KeyName) then
            exit(DefaultValue);

        Object.Get(KeyName, Token);
        if not Token.IsValue() then
            exit(DefaultValue);

        JsonVal := Token.AsValue();
        if JsonVal.IsNull() or JsonVal.IsUndefined() then
            exit(DefaultValue);

        if MaxLenght = 0 then
            exit(JsonVal.AsText())
        else
            exit(CopyStr(JsonVal.AsText(), 1, MaxLenght))
    end;

    var
        recRef: RecordRef;
        fRef: FieldRef;
        tempRecDocumentBuffer: Record "Document Sharing" temporary;

}