codeunit 50216 "Binding Leash Management"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Prueba Almacena Globales", 'OnLeashBinding', '', true, true)]
    local procedure BindSubscription_PruebaAlmacenaGlobales(Bind: Boolean; var sender: Codeunit "Prueba Almacena Globales")
    begin
        if Bind then
            BindSubscription(sender)
        else
            UnBindSubscription(sender);
    end;

}