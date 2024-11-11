page 50239 "Registro Aplicacion - List"
{
    Caption = 'App registration', comment = 'ESP="Registro Aplicacion"';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Registro aplicacion";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(Tenant; Rec.Tenant)
                {
                    ToolTip = 'Specifies the value of the Tenant field.';
                }
                field(AppID; Rec.AppID)
                {
                    ToolTip = 'Specifies the value of the AppID field.';
                }
                field(RegistryType; Rec.RegistryType)
                {
                    ToolTip = 'Specifies the value of the RegistryType field.';
                }
                field(LastDateTimeUpdated; Rec.LastDateTimeUpdated)
                {
                    ToolTip = 'Specifies the value of the LastDateTimeUpdated field.';
                }
                field(AppName; Rec.AppName)
                {
                    ToolTip = 'Specifies the value of the AppName field.';
                }
                field(AppVersion; Rec.AppVersion)
                {
                    ToolTip = 'Specifies the value of the AppVersion field.';
                }
                field(CompanyName; Rec.CompanyName)
                {
                    ToolTip = 'Specifies the value of the CompanyName field.';
                }
                field(UserAuthEmail; Rec.UserAuthEmail)
                {
                    ToolTip = 'Specifies the value of the UserAuthEmail field.';
                }
                field(UserEmail; Rec.UserEmail)
                {
                    ToolTip = 'Specifies the value of the UserEmail field.';
                }
                field(UserFullName; Rec.UserFullName)
                {
                    ToolTip = 'Specifies the value of the UserFullName field.';
                }
                field(UserName; Rec.UserName)
                {
                    ToolTip = 'Specifies the value of the UserName field.';
                }
                field(environmentName; Rec.environmentName)
                {
                    ToolTip = 'Specifies the value of the environmentName field.';
                }
                field(isSaaS; Rec.isSaaS)
                {
                    ToolTip = 'Specifies the value of the isSaaS field.';
                }
                field(isProduction; Rec.isProduction)
                {
                    ToolTip = 'Specifies the value of the isProduction field.';
                }
            }
        }
    }

}