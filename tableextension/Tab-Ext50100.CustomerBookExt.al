tableextension 50100 "CustomerBookExt" extends Customer
{
    fields
    {
        field(50100; "Dyn Favorite Book No."; Text[20])
        {
            Caption = 'Favorite Book No.';
            TableRelation = Book."No.";
            DataClassification = ToBeClassified;
        }
    }

    trigger OnAfterInsert()
    var
        CustomerCode: Codeunit CustomerCode;

    begin
        CustomerCode.CelebrateCustomer(Rec, 'Congratulations!');
    end;

}