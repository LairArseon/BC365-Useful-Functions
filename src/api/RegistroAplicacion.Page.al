page 50238 RegistroAplicacion
{
    PageType = API;
    EntityCaption = 'Registro de Aplicacion';
    EntitySetCaption = 'Registro de Aplicaciones';
    APIPublisher = 'TebbieINC';
    APIGroup = 'aplicaciones';
    APIVersion = 'v2.0';
    EntityName = 'registroAplicacion';
    EntitySetName = 'registroAplicaciones';
    SourceTable = "Registro aplicacion";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(appName; Rec.AppName)
                {
                    Caption = 'AppName';
                }
                field(companyName; Rec.CompanyName)
                {
                    Caption = 'CompanyName';
                }
                field(appVersion; Rec.AppVersion)
                {
                    Caption = 'AppVersion';
                }
                field(userAuthEmail; Rec.UserAuthEmail)
                {
                    Caption = 'UserAuthEmail';
                }
                field(userEmail; Rec.UserEmail)
                {
                    Caption = 'UserEmail';
                }
                field(userFullName; Rec.UserFullName)
                {
                    Caption = 'UserFullName';
                }
                field(userName; Rec.UserName)
                {
                    Caption = 'UserName';
                }
                field(recordID; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(appId; Rec.AppID)
                {
                    Caption = 'AppID';
                }
                field(tenantId; Rec.Tenant)
                {
                    Caption = 'Tenant';
                }
                field(lastDateTimeUpdated; Rec.LastDateTimeUpdated)
                {
                    Caption = 'LastDateTimeUpdated';
                }
                field(registryType; Rec.RegistryType)
                {
                    Caption = 'RegistryType';
                }
                field(environmentName; Rec.environmentName)
                {
                    Caption = 'EnvironmentName';
                }
                field(isSaaS; Rec.isSaaS)
                {
                    Caption = 'IsSaaS';
                }
                field(isProduction; Rec.isProduction)
                {
                    Caption = 'IsProduction';
                }

            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.lastdateTimeUpdated := CurrentDateTime;
    end;
}