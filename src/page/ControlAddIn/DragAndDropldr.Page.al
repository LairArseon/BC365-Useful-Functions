// page 50230 "Drag And Drop"
// {
//     Caption = 'Drag And Drop', comment = 'ESP="Drag And Drop"';
//     PageType = CardPart;
//     ApplicationArea = All;
//     UsageCategory = Lists;

//     layout
//     {
//         area(Content)
//         {
//             usercontrol(FileDragAndDrop; DragAndDrop)
//             {
//                 ApplicationArea = All;

//                 trigger ControlAddinReady()
//                 begin
//                     CurrPage.FileDragAndDrop.InitializeFileDragAndDrop();
//                 end;

//                 trigger OnFileUpload(FileName: Text; FileAsText: Text; IsLastFile: Boolean)
//                 var
//                     Base64Convert: Codeunit "Base64 Convert";
//                     TempBlob: Codeunit "Temp Blob";
//                     FileInStream: InStream;
//                     FileOutStream: OutStream;
//                     tempRecOutstream: OutStream;
//                 begin
//                     TempBlob.CreateOutStream(FileOutStream, TextEncoding::UTF8);
//                     Base64Convert.FromBase64(FileAsText.Substring(FileAsText.IndexOf(',') + 1), FileOutStream);
//                     TempBlob.CreateInStream(FileInStream, TextEncoding::UTF8);

//                     tempRecDocumentBuffer.Id := 0;
//                     tempRecDocumentBuffer.Data.CreateOutStream(tempRecOutstream);

//                     CopyStream(tempRecOutstream, FileInStream);

//                     tempRecDocumentBuffer.Insert();

//                     fRef.Value := tempRecDocumentBuffer.Data;
//                     recRef.Modify();

//                     if IsLastFile then
//                         CurrPage.Update(false);
//                 end;
//             }
//         }
//     }


//     procedure SetRecRef(TableNo: Integer; BlobFieldNo: Integer)
//     var
//         outStr: OutStream;
//     begin

//         recRef.Open(TableNo);
//         fRef := recRef.Field(BlobFieldNo);

//         if not ((fRef.Type = FieldType::Blob) or ((fRef.Type = FieldType::Media))) then
//             Error('Referenced Field %1, %4 in Record %2, %5 mut be of type Blob or Media, it is of type %3 instead', BlobFieldNo, TableNo, fRef.Type, fRef.Caption, recRef.Caption);

//     end;

//     var
//         recRef: RecordRef;
//         fRef: FieldRef;
//         tempRecDocumentBuffer: Record "Document Sharing" temporary;

// }