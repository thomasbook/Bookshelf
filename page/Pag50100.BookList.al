page 50100 "Book List"
{
    Caption = 'Books';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Book;
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Title)
                {
                    ApplicationArea = All;
                }
                field(Author; Author)
                {
                    ApplicationArea = All;
                }
                field("Page Count"; "Page Count")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(RunWrapper)
            {
                Caption = 'Run .Net Wrapper';
                ApplicationArea = All;
                Image = BOMRegisters;
                RunObject = codeunit DotNetWrappers;
            }
        }
    }
}