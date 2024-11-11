table 50203 TablaQR
{
    DataClassification = ToBeClassified;
    DrillDownPageId = FichaContacto;
    LookupPageId = ListaContacto;

    fields
    {
        field(1; AutoKey; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Titulo; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Nombre; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Apellido1; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Tlfn; Code[14])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(6; Email; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(7; FechaNaci; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Direccion; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Direccion2; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Web; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Org; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Profesion; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; TlfnTra; Code[14])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(14; QRContacto; Media)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Picture; Media)
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Person;
        }
        field(16; QRWeb; Media)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Apellido2; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18; TlfnMov; Code[14])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(19; Clave; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; AutoKey)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; Apellido1, Nombre, Tlfn, Org, Profesion, Picture, Direccion)
        {

        }
    }

    procedure CrearContenidoVCard() Contenido: Text
    var
        tHelper: Codeunit "Type Helper";
    begin
        Contenido += 'BEGIN:VCARD';
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'VERSION:3.0';
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'FN;CHARSET=UTF-8:' + Rec.Nombre + ' ' + Rec.Apellido1 + ' ' + Rec.Apellido2;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'N:' + Rec.Apellido1 + ';' + Rec.Nombre + ';' + Rec.Titulo + ';';
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'TEL;TYPE=HOME,VOICE:' + Rec.Tlfn;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'TEL;TYPE=WORK,VOICE:' + Rec.TlfnTra;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'TEL;TYPE=CELL,VOICE,PREF:' + Rec.TlfnTra;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'EMAIL;TYPE=INTERNET:' + Rec.Email;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'ORG:' + Rec.Org;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'TITLE:' + Rec.Profesion;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'BDAY:' + Format(Rec.FechaNaci);
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'ADR;CHARSET=UTF-8:' + Rec.Direccion + ' ' + Rec.Direccion2;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'URL:' + Rec.Web;
        Contenido += tHelper.CRLFSeparator();
        Contenido += 'END:VCARD';
        Contenido += tHelper.CRLFSeparator();
    end;


}