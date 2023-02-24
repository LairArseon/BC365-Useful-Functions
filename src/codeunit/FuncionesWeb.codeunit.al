/// <summary>
/// Codeunit FuncionesWeb (ID 50200).
/// </summary>
codeunit 50200 "Funciones Web"
{
    // Estructura de una peticion web, uso las peticiones que tenemos al servicio de licencia de COSMOS DB

    ///////////////////////////////// COSMOS ////////////////////////////////////////
    /// <summary>
    /// PeticionCosmos.
    /// </summary>
    /// <param name="Tipo">Enum CosmosCheck.</param>
    /// <returns>Return value of type Text.</returns>
    procedure PeticionCosmos(Tipo: Enum CosmosCheck): Text
    var
        Client: HttpClient;
        HttpRequestMsg: HttpRequestMessage;
        HttpResponseMsg: HttpResponseMessage;
        contentHeaders: HttpHeaders;
        content: HttpContent;
        URL: Text;
        Respuesta: text;
        txtbody: Text;
        lbl_CallFailed: Label 'Call Failed', Comment = 'ESP="Error en la llamada"';
        TenantArr: JsonArray;
        BodyObj: JsonObject;
    begin

        URL := SelURL(Tipo);

        // Cuerpo
        SetBody(Tipo, BodyObj);

        TenantArr.Add(BodyObj);
        TenantArr.WriteTo(txtbody);

        content.WriteFrom(txtbody);

        // Cabeceras
        content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json;charset=utf-8');

        //Metodo
        HttpRequestMsg.Method := 'POST';

        HttpRequestMsg.Content(content);
        HttpRequestMsg.SetRequestUri(URL);

        if not Client.Send(HttpRequestMsg, HttpResponseMsg) then
            Error(lbl_CallFailed);
        HttpResponseMsg.Content.ReadAs(Respuesta);

        Message(Respuesta);

        exit(Respuesta);
    end;

    /// <summary>
    /// SelURL.
    /// </summary>
    /// <param name="Tipo">Enum CosmosCheck.</param>
    /// <returns>Return value of type Text.</returns>
    procedure SelURL(Tipo: Enum CosmosCheck): Text
    begin
        case Tipo of
            Tipo::" ":
                begin
                    Error('');
                end;
            Tipo::ComprobarLicencia:
                begin
                    exit('http://pcdescm:7071/api/consultaUsos');
                end;
            Tipo::RegistrarUso:
                begin
                    exit('http://pcdescm:7071/api/registroUso');
                end;
        end;
    end;

    /// <summary>
    /// SetBody.
    /// </summary>
    /// <param name="Tipo">Enum CosmosCheck.</param>
    /// <param name="body">VAR JsonObject.</param>
    procedure SetBody(Tipo: Enum CosmosCheck; var body: JsonObject)
    var
        moduleInformation: ModuleInfo;
        TenantGuidTxt: Text;
        BCURLList: List of [Text];
        lbl_confirm: Label 'Check the tenant %1 for a licence?', Comment = '%1 is tenant';
    begin

        NavApp.GetCurrentModuleInfo(moduleInformation);

        BCURLList := GetUrl(ClientType::Web).Split('/');
        TenantGuidTxt := BCURLList.Get(4);
        TenantGuidTxt := '00000000-0000-0000-0000-000000000000'; // Para local

        case Tipo of

            Tipo::" ":
                begin

                end;

            Tipo::ComprobarLicencia:
                begin
                    body.Add('tenantId', TenantGuidTxt);
                    body.Add('fechaUso', Today);
                end;

            Tipo::RegistrarUso:
                begin
                    body.Add('tenantId', TenantGuidTxt);
                    body.Add('horaUso', Time);
                    body.Add('fechaUso', Today);
                    body.Add('appId', moduleInformation.Id);
                    body.Add('usuario', UserId);
                    body.Add('nombreCliente', CompanyName);
                end;
        end;

    end;
    ///////////////////////////////////////////////////////////////////////////////


}