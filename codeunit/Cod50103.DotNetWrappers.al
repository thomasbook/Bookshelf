codeunit 50103 "DotNetWrappers"
{
    trigger OnRun()
    begin
        //TextDemo();
        //ListDemo();
        CountCharInName('Bill');

    end;

    procedure TextDemo()
    var
        LongText: Text;
        LongTextBuilder: TextBuilder;
    begin
        LongTextBuilder.AppendLine('We are adding a line');
        LongTextBuilder.Append('...or just add this ');
        LongTextBuilder.AppendLine('to the next line');
        LongTextBuilder.Replace('line', 'Line');

        LongText := LongTextBuilder.ToText();

        Message(LongText);
    end;


    procedure ListDemo()
    var
        Customer: Record Customer;
        CustomerNames: List of [Text];
    begin
        repeat
            CustomerNames.Add(Customer.Name);
        until (Customer.Next = 0);

        if CustomerNames.Contains('Somadis') then
            Message('Somadis is in the List');

        Message('Name %1 at %2', CustomerNames.Get(50), 50);
        Message(format(CustomerNames.Count));
        PrintListDemo(CustomerNames)
    end;

    local procedure PrintListDemo(CustomerNames: List of [Text])
    var
        Name: Text;
    begin
        foreach Name in CustomerNames do begin
            Message(Name);
        end;
    end;

    local procedure CountCharInName(Name: Text)
    var
        NameCharCount: Dictionary of [Char, Integer];
        i: Integer;
        c: Integer;
    begin
        Clear(NameCharCount);
        for i := 1 to StrLen(Name) do begin
            if NameCharCount.get(Name[i], c) then
                NameCharCount.Set(Name[i], c + 1)
            else
                NameCharCount.Set(name[i], 1);
        end;

        if NameCharCount.get('l', c) then
            Message('The name %1 has the letter L %2 times.', Name, format(c));
    end;
}