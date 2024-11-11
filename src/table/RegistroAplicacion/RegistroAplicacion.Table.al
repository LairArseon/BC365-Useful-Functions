table 50207 "Registro aplicacion"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; AppID; Guid) { }

        field(2; Tenant; Guid) { }

        field(3; LastDateTimeUpdated; DateTime) { }

        field(4; AppVersion; Code[100]) { }

        field(5; AppName; Text[100]) { }

        field(6; CompanyName; Text[100]) { }

        field(7; UserName; Text[100]) { }

        field(8; UserFullName; Text[100]) { }

        field(9; UserEmail; Text[100]) { }

        field(10; UserAuthEmail; Text[100]) { }

        field(11; RegistryType; Enum "Registry Type") { }

        field(12; environmentName; Text[100]) { }

        field(13; isSaaS; Boolean) { }

        field(14; isProduction; Boolean) { }
    }

    keys
    {
        key(Key1; AppID, Tenant, CompanyName, LastDateTimeUpdated)
        {
            Clustered = true;
        }
    }

}