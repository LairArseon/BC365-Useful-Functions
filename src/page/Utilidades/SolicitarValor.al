/// <summary>
/// Página de dialogo estandar que se puede llamar para solicitar un valor del tipo especificado
/// 
///         INPUT:
///         - SetCaptions(lbl_PageCaption); // Establece los captions de la página y el campo
///         - SetFieldType(FieldType::Any); // O el tipo de campo a solicitar (Uno que pueda expresarse como Texto solo)
///         - SetMaxFieldLength(Lenght); // Establece la longitud máxima del campo (Solo para Text y Code)
///         - SetMessage(Text, Style, LongMessage); // Añade un mensaje en la parte superior de la página
///         - AddFieldType(FieldType::Any); // Permite añadir más tipos de campo aceptados
///         - Multiline(); // Si se desea que el campo sea multilinea
///         - SetCloseOnValidate(true); // Si se desea que la página se cierre al validar el campo
///         - SetValue(valor); // Establece el valor inicial del campo
/// 
///         OUTPUT:
///         - GetCaughtType(); // Se obtiene el tipo de campo aceptado
///         - GetCloseOnValidate(); // Se obtiene si la página se cerrará al validar el campo
///         - ClosedOnSuccessfulValidate(); // Se obtiene si la página se cerró al validar el campo
///         - GetValue(TextValue); // Se obtiene el valor como texto
///         - GetValueAsVariant(VariantValue); // Se obtiene el valor como un Variant
///
///        if "Solicitar Valor".RunModal() = Action::OK then begin
///          if "Solicitar Valor".GetValueAsVariant(valor) then
///               // Do stuff
///         else
///              Error(GetLastErrorText());
/// </summary>
page 50220 "Solicitar Valor"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Input', Comment = 'ESP="Datos"';
    DataCaptionExpression = GBL_PageCaption;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                ShowCaption = false;
                field(MessageFieldShort; GBL_Message)
                {
                    ShowCaption = false;
                    MultiLine = false;
                    StyleExpr = GBL_MessageStyle;
                    Visible = GBL_ShowMessage and not GBL_LongMessage;
                    Editable = false;
                }
                field(MessageFieldLong; GBL_Message)
                {
                    ShowCaption = false;
                    MultiLine = true;
                    StyleExpr = GBL_MessageStyle;
                    Visible = GBL_ShowMessage and GBL_LongMessage;
                    Editable = false;
                }
                field(SingleLineField; GBL_Value)
                {
                    CaptionClass = GBL_FieldCaption;
                    Visible = not GBL_MultiLine;

                    trigger OnValidate()
                    begin
                        if not EvalField(GBL_Value) then
                            Error(lbl_fieldType, GetAllowedFieldTypeList())
                        else
                            if GBL_CloseOnValidate then begin
                                GBL_PageClosedOnSuccessfulValidate := true;
                                CurrPage.Close();
                            end;
                    end;
                }
                field(MultiLineField; GBL_Value)
                {
                    CaptionClass = GBL_FieldCaption;
                    MultiLine = true;
                    Visible = GBL_MultiLine;

                    trigger OnValidate()
                    begin
                        if not EvalField(GBL_Value) then
                            Error(lbl_fieldType, GetAllowedFieldTypeList())
                        else
                            if GBL_CloseOnValidate then begin
                                GBL_PageClosedOnSuccessfulValidate := true;
                                CurrPage.Close();
                            end;
                    end;
                }
            }
        }
    }

    #region Parameter Settings

    /// <summary>
    /// Set the Field Type for the input field
    /// </summary>
    procedure SetFieldType(parFieldType: FieldType)
    begin
        GBL_StoredTypes := 1;
        GBL_FieldTypeArray[GBL_StoredTypes] := parFieldType;
    end;

    /// <summary>
    /// Add a Field Type to the list of allowed types for the input field
    /// </summary>
    procedure AddFieldType(parFieldType: FieldType)
    var
    begin
        GBL_StoredTypes += 1;
        GBL_FieldTypeArray[GBL_StoredTypes] := parFieldType;
    end;

    /// <summary>
    /// Set the maximum length for Text or Code FieldTypes
    /// </summary>
    procedure SetMaxFieldLength(parLength: Integer)
    begin
        GBL_FieldLength := parLength;
    end;

    /// <summary>
    /// Set the Captions for the Field and Page
    /// </summary>
    procedure SetCaptions(PageCaption: Text; FieldCaption: Text)
    begin
        GBL_PageCaption := PageCaption;
        GBL_FieldCaption := FieldCaption;
    end;

    /// <summary>
    /// Set the value of the input field when the page is opened
    /// </summary>
    procedure SetValue(parValue: Text)
    begin
        GBL_Value := parValue;
    end;

    /// <summary>
    /// Adds a message field on top of the input that will display the given text
    ///
    /// If the message is set to long, it will be displayed in a multiline field
    ///
    /// The message style can be used to set the color of the message
    /// </summary>
    procedure SetMessage(parMessage: Text; parMessageStyle: Text; parLongMessage: Boolean)
    begin
        GBL_Message := parMessage;
        GBL_MessageStyle := parMessageStyle;
        GBL_LongMessage := parLongMessage;
        GBL_ShowMessage := true;
    end;

    /// <summary>
    /// Set the input field to be Multiline
    /// </summary>
    procedure Multiline()
    begin
        GBL_MultiLine := true;
    end;

    /// <summary>
    /// Set the page to close when the input field is validated successfully
    /// </summary>
    procedure SetCloseOnValidate(parCloseOnValidate: Boolean)
    begin
        GBL_CloseOnValidate := parCloseOnValidate;
    end;

    #endregion Parameter Settings

    #region Retrieve Values

    /// <summary>
    /// Get the value of the input field as Text
    /// </summary>
    [TryFunction] // Get Value As Text
    procedure GetValue(var Valor: Text)
    begin
        if EvalField(GBL_Value) then
            Valor := GBL_Value
        else
            Error(lbl_fieldType, GetAllowedFieldTypeList());
    end;

    /// <summary>
    /// Get the value of the input field as Variant
    /// </summary>
    [TryFunction] // Get Value As Variant
    procedure GetValueAsVariant(var Valor: Variant)
    begin
        if EvalField(GBL_Value) then
            Valor := EvaluateToType(GBL_Value, GBL_CaughtType)
        else
            Error(lbl_fieldType, GetAllowedFieldTypeList());
    end;

    /// <summary>
    /// Get the accepted Field Type of the input field
    /// </summary>
    procedure GetCaughtType(): FieldType
    begin
        exit(GBL_CaughtType);
    end;

    /// <summary>
    /// Check if the page should be closed when the input field is validated
    /// </summary>
    procedure GetCloseOnValidate(): Boolean
    begin
        exit(GBL_CloseOnValidate);
    end;

    /// <summary>
    /// Checks if the page was closed on successful validation
    /// </summary>
    procedure ClosedOnSuccessfulValidate(): Boolean
    begin
        exit(GBL_PageClosedOnSuccessfulValidate);
    end;

    #endregion Retrieve Values

    local procedure EvalField(parValue: Text): Boolean
    var
        i: Integer;
        FieldType: FieldType;
    begin
        for i := 1 to GBL_StoredTypes do begin
            FieldType := GBL_FieldTypeArray[i];
            if EvalField(parValue, FieldType) then begin
                GBL_CaughtType := FieldType;
                exit(true);
            end;
        end;
    end;

    local procedure EvalField(parValue: Text; parFieldType: FieldType): Boolean
    var
        lbl_WrongFieldType: Label 'Please provide a correct Field Type', Comment = 'ESP="Por favor introduzca un Tipo de Campo correcto"';
        fBigInt: BigInteger;
        fCode: Code[2048];
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
                exit(Evaluate(fBigInt, parValue));

            FieldType::Boolean:
                exit(Evaluate(fBool, parValue));

            FieldType::Date:
                exit(Evaluate(fDate, parValue));

            FieldType::DateFormula:
                exit(Evaluate(fDateFormula, parValue));

            FieldType::DateTime:
                exit(Evaluate(fDateTime, parValue));

            FieldType::Decimal:
                exit(Evaluate(fDecimal, parValue));

            FieldType::Duration:
                exit(Evaluate(fDuration, parValue));

            FieldType::Guid:
                exit(Evaluate(fGuid, parValue));

            FieldType::Integer:
                exit(Evaluate(fInteger, parValue));

            FieldType::Time:
                exit(Evaluate(fTime, parValue));

            FieldType::Text:
                begin
                    if Evaluate(fText, parValue) then
                        if GBL_FieldLength > 0 then
                            if StrLen(fText) > GBL_FieldLength then
                                Error(lbl_MaxLength, GBL_FieldLength);
                    exit(true);
                end;

            FieldType::Code:
                begin
                    if Evaluate(fCode, parValue) then
                        if GBL_FieldLength > 0 then
                            if StrLen(fText) > GBL_FieldLength then
                                Error(lbl_MaxLength, GBL_FieldLength);
                    exit(true);
                end;

            else
                Error(lbl_WrongFieldType);
        end;
    end;

    local procedure EvaluateToType(parValue: Text; parFieldType: FieldType): Variant
    var
        lbl_WrongFieldType: Label 'Please provide a correct Field Type', Comment = 'ESP="Por favor introduzca un Tipo de Campo correcto"';
        fBigInt: BigInteger;
        fCode: Code[2048];
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
                if Evaluate(fBigInt, parValue) then
                    exit(fBigInt);

            FieldType::Boolean:
                if Evaluate(fBool, parValue) then
                    exit(fBool);

            FieldType::Date:
                if Evaluate(fDate, parValue) then
                    exit(fDate);

            FieldType::DateFormula:
                if Evaluate(fDateFormula, parValue) then
                    exit(fDateFormula);

            FieldType::DateTime:
                if Evaluate(fDateTime, parValue) then
                    exit(fDateTime);

            FieldType::Decimal:
                if Evaluate(fDecimal, parValue) then
                    exit(fDecimal);

            FieldType::Duration:
                if Evaluate(fDuration, parValue) then
                    exit(fDuration);

            FieldType::Guid:
                if Evaluate(fGuid, parValue) then
                    exit(fGuid);

            FieldType::Integer:
                if Evaluate(fInteger, parValue) then
                    exit(fInteger);

            FieldType::Time:
                if Evaluate(fTime, parValue) then
                    exit(fTime);

            FieldType::Text:
                if Evaluate(fText, parValue) then
                    exit(fText);

            FieldType::Code:
                if Evaluate(fCode, parValue) then
                    exit(fCode);

            else
                Error(lbl_WrongFieldType);
        end;
    end;

    local procedure GetAllowedFieldTypeList() FieldTypeList: Text
    var
        i: Integer;
        FieldType: FieldType;
    begin
        for i := 1 to GBL_StoredTypes do begin
            FieldType := GBL_FieldTypeArray[i];
            FieldTypeList := FieldTypeList + Format(FieldType) + ', ';
        end;

        FieldTypeList := FieldTypeList.TrimEnd(', ');
    end;

    var
        lbl_fieldType: Label 'The Input Value must be of type %1', Comment = 'ESP="El valor introducido debe ser de tipo %1"';
        lbl_MaxLength: Label 'The Input Value exceeds the maximum length of %1 characters', Comment = 'ESP="El valor introducido excede la longitud máxima de %1 caracteres"';
        GBL_MultiLine, GBL_CloseOnValidate, GBL_PageClosedOnSuccessfulValidate, GBL_ShowMessage, GBL_LongMessage : Boolean;
        GBL_PageCaption, GBL_FieldCaption, GBL_Value, GBL_Message, GBL_MessageStyle : Text;
        GBL_FieldTypeArray: array[20] of FieldType;
        GBL_StoredTypes, GBL_FieldLength : Integer;
        GBL_CaughtType: FieldType;
}