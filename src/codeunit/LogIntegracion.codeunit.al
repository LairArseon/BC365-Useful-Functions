codeunit 50202 LogIntegracion
{

    // local procedure ProcesarLogIntegracionNoAux()
    // var
    //     logSincro: Record "Log Sincro BI_LDR";
    // begin
    //     logSincro.RESET;
    //     logSincro.SETCURRENTKEY(Tipo, Procesado);
    //     logSincro.SetRange(Tipo, logSincro.Tipo::Tabla);
    //     logSincro.SetRange(Procesado, false);
    //     logSincro.SetRange(NoProcesable, false);
    //     logSincro.SetRange(NumIntentos, 0, 10);
    //     IF logSincro.FindSet() THEN begin
    //         REPEAT
    //             IF logSincro.NumIntentos > 10 THEN BEGIN
    //                 logSincro.Validate(Erroneo, true);
    //                 logSincro.Validate(NumIntentos, 10);
    //             END
    //             ELSE begin
    //                 logSincro.Validate(NumIntentos, logSincro.NumIntentos + 1);
    //                 logSincro.MODIFY;
    //                 COMMIT;
    //                 ProcesarTabla(logSincro);
    //             end;

    //         UNTIL logSincro.NEXT = 0;
    //         COMMIT();
    //         ProcesarLogIntegracionNoAux();
    //     end;

    // end;

}