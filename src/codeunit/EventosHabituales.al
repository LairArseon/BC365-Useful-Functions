/// <summary>
/// Para recoger eventos que se usan de forma habitual
/// </summary>
codeunit 50212 EventosHabituales
{

    /// <summary>
    /// Elimina las líneas de producto que van con la cantidad vacía a los albaranes
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostSalesLineOnBeforeInsertShipmentLine', '', true, true)]
    local procedure QuitarLineasSincantidadAlbaranes(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var IsHandled: Boolean; SalesLineACY: Record "Sales Line"; DocType: Option; DocNo: Code[20]; ExtDocNo: Code[35])
    begin
        if (SalesLine."Qty. to Ship" = 0) and (SalesLine.Type = SalesLine.type::Item) then
            IsHandled := true;
    end;

    /// <summary>
    /// Elimina las líneas de producto que van con la cantidad vacía a las facturas
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostSalesLineOnBeforeInsertInvoiceLine', '', true, true)]
    local procedure QuitarLineasSincantidadFacturas(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    begin
        if (SalesLine."Qty. to Invoice" = 0) and (SalesLine.Type = SalesLine.type::Item) then
            IsHandled := true;
    end;
}