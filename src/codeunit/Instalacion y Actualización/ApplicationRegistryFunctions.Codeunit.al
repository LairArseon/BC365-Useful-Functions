codeunit 50219 "Application Registry Functions"
{

    internal procedure RegisterApp(RegistryType: Enum "Registry Type")
    var
        AzureADTenant: Codeunit "Azure AD Tenant";
        recConf: Record ConfTable;
        httpClient: HttpClient;
        httpContent: HttpContent;
        httpResponse: HttpResponseMessage;
        JsonInstallInfo, JsonUserInfo : JsonObject;
        TextInstallInfo, ApprovalMessage : Text;
    begin
        if not recConf.Get() then begin
            recConf.Init();
            recConf.Insert();
        end;
        JsonInstallInfo.Add('tenantId', AzureADTenant.GetAadTenantId());
        JsonInstallInfo.Add('CompanyName', CompanyName);
        JsonInstallInfo.Add('RegistryType', RegistryType.Names.Get(RegistryType.AsInteger()));

        AddEnvironmentInfo(JsonInstallInfo);

        AddModuleInfo(JsonInstallInfo);

        AddUserInfo(JsonInstallInfo);

        JsonInstallInfo.WriteTo(TextInstallInfo);
        httpContent.WriteFrom(TextInstallInfo);
        if not httpClient.Post('https://appregistry.azurewebsites.net/api/SetRegistry', httpContent, httpResponse) then begin
            recConf.Approved := false;
            recConf.ApprovalMessage := 'Could not connect to the server';
            recConf.Modify();
        end;
        if httpResponse.IsSuccessStatusCode then begin
            recConf.Approved := true;
            if httpResponse.Content.ReadAs(ApprovalMessage) then
                recConf.ApprovalMessage := ApprovalMessage;
            recConf.Modify();
        end else begin
            recConf.Approved := false;
            recConf.ApprovalMessage := httpResponse.ReasonPhrase;
            recConf.Modify();
        end;
    end;

    local procedure AddEnvironmentInfo(var JsonInstallInfo: JsonObject)
    var
        EnvironmentInformation: Codeunit "Environment Information";
    begin
        JsonInstallInfo.Add('environmentName', EnvironmentInformation.GetEnvironmentName());
        JsonInstallInfo.Add('isSaaS', EnvironmentInformation.IsSaaS());
        JsonInstallInfo.Add('isProduction', EnvironmentInformation.IsProduction());
    end;

    local procedure AddModuleInfo(var JsonInstallInfo: JsonObject)
    var
        moduleInfo: ModuleInfo;
    begin
        NavApp.GetCallerModuleInfo(moduleInfo);

        JsonInstallInfo.Add('appId', moduleInfo.Id);
        JsonInstallInfo.Add('appVersion', Format(moduleInfo.AppVersion));
        JsonInstallInfo.Add('appName', moduleInfo.Name);
    end;

    local procedure AddUserInfo(var JsonInstallInfo: JsonObject)
    var
        recUser: Record User;
    begin
        if recUser.Get(UserSecurityId()) then begin
            JsonInstallInfo.Add('UserName', recUser."User Name");
            JsonInstallInfo.Add('UserFullName', recUser."Full Name");
            JsonInstallInfo.Add('UserEmail', recUser."Contact Email");
            JsonInstallInfo.Add('UserAuthEmail', recUser."Authentication Email");
        end;
    end;

}