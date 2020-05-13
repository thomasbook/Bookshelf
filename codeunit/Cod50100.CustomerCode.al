codeunit 50100 "CustomerCode"
{
    var
        CelebrateLbl: Label 'Celebrate!';
        NewCustomerMsg: Label 'We have a new customer %1\\%2';

    procedure CelebrateCustomer(MyCustomer: Record Customer; ExtraMessage: Text)
    begin
        Message(NewCustomerMsg, MyCustomer."No.", ExtraMessage);
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', true, true)]
    local procedure Customer_OnAfterInsertEvent(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        CelebrateCustomer(Rec, CelebrateLbl);
    end;
}