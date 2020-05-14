codeunit 50105 "RefreshALIssues"
{
    trigger OnRun()
    var
        AlIssues: Record ALIssue;
        Client: HttpClient;
        Response: HttpResponseMessage;
        JsonToken: JsonToken;
        Value: JsonValue;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonText: Text;
        i: Integer;
    begin
        AlIssues.DeleteAll();

        Client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        if not Client.get('https://api.github.com/repos/microsoft/AL/issues', Response) then
            Error('Web Service call failed');

        Response.Content.ReadAs(JsonText);

        if not Response.IsSuccessStatusCode then
            Error('Web Service Returned %1: %2', Response.HttpStatusCode, Response.ReasonPhrase);

        if not JsonArray.ReadFrom(JsonText) then
            Error('Invalid response, expected an JSON array.');

        foreach JsonToken in JsonArray do begin
            JsonObject := JsonToken.AsObject();

            AlIssues.Init();
            if not JsonObject.get('id', JsonToken) then
                error('Cound not find token a key');

            AlIssues.id := JsonToken.AsValue().AsInteger();
            AlIssues.number := GetJsonToken(JsonObject, 'number').AsValue().AsText();
            AlIssues.created_at := GetJsonToken(JsonObject, 'created_at').AsValue().AsDateTime();
            //AlIssues.user := GetJsonToken(JsonObject, 'user.login').AsValue().AsText();
            AlIssues.title := GetJsonToken(JsonObject, 'title').AsValue().AsText();
            AlIssues.state := GetJsonToken(JsonObject, 'state').AsValue().AsText();
            AlIssues.html_url := GetJsonToken(JsonObject, 'html_url').AsValue().AsText();
            AlIssues.Insert();
        end;
    end;

    local procedure GetJsonToken(jsonObject: JsonObject; tokenKey: Text) JsonToken: JsonToken
    begin
        if not JsonObject.get(tokenKey, JsonToken) then
            error('Could not find a token key %1', tokenKey);
        exit(JsonToken);
    end;
}