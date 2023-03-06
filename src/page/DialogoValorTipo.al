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
    Caption = 'Get Value', Comment = 'ESP="Obtener Valor"';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                ShowCaption = false;
                field(FieldName; GBL_Value)
                {
                    ApplicationArea = All;
                    CaptionClass = GBL_FieldCaption;

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

    procedure SetFieldCaption(FieldCaption: Text)
    begin
        GBL_FieldCaption := FieldCaption;
    end;

    [TryFunction]
    procedure GetValue(var Valor: Text)
    var
        ffieldref: FieldRef;
        variantValue: Variant;
    begin
        if EvalField(GBL_Value, GBL_FieldType) then begin
            Valor := GBL_Value;
        end else
            Error(lbl_fieldType, Format(GBL_FieldType));
    end;

    local procedure EvalField(GBL_Value: Text; GBL_FieldType: FieldType): Boolean
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
    begin
        case GBL_FieldType of
            FieldType::BigInteger:
                begin
                    exit(Evaluate(fBigInt, GBL_Value));
                end;
            FieldType::Boolean:
                begin
                    exit(Evaluate(fBool, GBL_Value));
                end;
            FieldType::Date:
                begin
                    exit(Evaluate(fDate, GBL_Value));
                end;
            FieldType::DateFormula:
                begin
                    exit(Evaluate(fDateFormula, GBL_Value));
                end;
            FieldType::DateTime:
                begin
                    exit(Evaluate(fDateTime, GBL_Value));
                end;
            FieldType::Decimal:
                begin
                    exit(Evaluate(fDecimal, GBL_Value));
                end;
            FieldType::Duration:
                begin
                    exit(Evaluate(fDuration, GBL_Value));
                end;
            FieldType::Guid:
                begin
                    exit(Evaluate(fGuid, GBL_Value));
                end;
            FieldType::Integer:
                begin
                    exit(Evaluate(fInteger, GBL_Value));
                end;
            FieldType::Time:
                begin
                    exit(Evaluate(fTime, GBL_Value));
                end;
            else
                Error(lbl_WrongFieldType);
        end;
    end;

    var
        lbl_fieldType: Label 'The Input Value must be of type %1', Comment = 'ESP="El valor introducido debe ser de tipo %1"';
        GBL_FieldType: FieldType;
        GBL_FieldCaption: Text;
        GBL_Value: Text;
}