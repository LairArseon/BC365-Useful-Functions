/// <summary>
/// Codeunit ChecklistSubs (ID 50204).
/// </summary>
codeunit 50204 ChecklistSubs
{

    // Método para quitar la visibilidad de la lista de tareas en el arranque
    [EventSubscriber(ObjectType::Codeunit, Codeunit::Checklist, 'OnChecklistLoading', '', true, true)]
    local procedure TurnOffChecklist()
    var
        CduChecklist: Codeunit Checklist;
    begin
        if CduChecklist.IsChecklistVisible() then
            CduChecklist.SetChecklistVisibility(false);
    end;

}