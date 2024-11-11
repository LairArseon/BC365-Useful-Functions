page 50241 SubirImagenAPI
{
    PageType = API;
    Caption = 'SubirImagen';
    APIPublisher = 'TebbieINC';
    APIGroup = 'aplicaciones';
    APIVersion = 'v2.0';
    EntityName = 'subidaImagen';
    EntitySetName = 'subidaImagenes';
    SourceTable = TablaBase;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(number; Rec.Number)
                {
                    Caption = 'Number';
                    Description = 'Cualquier campo que componga la clave primaria de la tabla, en la página de api deben figurar todos los que se quieran rellenar';
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    Description = 'Este campo devuelve el GUID del media resource, se puede usar este código para acceder directamente a la imagen';
                }
                field(imageB64; imageB64)
                {
                    Caption = 'ImagenB64';
                    Description = 'En este campo se puede enviar/recibir la imágen en Base64';

                    trigger OnValidate()
                    var
                        base64: Codeunit "Base64 Convert";
                        tBlob: Codeunit "Temp Blob";
                        instr: InStream;
                        outstr: OutStream;
                    begin
                        tBlob.CreateOutStream(outstr);
                        base64.FromBase64(imageB64, outstr);
                        tBlob.CreateInStream(instr);
                        Rec.Image.ImportStream(instr, 'Picture', 'application/pdf');
                    end;

                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        base64: Codeunit "Base64 Convert";
        tBlob: Codeunit "Temp Blob";
        instr: InStream;
        outstr: OutStream;
    begin
        tBlob.CreateOutStream(outstr);
        Rec.Image.ExportStream(outstr);
        tBlob.CreateInStream(instr);
        imageB64 := base64.ToBase64(instr);
    end;

    var
        imageB64: Text;
}