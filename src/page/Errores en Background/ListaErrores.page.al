page 50225 ListaErrores
{
    Caption = 'Error List', comment = 'ESP="Lista Errores"';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ErrorLog;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(IdError; Rec.IdError)
                {
                    ApplicationArea = All;
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                }
                field(ErrorDateTime; Rec.ErrorDateTime)
                {
                    ApplicationArea = All;
                }
                field(InfoError; Rec.InfoError)
                {
                    ApplicationArea = All;
                }
                field(ErrorText; Rec.ErrorText)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ForzarError)
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    IDSessionBackground: Integer;
                begin
                    IDSessionBackground := CrearError(
                        'TEST',
                        'Texto de descripción del error generado directamente desde la página(lista) de errores de la extensión de Funciones Útiles',
                        'Campo Informativo sobre el error generado'
                        );

                    Error('Error Generado, registrado con sesion %1', IDSessionBackground);
                end;
            }
        }
    }

    /// <summary>
    /// Esta funcion inicia una sesión alternativa en la que se registra el error con los datos que le hemos proporcionado, permitiendo que el rollback de un
    /// Error no deshaga el regustro
    /// </summary>
    /// <param name="ErrorSource"></param>
    /// <param name="ErrorText"></param>
    /// <param name="InfoError"></param>
    procedure CrearError(ErrorSource: Code[20]; ErrorText: Text[2048]; InfoError: Text[2048]) IDSessionBackground: Integer
    var
        recErrorLog: Record ErrorLog;
    begin
        recErrorLog.ErrorSource := 'TEST';
        recErrorLog.ErrorText := 'Texto de descripción del error generado directamente desde la página(lista) de errores de la extensión de Funciones Útiles';
        recErrorLog.InfoError := 'Campo Informativo sobre el error generado';

        StartSession(IDSessionBackground, Codeunit::RegistrarError, CompanyName, recErrorLog);
    end;

}