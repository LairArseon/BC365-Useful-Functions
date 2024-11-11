pageextension 50204 MyExtension extends "Headline RC Order Processor"
{
    layout
    {
        addbefore(Control1)
        {
            field(MyPersonalHeadlineText; MyPersonalHeadlineText)
            {
                ApplicationArea = All;

                trigger OnDrillDown()
                begin
                    Page.Run(Page::ConfPage);
                end;
            }

            // Las HeadLines NO MUESTRAN IMÁGENES
            field(FirstCustomerPicture; recCustomer.Image)
            {
                ApplicationArea = All;
            }
        }
    }


    trigger OnOpenPage()
    var
        recTablaBase: Record TablaBase;
    begin
        MyPersonalHeadlineText := StrSubstNo('Good Morning! %1 You have %2 warehouse tasks pending.', UserId, recTablaBase.Count());
        recCustomer.FindFirst();
    end;

    var
        recCustomer: Record Customer;
        MyPersonalHeadlineText: Text;
}