/// <summary>
/// Para crear cues en el rolecenter o cualquier otro espacio es necesario emplear flowfields
/// tipicamente estos flowfields se generarán sobre una tabla exclusiva donde llevar cuenta de los
/// calculos que se realizan para dichas cues
/// </summary>
table 50205 TablaCues
{
    Caption = 'Cues Table', comment = 'ESP="Tabla Cues"';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ClearKey; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; CuePagBase; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(TablaBase where(Inventory = filter('>0')));
        }
    }

    keys
    {
        key(Key1; ClearKey)
        {
            Clustered = true;
        }
    }


}