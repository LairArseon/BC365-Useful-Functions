/// <summary>
/// Table ConfTable (ID 50201).
/// </summary>
table 50201 ConfTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Up; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(3; BlobFiddle; Blob)
        {
            DataClassification = ToBeClassified;
        }

        field(4; TextFiddle; Text[2048])
        {
            DataClassification = ToBeClassified;
        }

        field(5; TipoPreview; Enum "Asocia Interfaz")
        {
            DataClassification = ToBeClassified;
        }

        field(6; Approved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; ApprovalMessage; Text[2048])
        {
            DataClassification = ToBeClassified;
        }

        // CheckList
        field(8; ChecklistShown; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; ChecklistShownDetail; Text[2048])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; PK)
        {
            Clustered = true;
        }
    }


}