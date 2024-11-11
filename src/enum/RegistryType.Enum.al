enum 50202 "Registry Type"
{
    Extensible = true;

    value(1; FreshInstall)
    {
        Caption = 'Fresh Install', comment = 'ESP="Nueva Instalación"';
    }

    value(2; ReInstall)
    {
        Caption = 'Re-Install', comment = 'ESP="Re-Instalación"';
    }

    value(3; Upgrade)
    {
        Caption = 'Upgrade', comment = 'ESP="Actualización"';
    }
}