/// <summary>
/// Codeunit Notification (ID 50205).
/// </summary>
codeunit 50205 Notification
{

    // Lanzar una notificacion LOCAL al abrir el rolecenter
    // GLOBALES aun no implementadas

    SingleInstance = true;

    // Añadir notificacion al Rolecenter que dependa de la existencia de la configuracion y el estado de un booleano
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", 'OnRoleCenterOpen', '', true, true)]
    local procedure "Conf./Personalization Mgt._OnRoleCenterOpen"()
    var
        conf: Record ConfTable;
        Notifup: Boolean;
        lbl_NotifAction: Label 'Open', comment = 'ESP="Abrir"';
        lbl_NeverShow: Label 'Never Show Again', comment = 'ESP="No volver a mostrar"';
        lbl_NotifText: Label 'Open the Default Page?', Comment = 'ESP="¿Abrir la página por defecto?"';
    begin
        if conf.Get() then
            Notifup := not conf.Up;

        if (Notifup) and (not NotificacionEjecutada) then begin

            notifConf.Message := lbl_NotifText;
            notifConf.Scope := NotificationScope::LocalScope;
            notifConf.AddAction(lbl_NotifAction, Codeunit::Notification, 'RunConfTable');
            notifConf.AddAction(lbl_NeverShow, Codeunit::Notification, 'TurnOffNotif');
            notifConf.Send();
            NotificacionEjecutada := true;
        end;

    end;

    procedure RunConfTable(ConfNotif: Notification)
    var
        ConfPage: Page ConfPage;
    begin
        ConfPage.Run();
    end;

    procedure TurnOffNotif(ConfNotif: Notification)
    var
        Conf: Record ConfTable;
    begin
        if Conf.Get() then
            if not Conf.Up then begin
                Conf.Up := true;
                Conf.Modify();
            end;
    end;

    var
        NotificacionEjecutada: Boolean;
        notifConf: Notification;
}