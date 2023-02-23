page 50217 Spinner
{
    Caption = 'Spinner', comment = 'ESP="Spinner"';
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
                Visible = GBLVisible;

                usercontrol(TaskPage; WaitSpinner)
                {
                    ApplicationArea = all;

                    trigger Ready()
                    begin
                        if GBLControlReady then
                            exit;
                        GBLControlReady := true;
                        CurrPage.TaskPage.Wait(0);
                    end;

                    trigger Callback()
                    begin
                        if GBLResto > 10 then
                            GBLResto := 0;

                        GBLTimeWaited += 1;
                        GBLResto += 1;

                        if (GBLResto >= 5) and (GBLResto <= 10) then
                            GBLVisible := false
                        else
                            GBLVisible := true;

                        CurrPage.TaskPage.Wait(0);
                    end;

                }
            }

            group(campos)
            {
                field(TimeWaited; GBLTimeWaited)
                {
                    ApplicationArea = all;
                }

            }
        }


    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        GBLVisible := true;
    end;

    var
        GBLTimeWaited: Decimal;
        GBLControlReady: Boolean;
        GBLVisible: Boolean;
        GBLResto: Decimal;

}