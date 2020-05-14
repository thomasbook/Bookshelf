codeunit 50101 "InstallCode"
{
    Subtype = Install;


    trigger OnInstallAppPerCompany()
    begin
        InsertBook('001', 'The Phoenix Project', 'Gene Kim', 431);
        InsertBook('002', 'Software Estimation', 'Steve McConnell', 308);
        InsertBook('003', 'The Institue', 'Stephen King', 561);
    end;


    trigger OnInstallAppPerDatabase()
    begin

    end;


    procedure InsertBook(BookNo: Code[20]; BookTitle: Text; BookAuthor: text; BookPageCount: Integer)
    var
        Book: Record Book;
    begin
        with book do begin
            if Get(BookNo) then
                exit;

            Init();
            "No." := BookNo;
            Title := BookTitle;
            Author := BookAuthor;
            "Page Count" := BookPageCount;
            Insert(true);
        end;
    end;
}