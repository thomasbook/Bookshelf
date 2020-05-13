pageextension 50100 "CustomerBookExt" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Dyn Favorite Book No."; "Dyn Favorite Book No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}