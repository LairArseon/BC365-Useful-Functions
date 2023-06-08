/// <summary>
/// ControlAddIn de autorización Oauth
/// </summary>
page 50226 Survey
{
    Caption = 'Survey', comment = 'ESP="Encuesta"';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                ShowCaption = false;

                usercontrol(TaskPage; SatisfactionSurveyAsync)
                {
                    ApplicationArea = all;

                    trigger ControlAddInReady()
                    begin
                        Message('Survey Ready');
                    end;

                    trigger ResponseReceived(Status: Integer; Response: Text)
                    begin
                        Message(Response);
                    end;


                }
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
                Image = SendConfirmation;
                Caption = 'Send', comment = 'ESP="Enviar"';

                trigger OnAction()
                var
                    dialogValue: Page "Solicitar Valor_SGA_LDR";
                    URL: Text;
                begin
                    dialogValue.SetFieldType(FieldType::Text);
                    dialogValue.SetCaptions('URL', 'URL'); // Valor del caption del campo
                    if dialogValue.RunModal() = Action::OK then
                        dialogValue.GetValue(URL);
                    CurrPage.TaskPage.SendRequest(URL, 10000);
                end;
            }
        }
    }

}