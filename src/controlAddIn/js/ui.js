
class UI {

    ContenedorAddIn = $('<div id="contenedor-fuera" class="container"></div>');
    SpinnerOverlay = $('<div id="overlay"></div>');
    Greeting = 'Hello';

    constructor()
    {
        this.SpinnerOverlay.append('<span class="loader"></span>');
        
        $("#controlAddIn").append(this.ContenedorAddIn);
        $("#controlAddIn").append(this.SpinnerOverlay);
    }

    ShowSpinner(time) {

        this.SpinnerOverlay.show();

        time = time * 1000;
        if (time != 0) {

            var self = this;
            setTimeout(function(){ self.HideSpinner() }, time);

        } 

    }

    HideSpinner() {
        this.SpinnerOverlay.hide();
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

function InitialiseUI()
{
    return(new UI);
}
