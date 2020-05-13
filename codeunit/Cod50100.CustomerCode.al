codeunit 50100 "CustomerCode"
{
    trigger OnRun()
    begin

    end;

    procedure CelebrateCustomer(MyCustomer: Record Customer; ExtraMessage: Text)
    begin
        Message('We have a new cusotmer %1\\%2', MyCustomer."No.", ExtraMessage);
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', true, true)]
    local procedure Customer_OnAfterInsertEvent(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        CelebrateCustomer(Rec, 'Celebrate!');
    end;
}