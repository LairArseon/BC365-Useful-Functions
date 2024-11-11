codeunit 50214 PostingPreviewEventHandler_LDR
{

    SingleInstance = true;
    EventSubscriberInstance = Manual;

    var
        PostingPreviewEventHandler: Codeunit "Posting Preview Event Handler";
        ShowDocNo: Boolean;

    // Por lo que he visto el estándar no referencia al método SetShowDocumentNo de su PreviewEventHandler, así que no se desde donde llamarlo
    procedure SetShowDocumentNo(NewShowDocNo: Boolean)
    begin
        ShowDocNo := NewShowDocNo;
    end;

    #region "Mov Registro Seguimiento"

    var
        Temp_GBL_MovRegistroSeguimiento: Record "Mov Registro Seguimiento" temporary;

    procedure GetTempWitholdingTaxEntry() MovRegistroSeguimiento: Record "Mov Registro Seguimiento" temporary
    begin
        Temp_GBL_MovRegistroSeguimiento.Reset();
        if Temp_GBL_MovRegistroSeguimiento.FindSet() then
            repeat
                MovRegistroSeguimiento := Temp_GBL_MovRegistroSeguimiento;
                MovRegistroSeguimiento.Insert();
            until Temp_GBL_MovRegistroSeguimiento.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Mov Registro Seguimiento", 'OnBeforeInsertEvent', '', true, true)]
    local procedure SaveTempWitholdingTaxEntry(var Rec: Record "Mov Registro Seguimiento")
    begin
        if Rec.IsTemporary() then
            exit;

        PostingPreviewEventHandler.PreventCommit();
        Temp_GBL_MovRegistroSeguimiento := Rec;
        if not ShowDocNo then
            Temp_GBL_MovRegistroSeguimiento.DocumentNo := '***';
        Temp_GBL_MovRegistroSeguimiento.Insert();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Mov Registro Seguimiento", 'OnAfterModifyEvent', '', false, false)]
    local procedure UpdateTempWitholdingTaxEntry(var Rec: Record "Mov Registro Seguimiento")
    begin
        if Rec.IsTemporary() then
            exit;

        Temp_GBL_MovRegistroSeguimiento := Rec;
        Temp_GBL_MovRegistroSeguimiento.DocumentNo := '***';

        if Temp_GBL_MovRegistroSeguimiento.Modify() then
            PostingPreviewEventHandler.PreventCommit();
    end;

    #endregion



}