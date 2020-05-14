codeunit 50104 "GetExchangeRate"
{
    TableNo = Currency;

    trigger OnRun()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        ReesponseText: Text;
        Texts: List of [Text];
        Value: Text;
        Rate: Text;
        Url: Text;
        startPostion: Integer;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        url := StrSubstNo('http://data.fixer.io/api/latest?access_key=%1&symbols=%2', '302d344725d5abd010638d45977c70d4', Code);

        if Client.Get(url, Response) then begin
            Response.Content.ReadAs(ReesponseText);
            Texts := ReesponseText.Split(',');
            foreach value in Texts do begin
                if value.Contains('rates') then begin
                    startPostion := Value.IndexOf(Code) + StrLen(Code);
                    Rate := Value.Substring(startPostion + 2, StrLen(Value) - startPostion - 3);
                    Message(Rate);
                end;
            end;
        end;
    end;
}