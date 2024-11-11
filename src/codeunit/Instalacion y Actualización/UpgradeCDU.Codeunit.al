codeunit 50218 UpgradeCDU
{

    Subtype = Upgrade;

    var
        ApplicationRegistry: Codeunit "Application Registry Functions";

    trigger OnUpgradePerCompany()
    begin
        ApplicationRegistry.RegisterApp(Enum::"Registry Type"::Upgrade);
    end;

}