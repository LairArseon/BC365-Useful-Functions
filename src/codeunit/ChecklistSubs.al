/// <summary>
/// Codeunit ChecklistSubs (ID 50204).
/// </summary>
codeunit 50204 ChecklistSubs
{

    // Método para modificar la visibilidad de la lista de tareas en el arranque
    [EventSubscriber(ObjectType::Codeunit, Codeunit::Checklist, 'OnChecklistLoading', '', true, true)]
    local procedure TurnOffChecklist()
    var
        THelper: Codeunit "Type Helper";
        recConf: Record ConfTable;
        CduChecklist: Codeunit Checklist;
        CduChecklistStatusText: Text;
    begin
        recConf.Get();

        CduChecklistStatusText := 'Ha pasado por el evento OnChecklistLoading';

        if CduChecklist.IsChecklistVisible() then begin
            CduChecklistStatusText += THelper.CRLFSeparator();
            CduChecklistStatusText += 'La lista de tareas estaba visible';
        end else begin
            CduChecklistStatusText += THelper.CRLFSeparator();
            CduChecklistStatusText += 'La lista de tareas no estaba visible';
        end;

        CduChecklist.SetChecklistVisibility(true);
        CduChecklistStatusText += THelper.CRLFSeparator();
        CduChecklistStatusText += 'Se Asigna visibilidad true a la lista de tareas';

        if CduChecklist.IsChecklistVisible() then begin
            CduChecklistStatusText += THelper.CRLFSeparator();
            CduChecklistStatusText += 'La lista de tareas es ahora visible';
        end else begin
            CduChecklistStatusText += THelper.CRLFSeparator();
            CduChecklistStatusText += 'La lista de tareas sigue sin ser visible';
        end;

        recConf.ChecklistShownDetail := CduChecklistStatusText;
        recConf.Modify();
    end;


    #region Welcome Banner

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Checklist Banner", 'OnBeforeUpdateBannerLabels', '', true, true)]
    local procedure "Checklist Banner_OnBeforeUpdateBannerLabels"
    (
        var IsHandled: Boolean;
        IsEvaluationCompany: Boolean;
        var TitleTxt: Text;
        var TitleCollapsedTxt: Text;
        var HeaderTxt: Text;
        var HeaderCollapsedTxt: Text;
        var DescriptionTxt: Text;
        IsSetupStarted: Boolean;
        AreAllItemsSkippedOrCompleted: Boolean
    )
    begin
        IsHandled := true;
        TitleTxt := 'Prueba Saludo Titulo';
        TitleCollapsedTxt := 'Titulo colapsado';
        HeaderTxt := 'Prueba Cabecera';
        HeaderCollapsedTxt := 'Cabecera Colapsada';
        DescriptionTxt := 'Descripcion test';
    end;

    #endregion

}