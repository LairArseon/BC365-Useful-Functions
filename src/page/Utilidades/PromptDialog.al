page 50235 PromptDialog
{
    Caption = 'Prompt Dialog', comment = 'ESP="Dialogo IA"';
    PageType = PromptDialog;
    ApplicationArea = All;
    UsageCategory = Administration;

    SourceTable = TablaBase;
    SourceTableTemporary = true;
    Extensible = false;

    IsPreview = true;


    layout
    {
        area(Prompt)
        {
            group("Inputs A")
            {
                field(Input1; Input1)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
            group("Inputs B")
            {
                field(Input2; Input2)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field(Input3; Input3)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }
        area(Content)
        {

            field(Output; Output)
            {
                ApplicationArea = All;
                MultiLine = true;
            }

        }
        area(PromptOptions)
        {
            field(Tone; Tone)
            {

            }
            field(TextFormat; TextFormat)
            {

            }
            field(Emphasis; Emphasis)
            {

            }
        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Ok)
            {
                Caption = 'AOK';
            }
            systemaction(Generate)
            {
                trigger OnAction()
                begin
                    Output := Format(Random(100));
                end;
            }
        }
    }

    var
        Input1, Input2, Input3, Output : Text;
        Tone: Enum "Entity Text Tone";
        TextFormat: Enum "Entity Text Format";
        Emphasis: Enum "Entity Text Emphasis";
}