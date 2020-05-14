codeunit 50102 "UpgradeCode"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        Book: Record Book;
        Customer: Record Customer;
    begin
        Book.Reset();
        if not Book.FindFirst() then
            exit;

        Customer.Reset();
        if not Customer.IsEmpty() then
            Customer.ModifyAll("Dyn Favorite Book No.", Book."No.");
    end;
}