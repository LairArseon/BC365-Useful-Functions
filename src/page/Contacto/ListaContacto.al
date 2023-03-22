page 50221 ListaContacto
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TablaQR;
    CardPageId = FichaContacto;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field(Tlfn; Rec.Tlfn)
                {
                    ApplicationArea = All;
                }
                field(Profesion; Rec.Profesion)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
            part(DatosContacto; FactContacto)
            {
                ApplicationArea = all;
                SubPageLink = AutoKey = field(AutoKey);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}