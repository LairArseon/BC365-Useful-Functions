/// <summary>
/// ControlAddIn de autorización Oauth
/// </summary>
page 50218 Oauth
{
    Caption = 'Oauth', comment = 'ESP="Oauth"';
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

                usercontrol(TaskPage; OAuthControlAddIn)
                {
                    ApplicationArea = all;

                    trigger ControlAddInReady()
                    begin
                        CurrPage.TaskPage.StartAuthorization('https://oauth.mocklab.io/oauth/authorize');
                    end;

                    trigger AuthorizationCodeRetrieved(AuthCode: Text)
                    begin
                        Message(AuthCode);
                    end;

                    trigger AuthorizationErrorOccurred(AuthError: Text; AuthErrorDescription: Text)
                    begin
                        Message(AuthError + ' : ' + AuthErrorDescription);

                    end;

                }
            }

        }
    }
}