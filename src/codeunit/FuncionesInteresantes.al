codeunit 50210 FuncionesInteresantes
{

    /// <summary>
    /// Sustituye un fragmento de texto por otro dado en las versiones donde replace no existe
    /// </summary>
    procedure SustituirTextoViejas(): Text
    var
        textoInicial, TextoBuscar, TextoReemplazar, Resultado, valor : Text;
        posicionInicialTexto: Integer;
        pagGetValue: Page "Solicitar Valor";
    begin
        pagGetValue.SetFieldType(FieldType::Text);
        pagGetValue.SetCaptions('Texto original', 'Texto original');
        if pagGetValue.RunModal() = Action::OK then begin
            if pagGetValue.GetValue(valor) then
                textoInicial := valor
            else
                Error(GetLastErrorText());
        end;
        Clear(pagGetValue);
        pagGetValue.SetFieldType(FieldType::Text);
        pagGetValue.SetCaptions('Texto buscar', 'Texto buscar');
        if pagGetValue.RunModal() = Action::OK then begin
            if pagGetValue.GetValue(valor) then
                TextoBuscar := valor
            else
                Error(GetLastErrorText());
        end;
        Clear(pagGetValue);
        pagGetValue.SetFieldType(FieldType::Text);
        pagGetValue.SetCaptions('Texto reemplazar', 'Texto reemplazar');
        if pagGetValue.RunModal() = Action::OK then begin
            if pagGetValue.GetValue(valor) then
                TextoReemplazar := valor
            else
                Error(GetLastErrorText());
        end;

        // Inserta el texto nuevo
        Resultado := SustituirTextoViejas(textoInicial, TextoBuscar, TextoReemplazar);

        Message('Texto inicial: %1\Texto buscado: %2\Texto a Reemplazar: %3\Resultado: %4', textoInicial, TextoBuscar, TextoReemplazar, Resultado);
    end;

    /// <summary>
    /// Sustituye un fragmento de texto por otro dado en las versiones donde replace no existe
    /// </summary>
    procedure SustituirTextoViejas(TextoInicial: Text; TextoBuscar: Text; NuevoTexto: Text) Resultado: Text
    var
        posicionInicialTexto: Integer;
    begin
        posicionInicialTexto := StrPos(textoInicial, TextoBuscar);
        if posicionInicialTexto = 0 then
            Error('Texto no encontrado');

        // Elimina el texto original
        Resultado := DelStr(textoInicial, posicionInicialTexto, StrLen(TextoBuscar));

        // Inserta el texto nuevo
        Resultado := InsStr(Resultado, NuevoTexto, posicionInicialTexto);
    end;


    /// <summary>
    /// Función para generar todas las combinaciones posibles de elementos basado en un set de datos
    /// El mensaje es opcional
    /// </summary>
    /// <param name="Values"></param>
    /// <returns></returns>
    procedure SubSetSumPS(Values: List of [Code[50]]) tSubsets: List of [List of [Code[50]]]
    var
        SingleValue: Code[50];
        tSubset, tSubset2 : List of [Code[50]];
        TextList: Text;
        i, j : Integer;
    begin

        Clear(tSubset);

        tSubsets.Add(tSubset);

        foreach SingleValue in Values do begin
            j := tSubsets.Count();

            for i := 1 to j do begin

                Clear(tSubset2);
                tSubset2 := CopyList(tSubsets.Get(i));
                tSubset2.Add(SingleValue);
                tSubsets.Add(tSubset2);

            end;
        end;


        clear(tSubset);
        foreach tsubset in tsubsets do begin
            clear(SingleValue);
            foreach SingleValue in tSubset do begin
                TextList += SingleValue + ',';

            end;
            TextList := TextList.TrimEnd(',');
            TextList += '\';
        end;

        Message(TextList);

    end;

    local procedure CopyList(InputList: List of [Code[50]]) OutputList: List of [Code[50]]
    var
    // InnerList: List of [Text];
    begin
        OutputList := InputList.GetRange(1, InputList.Count);
    end;

    /// <summary>
    /// Recibe un diccionario de Paquetes y cantidades(base, por consistencia) y un valor que se busca, y devuelve verdadero o false
    /// en fución de si encuentra o no una combinación de paquetes que satisfaga la condicion (ser mayor que, menor que, o más cercano al valor dado)
    /// y rellena ClosestCombination con la combinación seleccionada, y ClosestDistance con la diferencia que hay entre el set y el valor dado
    /// || Aproximation Type: 0-Above, 1-Below, 2-Any ||
    /// </summary>
    /// <param name="Values"></param>
    /// <param name="TargetValue"></param>
    /// <param name="AproximationType">Above|Below|Any</param>
    /// <param name="ClosestCombination"></param>
    /// <param name="ClosestDistance"></param>
    /// <returns></returns>
    procedure FindClosestSubset(Values: Dictionary of [Code[50], Decimal]; TargetValue: Decimal; AproximationType: Option Above,Below,Any; var ClosestCombination: List of [Code[50]]; var ClosestDistance: Decimal): Boolean
    var
        SingleValue, IteraValue : Code[50];
        tSubset, tSubset2 : List of [Code[50]];
        tSubsets: Dictionary of [List of [Code[50]], Decimal];
        totalValue, distance : Decimal;
        i, j : Integer;
        foundFirstCombination, existsValidCombination : Boolean;
        TextList: Text;
    begin

        Clear(tSubset);

        tSubsets.Add(tSubset, 0);

        foreach SingleValue in Values.Keys do begin
            j := tSubsets.Count();

            for i := 1 to j do begin

                Clear(tSubset2);
                Clear(totalValue);
                tSubset2 := CopyList(tSubsets.Keys.Get(i));
                tSubset2.Add(SingleValue);

                foreach IteraValue in tSubset2 do begin
                    totalValue += Values.Get(IteraValue);

                    case AproximationType of
                        AproximationType::Above:
                            distance := totalValue - TargetValue;
                        AproximationType::Below:
                            distance := (totalValue - TargetValue) * -1;
                        AproximationType::Any:
                            distance := Abs(totalValue - TargetValue);
                    end;
                    if distance >= 0 then begin
                        existsValidCombination := true;

                        if not foundFirstCombination then begin

                            closestDistance := distance;
                            ClosestCombination := CopyList(tSubset2);

                        end else
                            // Al especificar '<' se coge la primera combinacion posible, usando '<=' se cogería la última
                            if (distance < closestDistance) then begin
                                closestDistance := distance;
                                ClosestCombination := CopyList(tSubset2);
                            end;

                        if not foundFirstCombination then
                            foundFirstCombination := true;
                    end;
                end;

                // Es posible extraer de tSubsets todos las combinaciones posibles que existan (en caso de que haya más de una empatada a la distancia mínima)
                // seleccionado aquellos objetos cuyo valor sea el 'target + distancia', eso puede ser útil de cara a aplicar condiciones adicionales
                // como por ejemplo utilizar la mayor o menor cantidad de paquetes posibles o priorizar fecha de entrada en caso de que sea relevante 
                tSubsets.Add(tSubset2, totalValue);

            end;
        end;

        Message('Closest distance = %1', closestDistance);

        clear(tSubset);
        foreach tsubset in tsubsets.Keys do begin
            clear(SingleValue);
            foreach SingleValue in tSubset do begin
                TextList += SingleValue + ',';

            end;
            TextList := TextList.TrimEnd(',');
            TextList += ' - Total: ' + Format(tSubsets.Get(tSubset));
            TextList += '\';
        end;
        Message(TextList);

        exit(foundFirstCombination and existsValidCombination);
    end;


    procedure SelectEnumValue(EnumAsVariant: Variant) SelectedValueAsInteger: Integer
    begin
        if EnumAsVariant.IsOption then
            Message(Format(EnumAsVariant))
        else
            Message('No es Option');
    end;

    procedure SelectEnumValue(EnumValues: List of [Text]) SelectedValueAsInteger: Integer
    var
        EnumValue, StrMenuText : Text;
    begin
        foreach EnumValue in EnumValues do begin
            StrMenuText += EnumValue + ',';
        end;
        StrMenuText := StrMenuText.TrimEnd(',');

        SelectedValueAsInteger := StrMenu(StrMenuText);

        Message('You have selected %1', SelectedValueAsInteger);

        SelectedValueAsInteger := SelectedValueAsInteger - 1; // StrMenu values start at 1, 0 is cancel, Enum value list starts at 0
    end;
}