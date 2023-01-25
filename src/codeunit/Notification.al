/// <summary>
/// Codeunit Notification (ID 50205).
/// </summary>
codeunit 50205 Notification
{

    SingleInstance = true;

    // Añadir notificacion al Rolecenter que dependa de la existencia de la configuracion y el estado de un booleano
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", 'OnRoleCenterOpen', '', true, true)]
    local procedure "Conf./Personalization Mgt._OnRoleCenterOpen"()
    var
        confBI: Record ConfTable;
        Notifup: Boolean;
        lbl_NotifAction: Label 'Configure', comment = 'ESP="Configurar"';
        lbl_NeverShow: Label 'Never Show Again', comment = 'ESP="No volver a mostrar"';
        lbl_NotifText: Label 'Would you like to setup the BI Syncronization Extension Now?', Comment = 'ESP="¿Desea configurar la extensión de Sincronización BI ahora?"';
    begin
        if confBI.Get() then
            Notifup := not confBI.Up;

        if (Notifup) and (not NotificacionEjecutada) then begin

            notifConf.Message := lbl_NotifText;
            notifConf.Scope := NotificationScope::LocalScope;
            notifConf.AddAction(lbl_NotifAction, Codeunit::Notification, 'RunConfTable');
            notifConf.AddAction(lbl_NeverShow, Codeunit::Notification, 'TurnOffNotif');
            notifConf.Send();
            NotificacionEjecutada := true;
        end;

    end;

    var
        NotificacionEjecutada: Boolean;
        notifConf: Notification;
}