pageextension 50102 "CurrencyListExt" extends Currencies
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Exch. &Rates")
        {

            action(GetExchangeRate)
            {
                ApplicationArea = All;
                Caption = 'Get Exchange Rate';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Excise;
                trigger OnAction()
                var
                    GetExh: Codeunit GetExchangeRate;
                begin
                    GetExh.Run(Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}