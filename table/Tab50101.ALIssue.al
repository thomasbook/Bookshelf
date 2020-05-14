table 50101 "ALIssue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; number; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; title; text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; created_at; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5; User; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; state; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; html_url; text[250])
        {
            Caption = 'url';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}