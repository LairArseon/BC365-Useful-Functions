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
        }

    }

}