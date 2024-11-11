/// <summary>
/// Inicializar tabla de configuración al abrir la página si no hay registro para no tener que crearlo a mano
/// </summary>
page 50209 ConfPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ConfTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Base Conf.', comment = 'ESP="Conf. Base"';
                field(Up; Rec.Up)
                {
                    ApplicationArea = All;

                }
                field(TipoPreview; Rec.TipoPreview)
                {
                    ApplicationArea = All;

                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ApprovalMessage; Rec.ApprovalMessage)
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                }
            }
            group(CLConf)
            {
                Caption = 'CheckList Conf.', comment = 'ESP="Conf. Lista"';
                field(ChecklistShown; Rec.ChecklistShown)
                {
                    ApplicationArea = All;

                }
                field(ChecklistShownDetail; Rec.ChecklistShownDetail)
                {
                    ApplicationArea = All;
                    MultiLine = true;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SustituirTexto)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Funciones: Codeunit FuncionesInteresantes;
                begin
                    Funciones.SustituirTextoViejas();
                end;
            }
            action(Print)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    repCustomerList: Report "Customer - List";
                begin
                    repCustomerList.UseRequestPage(false);
                    repCustomerList.Run();
                end;
            }
            action(ViewMetadata)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    cduExtractMetadata: Codeunit ExtractMetadata;
                begin
                    cduExtractMetadata.Run();
                end;
            }
            action(IsOption)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Funciones: Codeunit FuncionesInteresantes;
                    Enu: Enum "Purchase Document IC Status";
                    SelectedValue: Integer;
                begin
                    SelectedValue := Funciones.SelectEnumValue(Enu.Names());
                    Message(Format(Enum::"Purchase Document IC Status".FromInteger(SelectedValue)));
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

    end;
}