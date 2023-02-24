/// <summary>
/// Página con un método que extrae la imagen de un Item en base 64 a traves de MediaSet
/// </summary>
page 50219 SacarB64Item
{
    Caption = 'B64 de Imagen';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(Filtro)
            {
                field(Name; GBL_ItemNo)
                {
                    ApplicationArea = All;
                    TableRelation = Item;

                    trigger OnValidate()
                    begin
                        GBL_B64 := ObtenerImagenProductoB64(GBL_ItemNo);
                    end;
                }
            }
            group(B64)
            {
                field(Base64Imge; GBL_B64)
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
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

    var
        GBL_ItemNo: Code[20];
        GBL_B64: Text;

    local procedure ObtenerImagenProductoB64(ItemNo: Code[20]) ItemImageBase64: Text
    var
        recItem: Record Item;
        recMediaSet: Record "Tenant Media Set";
        ItemMediaSetID: Guid;
        tblob: Codeunit "Temp Blob";
        MediaOutStream: OutStream;
        MediaInStream: InStream;
        b64Convert: Codeunit "Base64 Convert";
    begin
        if recItem.Get(ItemNo) then begin
            tblob.CreateOutStream(MediaOutStream);
            ItemMediaSetID := recItem.Picture.MediaId;
            recMediaSet.SetRange(ID, ItemMediaSetID);
            if recMediaSet.FindFirst() then begin
                if recMediaSet."Media ID".HasValue then begin
                    recMediaSet."Media ID".ExportStream(MediaOutStream);
                    tblob.CreateInStream(MediaInStream);
                    ItemImageBase64 := b64Convert.ToBase64(MediaInStream);
                end;
            end else
                ItemImageBase64 := '';
        end;
    end;

}