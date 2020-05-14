page 50102 "ALIssueList"
{
    Caption = 'AL Issues';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "AlIssue";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(number; number)
                {
                    ApplicationArea = All;
                }
                field(title; title)
                {
                    ApplicationArea = All;
                }
                field(crated_at; created_at)
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
            action(Refresh)
            {
                Image = Absence;
                Caption = 'Refresh';
                ApplicationArea = All;

                trigger OnAction();
                var
                    RefreshALIssues: Codeunit RefreshALIssues;
                begin
                    RefreshALIssues.Run();
                    CurrPage.Update();
                end;
            }
        }
    }
}