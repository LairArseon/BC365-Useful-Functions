codeunit 50211 "Type Helper HTML Report"
{

    procedure BR(): Text
    begin
        exit('<br>');
    end;

    procedure WrapDiv(PlainText: Text) DivElement: Text
    begin
        DivElement := '<div>';
        DivElement += PlainText;
        DivElement += '</div>';
    end;

    procedure WrapSpan(PlainText: Text) SpanElement: Text
    begin
        SpanElement := '<span>';
        SpanElement += PlainText;
        SpanElement += '</span>';
    end;

    procedure WrapParagraph(PlainText: Text) ParagraphElement: Text
    begin
        ParagraphElement := '<p>';
        ParagraphElement += PlainText;
        ParagraphElement += '</p>';
    end;

    procedure Bold(PlainText: Text) BoldText: Text
    begin
        BoldText := '<b>';
        BoldText += PlainText;
        BoldText += '</b>';
    end;

    procedure Italic(PlainText: Text) ItalicText: Text
    begin
        ItalicText := '<i>';
        ItalicText += PlainText;
        ItalicText += '</i>';
    end;

    procedure Underlined(PlainText: Text) UnderlinedText: Text
    begin
        UnderlinedText := '<u>';
        UnderlinedText += PlainText;
        UnderlinedText += '</u>';
    end;

    procedure StrikeThrough(PlainText: Text) StrikeThroughText: Text
    begin
        StrikeThroughText := '<s>';
        StrikeThroughText += PlainText;
        StrikeThroughText += '</s>';
    end;

    procedure OrderedList(TextList: List of [Text]) OrderedListText: Text
    var
        textElem: Text;
        OrderedList: TextBuilder;
    begin
        OrderedList.Append('<ol>');
        foreach textElem in TextList do begin
            TryAddListElement(OrderedList, textElem)
        end;
        OrderedList.Append('</ol>');

        OrderedListText := OrderedList.ToText();
    end;

    procedure UnorderedList(TextList: List of [Text]) UnorderedListText: Text
    var
        textElem: Text;
        UnorderedList: TextBuilder;
    begin
        UnorderedList.Append('<ul>');
        foreach textElem in TextList do begin
            TryAddListElement(UnorderedList, textElem)
        end;
        UnorderedList.Append('</ul>');

        UnorderedListText := UnorderedList.ToText();
    end;

    local procedure TryAddListElement(var ListObject: TextBuilder; ListElement: Text): Boolean
    var
        textLine: Text;
    begin
        textLine := '<li>';
        textLine += ListElement;
        textLine += '</li>';
        if ListObject.Append(textLine) then
            exit(true);
    end;

}