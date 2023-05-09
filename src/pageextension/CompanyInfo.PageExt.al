/// <summary>
/// PageExtension CosmosMethods (ID 50200) extends Record Company Information.
/// </summary>
pageextension 50200 CosmosMethods extends "Company Information"
{
    actions
    {
        addfirst(Processing)
        {
            action(CosmosMethods)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = True;
                Image = Marketing;

                trigger OnAction()
                var
                    CosmosMethods_lbl: Label 'Check Licence, Register Usage';
                    Dialog_lbl: Label 'Choose one:';
                    Dialogresult: Integer;
                    Funciones: Codeunit "Funciones Web";
                    TipoCosmos: Enum CosmosCheck;
                begin
                    Dialogresult := StrMenu(CosmosMethods_lbl, 1, Dialog_lbl);
                    TipoCosmos := CosmosCheck.FromInteger(Dialogresult);
                    Funciones.PeticionCosmos(TipoCosmos);
                end;
            }
            action(CheckSystemRow)
            {
                ApplicationArea = All;
                Caption = 'Check SystemRow', Comment = 'ESP="Comprueba fila SQL"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = True;
                Image = ReviewWorksheet;

                trigger OnAction()
                var
                    RecRef: RecordRef;
                    FRef: FieldRef;
                begin
                    RecRef.Open(DATABASE::Customer);
                    RecRef.FindFirst();
                    FRef := RecRef.Field(0);
                    Message(Format(FRef.Value()));
                end;
            }

            // Comprueba desde que tipo de dispositivo se está trabajando
            action(CheckDevice)
            {
                ApplicationArea = All;
                Caption = 'Check Device', Comment = 'ESP="Comprueba Dispositivo"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = True;
                Image = ShortcutToDesktop;

                trigger OnAction()
                begin
                    Message(Format(Session.CurrentClientType));
                end;
            }
        }

    }

}