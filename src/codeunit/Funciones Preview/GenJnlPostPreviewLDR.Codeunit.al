codeunit 50213 GenJnlPostPreview_LDR
{

    var
        PostingPreviewEventHandler_LDR: Codeunit PostingPreviewEventHandler_LDR; // Single Instance
        PostingPreviewEventHandler: Codeunit "Posting Preview Event Handler";
        PruebaInterfaz: Interface "Prueba Interfaz";


    /// <summary>
    /// Vacía la instancia de la codeunit single-instance que se usa para almacenar el preview de las tablas que queremos añadir
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Preview", 'OnBeforeRunPreview', '', true, true)]
    local procedure ClearCustomPreviewBuffer(Subscriber: Variant; RecVar: Variant)
    var
        recConf: Record ConfTable;
    begin
        recConf.Get();

        PruebaInterfaz := recConf.TipoPreview;
        Clear(PostingPreviewEventHandler_LDR);
    end;

    /// <summary>
    /// Activa las suscripciones a los eventos de la codeunit PostingPreviewEventHandler_LDR durante la ejecución de la codeunit de registro
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Preview", 'OnAfterBindSubscription', '', true, true)]
    local procedure BindCustomSubscriptions()
    begin
        BindSubscription(PostingPreviewEventHandler_LDR);
        PruebaInterfaz.BindEvents(true);
    end;

    /// <summary>
    /// Desactiva las suscripciones a los eventos de la codeunit PostingPreviewEventHandler_LDR tras la ejecución de la codeunit de registro
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Preview", 'OnAfterUnbindSubscription', '', true, true)]
    local procedure UnBindCustomSubscriptions()
    begin
        UnbindSubscription(PostingPreviewEventHandler_LDR);
        PruebaInterfaz.BindEvents(false);
    end;

    // Estos dos eventos están relacionados la inserción y visualización de los registros personalizados añadidos al preview
    // NO deben estar en la codeunit PostingPreviewEventHandler_LDR porque esta tiene especificado el binding de eventos manual y estos solo
    // se activan durante la ejecución de la codeunit de registro
    // De modo que para obtener los registros que se declaran como globales en la codeunit declaramos un metodo Get para cada registro y lo llamamos aqui

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Posting Preview Event Handler", 'OnAfterShowEntries', '', true, true)]
    local procedure ShowEntries(TableNo: Integer)
    begin
        case TableNo of
            Database::"Mov Registro Seguimiento":
                Page.Run(Page::PreviewMovs, PostingPreviewEventHandler_LDR.GetTempWitholdingTaxEntry());

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Posting Preview Event Handler", 'OnAfterFillDocumentEntry', '', true, true)]
    local procedure AddCustomPreviewRecords(var DocumentEntry: Record "Document Entry" temporary)
    begin
        PostingPreviewEventHandler.InsertDocumentEntry(PostingPreviewEventHandler_LDR.GetTempWitholdingTaxEntry(), DocumentEntry);
    end;

}