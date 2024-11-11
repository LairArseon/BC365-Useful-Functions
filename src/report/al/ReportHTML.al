report 50200 "Report HTML"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(DataItemName; ConfTable)
        {
            column(texto; SourceText)
            {

            }
            column(blobcargar; blobFiddle)
            {

            }

            trigger OnPreDataItem()
            begin
                CalcFields(BlobFiddle);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceText)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './src/report/layout/mylayout.rdl';
        }
    }

    procedure AddContent(TextoContenido: Text)
    begin
        SourceText := TextoContenido;
    end;

    var
        SourceText: Text;
}