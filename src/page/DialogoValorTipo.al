/// <summary>
/// Página de dialogo estandar que se puede llamar para solicitar un valor del tipo especificado
/// 
///        pagValue.Caption(lbl_PageCaption); // Valor del caption de la página
///        pagValue.SetFieldCaption(lbl_FieldCaption); // Valor del caption del campo
///        pagValue.SetFieldType(FieldType::Integer); // O el tipo de campo a solicitar (Uno que pueda expresarse como Texto solo)
/// 
///        if pagValue.RunModal() = Action::OK then begin
///           if pagValue.GetValue(valor) then
///                // Do stuff
///           else
///                Error(GetLastErrorText());
///           end;
///
/// </summary>
page 50220 "Solicitar Valor_SGA_LDR"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Input', comment = 'ESP="Datos"';
    DataCaptionExpression = GBL_PageCaption;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                ShowCaption = false;
                field(SingleLineField; GBL_Value)
                {
                    ApplicationArea = All;
                    CaptionClass = GBL_FieldCaption;
                    Visible = not GBL_MultiLine;

                    trigger OnValidate()
                    begin
                        if not EvalField(GBL_Value, GBL_FieldType) then
                            Error(lbl_fieldType, Format(GBL_FieldType));
                    end;
                }
                field(MultiLineField; GBL_Value)
                {
                    ApplicationArea = All;
                    CaptionClass = GBL_FieldCaption;
                    MultiLine = true;
                    Visible = GBL_MultiLine;

                    trigger OnValidate()
                    begin
                        if not EvalField(GBL_Value, GBL_FieldType) then
                            Error(lbl_fieldType, Format(GBL_FieldType));
                    end;
                }
            }
        }
    }

    procedure SetFieldType(parFieldType: FieldType)
    begin
        GBL_FieldType := parFieldType;
    end;

    procedure SetCaptions(PageCaption: Text; FieldCaption: Text)
    begin
        GBL_PageCaption := PageCaption;
        GBL_FieldCaption := FieldCaption;
    end;

    procedure SetValue(parValue: Text)
    begin
        GBL_Value := parValue;
    end;

    procedure Multiline()
    begin
        GBL_MultiLine := true;
    end;

    [TryFunction]
    procedure GetValue(var Valor: Text)
    begin
        if EvalField(GBL_Value, GBL_FieldType) then begin
            Valor := GBL_Value;
        end else
            Error(lbl_fieldType, Format(GBL_FieldType));
    end;

    local procedure EvalField(parValue: Text; parFieldType: FieldType): Boolean
    var
        lbl_WrongFieldType: Label 'Please provide a correct Field Type', Comment = 'ESP="Por favor introduzca un Tipo de Campo correcto"';
        fBigInt: BigInteger;
        fBool: Boolean;
        fDate: Date;
        fDateFormula: DateFormula;
        fDateTime: DateTime;
        fDecimal: Decimal;
        fDuration: Duration;
        fGuid: Guid;
        fInteger: Integer;
        fTime: Time;
        fText: Text;
    begin
        case parFieldType of
            FieldType::BigInteger:
                begin
                    exit(Evaluate(fBigInt, parValue));
                end;
            FieldType::Boolean:
                begin
                    exit(Evaluate(fBool, parValue));
                end;
            FieldType::Date:
                begin
                    exit(Evaluate(fDate, parValue));
                end;
            FieldType::DateFormula:
                begin
                    exit(Evaluate(fDateFormula, parValue));
                end;
            FieldType::DateTime:
                begin
                    exit(Evaluate(fDateTime, parValue));
                end;
            FieldType::Decimal:
                begin
                    exit(Evaluate(fDecimal, parValue));
                end;
            FieldType::Duration:
                begin
                    exit(Evaluate(fDuration, parValue));
                end;
            FieldType::Guid:
                begin
                    exit(Evaluate(fGuid, parValue));
                end;
            FieldType::Integer:
                begin
                    exit(Evaluate(fInteger, parValue));
                end;
            FieldType::Time:
                begin
                    exit(Evaluate(fTime, parValue));
                end;
            FieldType::Text:
                begin
                    exit(Evaluate(fText, parValue));
                end;
            else
                Error(lbl_WrongFieldType);
        end;
    end;

    var
        lbl_fieldType: Label 'The Input Value must be of type %1', Comment = 'ESP="El valor introducido debe ser de tipo %1"';
        GBL_MultiLine: Boolean;
        GBL_FieldCaption: Text;
        GBL_Value: Text;
        GBL_PageCaption: Text;

        // HACK Usar una lista de tipos para poder permitir inputs de varios tipos en la misma ventana
        GBL_FieldType: FieldType;
}