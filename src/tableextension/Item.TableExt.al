/// <summary>
/// TableExtension Item (ID 50200) extends Record Item.
/// </summary>
tableextension 50200 "Item" extends Item
{
    fields
    {

        // Campos para página de control de stock
        field(50024; Indent; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; CodVariante; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50026; FechaReferenciaStock; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key20; "No. 2")
        {
        }
    }
}
