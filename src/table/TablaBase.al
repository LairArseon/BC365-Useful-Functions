/// <summary>
/// Table TablaBase (ID 50200).
/// </summary>
table 50200 TablaBase
{

    // Si queremos invocar un drilldown que llame a esta tabla es importante indicar la propiedad DrollDownPageID que es la que informa de que página
    // que debe abrirse en caso de llamarse al trigger
    DrillDownPageId = PaginaBase;

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
        field(9; PassWord; Text[200])
        {
            ExtendedDatatype = Masked;
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