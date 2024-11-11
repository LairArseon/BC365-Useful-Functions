class UI {

    ContenedorAddIn;
    SpinnerOverlay;
    Upmessage = 'Ui Up';
    LastRowid;

    constructor()
    {
        this.ContenedorAddIn = $('<div id="contenedor-fuera" class="container"></div>');
        this.SpinnerOverlay = $('<div id="overlay"></div>');
        this.LastRowid = 0;

        this.SpinnerOverlay.append('<span class="loader"></span>');

        let ctrlAddinElement = $("#controlAddIn");

        ctrlAddinElement.append(this.ContenedorAddIn);
        ctrlAddinElement.append(this.SpinnerOverlay);
    }

    ShowSpinner(time) {

        this.SpinnerOverlay.show();
        time = time * 1000;

        if (time != 0) {
            var self = this;
            setTimeout(function(){ 
                self.HideSpinner();
            }, time);
        } 
    }

    HideSpinner() {
        this.SpinnerOverlay.hide();
    }

    AppendRow() {
        this.LastRowid ++;
        let newRow = new RowElement(this.LastRowid);
        this.ContenedorAddIn.append(newRow.UIElement);
        return(newRow);
    }

}

class Button {

    constructor(Text, Color)
    {
        this.Text = Text;
        this.Color = Color;

        this.UIElement = $(`<button class="btn btn-${Color} m-3" type="button">${Text}</button>`);

        this.UIElement.click(function() {
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('BotonPulsado', [this.innerText]);
        })
    }

}

class RowElement {

    LastColid;

    constructor(ID)
    {
        this.UIElement = $(`<div class="row"></div>`);
        this.LastColid = 0;
        this.ID = ID;
    }

    LogId() {
        console.log("Row id.: " + this.ID);
    }

    appendCol(ColSpan) {
        this.LastColid ++;
        let newCol = new ColElement(ColSpan, this.LastColid);
        this.UIElement.append(newCol.UIElement);
        return(newCol);
    }
}

class ColElement {

    constructor(ColSpan, ID)
    {
        this.Text = Text;
        this.ID = ID;

        this.UIElement = $(`<div id="${this.ID}" class="col${ColSpan > 0 ? ("-" + ColSpan) : ""}"></div>`);

    }

    setText(text) {
        this.UIElement.text(text);
    }

}

function InitialiseUI()
{
    return(new UI);
}
