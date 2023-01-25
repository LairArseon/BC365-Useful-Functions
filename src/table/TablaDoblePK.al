table 50202 TablaDoblePK
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Maincode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; LineNo; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; Description; Text[2048])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; Maincode, LineNo)
        {
            Clustered = true;
        }
    }

}