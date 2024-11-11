/// <summary>
/// Página de Ficha con campos que se colorean y una factbox
/// </summary>
page 50207 FichaBase
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = TablaBase;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                }
                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        pagDetails: Page "Solicitar Valor";
                        retrievedValue: Text;
                        ReturnAction: Action;
                    begin
                        pagDetails.SetMessage('Este espacio se usa para mostrar un mesaje que el usuario pueda ver antes de introducir un valor', 'Favorable', true);
                        pagDetails.SetCaptions('Label1', 'Label2');
                        pagDetails.SetFieldType(FieldType::Integer);
                        pagDetails.SetValue(Rec.Description);
                        pagDetails.SetCloseOnValidate(true);

                        ReturnAction := pagDetails.RunModal();
                        if (ReturnAction = Action::OK) or (pagDetails.ClosedOnSuccessfulValidate()) then begin

                            if pagDetails.GetValue(retrievedValue) then begin
                                if Evaluate(Rec.Description, retrievedValue) then
                                    Rec.Modify();
                            end else
                                Error(GetLastErrorText());

                        end else
                            Message('Page Closed with action: %1', ReturnAction);
                    end;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
                field(DescriptionLong; Rec.DescriptionLong)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field(DescriptionLong2; Rec.DescriptionLong2)
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    var
                        textEditor: Page TextEditor;
                    begin
                        textEditor.SetContent(Rec.DescriptionLong);
                        textEditor.RunModal();

                        if textEditor.OK() then
                            textEditor.GetContent(Rec.DescriptionLong2);
                    end;
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                }
                field(PW; Rec.PassWord)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(imagefact; ImageFact)
            {
                ApplicationArea = all;
                SubPageLink = Number = field(Number);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Demo Get Value")
            {
                ApplicationArea = All;
                Caption = 'Get Integer Value', Comment = 'ESP="Obtener Valor Entero"';
                Tooltip = 'Asks the user to input a Value', Comment = 'ESP="Solicita un valor al usuario"';
                Image = GetEntries;

                trigger OnAction()
                var
                    pagDetails: Page "Solicitar Valor";
                    retrievedValue: Text;
                    ReturnAction: Action;
                begin
                    pagDetails.SetMessage('Este espacio se usa para mostrar un mesaje que el usuario pueda ver antes de introducir un valor', 'Favorable', true);
                    pagDetails.SetCaptions('Label1', 'Label2');
                    pagDetails.SetFieldType(FieldType::Integer);
                    pagDetails.SetValue(Rec.Description);
                    pagDetails.SetCloseOnValidate(true);

                    ReturnAction := pagDetails.RunModal();
                    if (ReturnAction = Action::OK) or (pagDetails.ClosedOnSuccessfulValidate()) then begin

                        if pagDetails.GetValue(retrievedValue) then begin
                            Message('Valor introducido: %1', retrievedValue);
                        end else
                            Error(GetLastErrorText());

                    end else
                        Message('Page Closed with action: %1', ReturnAction);
                end;
            }
            action("Demo Get Value ShortMessage")
            {
                ApplicationArea = All;
                Caption = 'Get Integer Value Short Message', Comment = 'ESP="Obtener Valor Entero con Mensaje Corto"';
                Tooltip = 'Asks the user to input a Value', Comment = 'ESP="Solicita un valor al usuario"';
                Image = GetEntries;

                trigger OnAction()
                var
                    pagDetails: Page "Solicitar Valor";
                    retrievedValue: Text;
                    ReturnAction: Action;
                begin
                    pagDetails.SetMessage('Este espacio se usa para mostrar un mesaje que el usuario pueda ver antes de introducir un valor', 'Unfavorable', false);
                    pagDetails.SetCaptions('Label1', 'Label2');
                    pagDetails.SetFieldType(FieldType::Integer);
                    pagDetails.SetValue(Rec.Description);
                    pagDetails.SetCloseOnValidate(true);

                    ReturnAction := pagDetails.RunModal();
                    if (ReturnAction = Action::OK) or (pagDetails.ClosedOnSuccessfulValidate()) then begin

                        if pagDetails.GetValue(retrievedValue) then begin
                            Message('Valor introducido: %1', retrievedValue);
                        end else
                            Error(GetLastErrorText());

                    end else
                        Message('Page Closed with action: %1', ReturnAction);
                end;
            }


        }
    }

}