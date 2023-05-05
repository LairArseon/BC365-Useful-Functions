/// <summary>
/// Tabla registro de errores para escribir en sesion de background
/// </summary>
table 50204 ErrorLog
{
    DataClassification = ToBeClassified;
    Caption = 'Error Log', comment = 'ESP="Log de Errores"';

    fields
    {
        field(1; IdError; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; ErrorText; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; ErrorSource; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; InfoError; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; User; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; ErrorDateTime; DateTime)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; IdError)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Rec.User := UserId;
        Rec.ErrorDateTime := CurrentDateTime;
    end;

}