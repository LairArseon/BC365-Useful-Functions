/// <summary>
/// Table TablaBase (ID 50200).
/// </summary>
table 50200 TablaBase2
{

    fields
    {
        field(1; Number; Integer)
        {
            AutoIncrement = true;
        }

        field(2; Description; Text[50])
        {
        }
        field(3; Inventory; Integer)
        {
        }
        field(4; Image; Media)
        {
        }
        field(5; DescriptionLong; Text[2048])
        {

        }
        field(6; Imagenes; MediaSet)
        {
        }
        field(7; URL; Text[1024])
        {
        }
        field(8; QR; Media)
        {
        }
    }

    keys
    {
        key(PK; Number)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; Number, Description, Inventory, Image, DescriptionLong)
        {
        }
    }
}