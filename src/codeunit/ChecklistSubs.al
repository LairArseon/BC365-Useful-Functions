/// <summary>
/// Codeunit ChecklistSubs (ID 50204).
/// </summary>
codeunit 50204 ChecklistSubs
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::Checklist, 'OnChecklistLoading', '', true, true)]
    local procedure TurnOffChecklist()
    var
        CduChecklist: Codeunit Checklist;
    begin
        if CduChecklist.IsChecklistVisible() then
            CduChecklist.SetChecklistVisibility(false);
    end;

}