codeunit 50206 InformacionEntorno
{

    procedure EvaluaEntorno()
    var
        InfoEntorno: Codeunit "Environment Information";
        textoEntorno: label 'Can Start Session: %1 \ Application Family: %2 \ Environment Name: %3 \ Is Financials: %4 \ Is OnPrem: %5 \ Is Production: %6 \ Is SaaS: %7 \ Is SaaS Infraestructure: %8 \ Is Sandbox: %9';
    begin
        Message(textoEntorno,
        InfoEntorno.CanStartSession(),
        InfoEntorno.GetApplicationFamily(),
        InfoEntorno.GetEnvironmentName(),
        InfoEntorno.IsFinancials(),
        InfoEntorno.IsOnPrem(),
        InfoEntorno.IsProduction(),
        InfoEntorno.IsSaaS(),
        InfoEntorno.IsSaaSInfrastructure(),
        InfoEntorno.IsSandbox()
        );

    end;

}