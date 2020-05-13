page 50101 "BookCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Book;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field("Title"; Title)
                {
                    ApplicationArea = All;
                }
                group(Details)
                {
                    field("Author"; Author)
                    {
                        ApplicationArea = All;
                    }
                    field(Hardcover; Hardcover)
                    {
                        ApplicationArea = All;
                    }
                    field("Page Count"; "Page Count")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}