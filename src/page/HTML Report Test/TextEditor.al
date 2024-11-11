page 50234 TextEditor
{
    Caption = 'Editar:', comment = 'ESP="Edit:"';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                ShowCaption = false;

                usercontrol(TextEditor; TextEditor)
                {
                    ApplicationArea = All;

                    trigger ControlAddinListo()
                    var
                    begin
                        CurrPage.TextEditor.ArrancaAddIn();
                        CurrPage.TextEditor.CrearCuadroTexto(GBL_BaseText);
                        CurrPage.TextEditor.PintarBotonesConfirmarCancelar();
                    end;

                    trigger DevolverTexto(TextoContenido: Text)
                    begin
                        GBL_ReturnText := TextoContenido;
                    end;

                    trigger Cerrar(Confirmar: Boolean)
                    begin
                        GBL_OK := Confirmar;

                        if Confirmar then
                            CurrPage.TextEditor.RecuperarTexto();

                        CurrPage.Close();
                    end;
                }
            }
        }
    }

    procedure SetContent(ContenidoInicial: Text)
    begin
        GBL_BaseText := ContenidoInicial;
    end;

    procedure SetContent(ContenidoInicial: Codeunit "Temp Blob")
    var
        Instr: InStream;
        textAux: Text;
    begin
        if ContenidoInicial.HasValue() then begin
            ContenidoInicial.CreateInStream(Instr);
            while not Instr.EOS do begin
                Clear(textAux);
                Instr.ReadText(textAux);
                GBL_BaseText += textAux;
            end;
        end;
    end;

    procedure GetContent(var ReturnText: Text)
    begin
        CurrPage.TextEditor.RecuperarTexto();
        ReturnText := GBL_ReturnText;
    end;

    procedure GetContent(var ReturnContent: Codeunit "Temp Blob")
    var
        OutStr: OutStream;
    begin
        CurrPage.TextEditor.RecuperarTexto();
        ReturnContent.CreateOutStream(OutStr);
        OutStr.WriteText(GBL_ReturnText);
    end;

    procedure OK(): Boolean
    begin
        exit(GBL_OK);
    end;

    var
        GBL_BaseText: Text;
        GBL_ReturnText: Text;
        GBL_OK: Boolean;
}