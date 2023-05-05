/// <summary>
/// Esta codeunit se invoca desde sesiones paralelas para evitar que el rollback cancele el registro de un error
/// </summary>
codeunit 50209 RegistrarError
{

    TableNo = ErrorLog;

    trigger OnRun()
    begin
        if Rec.Insert(True) then begin
            Commit();
        end;

        StopSession(SessionId(), StrSubstNo('Error en origen %1 registrado con exito', Rec.ErrorSource));

        // Cerrar la sesion, aunque sea despues de la insercion, parece hacer rollback de la transaccion realizada
        // Teóricamente es correcto hacer un commit en caso de que se resuelva la instruccion correctamente, permitiendo grabar el valor, dado que el commit no
        // afectaría a la sesion inicial

        // https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/session/session-stopsession-method

    end;

}