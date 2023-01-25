codeunit 50207 SustituirReport
{
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