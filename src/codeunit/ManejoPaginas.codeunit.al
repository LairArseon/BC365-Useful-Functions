/// <summary>
/// Codeunit Manejo Paginas (ID 50201).
/// </summary>
codeunit 50201 "Manejo Paginas"
{

    // Funcion para lanzar páginas desde un recordref (es decir, sin saber ni numero de tabla o de página)
    // Utilizando un variant podemos tratar el recordref como un record para que se lanze la página por defecto que tienen

    /// <summary>
    /// LanzarPaginaDesdeRecordRef.
    /// </summary>
    /// <param name="IDRegistro">Guid.</param>
    /// <param name="nTabla">Integer.</param>
    procedure LanzarPaginaDesdeRecordRef(IDRegistro: Guid; nTabla: Integer)
    var
        registro: Guid;
        tabla: RecordRef;
        vartabla: Variant;
        idPage: Integer;
        PMng: Codeunit "Page Management";
    begin
        registro := IDRegistro;
        tabla.Open(nTabla);
        tabla.GetBySystemId(registro);
        idPage := PMng.GetPageID(tabla);
        vartabla := tabla;

        page.Run(idPage, vartabla);

    end;

}