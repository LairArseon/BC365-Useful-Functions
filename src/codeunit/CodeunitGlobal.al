codeunit 50203 MyCodeunit
{

    SingleInstance = true;

    trigger OnRun()
    begin
        myInt += 1;
        Message(format(myInt));
        if dividir(0) then
            Message(GetLastErrorText());
    end;

    [TryFunction]
    procedure dividir(entero: Integer)
    begin

        myInt := myInt / entero;

    end;

    var
        myInt: Integer;
}