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
    }

    keys
    {
        key(Key1; PK)
        {
            Clustered = true;
        }
    }


}