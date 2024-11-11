codeunit 50217 InstallCDU
{

    Subtype = Install;

    var
        ApplicationRegistry: Codeunit "Application Registry Functions";

    trigger OnInstallAppPerCompany()
    var
        myAppInfo: ModuleInfo;
    begin
        // Get info about the currently executing module
        NavApp.GetCurrentModuleInfo(myAppInfo);

        // Enable WebService Use
        if not EnableWebService() then
            LogMessage('INST-001', 'Could not enable WebService use', Verbosity::Warning, DataClassification::SystemMetadata, TelemetryScope::All, 'ErrorCode', 'Webservice not enabled');

        // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall
        else
            // If not a fresh install, then we are Re-installing the same version of the extension
            HandleReinstall;

    end;

    local procedure HandleFreshInstall()
    begin
        ApplicationRegistry.RegisterApp(Enum::"Registry Type"::FreshInstall);
    end;

    local procedure HandleReinstall()
    begin
        ApplicationRegistry.RegisterApp(Enum::"Registry Type"::ReInstall);
    end;

    local procedure EnableWebService(): Boolean
    var
        ModuleInfo: ModuleInfo;
        recNavAppSetting: Record "NAV App Setting";
    begin
        if recNavAppSetting.Get(ModuleInfo.Id) then begin
            recNavAppSetting."Allow HttpClient Requests" := true;
            exit(recNavAppSetting.Modify());
        end else begin
            recNavAppSetting.Init();
            recNavAppSetting."App ID" := ModuleInfo.Id;
            recNavAppSetting."Allow HttpClient Requests" := true;
            exit(recNavAppSetting.Insert());
        end;
    end;


}