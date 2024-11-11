/// <summary>
/// Ejemplo de página de tipo StandardDialog
/// </summary>
page 50210 DialogBase
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; GBL_var)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    /// <summary>
    /// SetVar.
    /// </summary>
    /// <param name="varText">Text.</param>
    procedure SetVar(varText: Text)
    begin
        GBL_var := varText;
    end;

    /// <summary>
    /// GetVar.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    procedure GetVar(): Text
    begin
        exit(GBL_var);
    end;

    var
        GBL_var: Text;
}