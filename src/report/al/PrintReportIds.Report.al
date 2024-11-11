report 50201 PrintReportIds
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = IdList;
    Caption = 'RecordRefs', comment = 'ESP="RecordRefs"';

    dataset
    {
        dataitem(Company; Company)
        {
            DataItemTableView = sorting(Name);
            dataitem(Integer; Integer)
            {
                DataItemTableView = sorting(Number);

                column(KeyCaption; GBL_KeyField) { }

                column(RecordID; GBL_AnyRecordID) { }

                trigger OnAfterGetRecord()
                begin
                    GBL_RecRef.ChangeCompany(Company.Name);
                    GBL_KeyField := StrSubstNo(LBL_KeyCaption, GetDataLakeCompliantName(GBL_RecRef.Name), Company.Name);
                    GBL_AnyRecordID := GBL_RecRef.RecordId();
                    GBL_RecRef.Next();
                end;

                trigger OnPreDataItem()
                begin

                    // Si hay registros coge el primero
                    if not GBL_RecRef.FindFirst() then
                        Error('There are no records in the selected Table');

                    GBL_RecordCount := GBL_RecRef.Count();
                    Integer.SetRange(Number, 1, GBL_RecordCount);
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(TableID; GBL_TableID)
                    {
                        ApplicationArea = All;
                        TableRelation = AllObjWithCaption."Object ID" where("Object Type" = filter(Table));

                        trigger OnValidate()
                        var
                            recAllObjWCaption: Record AllObjWithCaption;
                        begin
                            if recAllObjWCaption.Get(recAllObjWCaption."Object Type"::Table, GBL_TableID) then
                                GBL_TableCaption := recAllObjWCaption."Object Caption";
                        end;
                    }
                    field(TableCaption; GBL_TableCaption)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(IdList)
        {
            Type = Excel;
            LayoutFile = './src/report/layout/IdList.xlsx';
        }
    }

    trigger OnPreReport()
    begin
        if GBL_TableID = 0 then
            Error('Select a Table');

        GBL_RecRef.Open(GBL_TableID);
    end;

    procedure GetDataLakeCompliantName(Name: Text) Result: Text
    var
        ResultBuilder: TextBuilder;
        Index: Integer;
        Letter: Text;
        AddToResult: Boolean;
    begin
        for Index := 1 to StrLen(Name) do begin
            Letter := CopyStr(Name, Index, 1);
            AddToResult := true;
            if StrPos(AlphabetsLowerTxt, Letter) = 0 then
                if StrPos(AlphabetsUpperTxt, Letter) = 0 then
                    if StrPos(NumeralsTxt, Letter) = 0 then
                        AddToResult := false;
            if AddToResult then
                ResultBuilder.Append(Letter);
        end;
        Result := ResultBuilder.ToText();
    end;

    var
        GBL_TableID, GBL_RecordCount : Integer;
        GBL_AnyRecordID: RecordId;
        GBL_TableCaption, GBL_KeyField : Text;
        GBL_RecRef: RecordRef;
        LBL_KeyCaption: Label '$Key%1:%2';
        AlphabetsLowerTxt: Label 'abcdefghijklmnopqrstuvwxyz';
        AlphabetsUpperTxt: Label 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        NumeralsTxt: Label '1234567890';
}