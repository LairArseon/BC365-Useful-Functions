codeunit 50207 SustituirReport
{

    // Evento que se usa para sustituir el uso de un report, revisar Report Selection, parece mejor sistema
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSubstituteReport', '', true, true)]
    local procedure "ReportManagement_OnAfterSubstituteReport"
    (
        ReportId: Integer;
        RunMode: Option;
        RequestPageXml: Text;
        RecordRef: RecordRef;
        var NewReportId: Integer
    )
    begin

    end;


}