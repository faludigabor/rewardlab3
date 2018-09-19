table 50100 "Reward Level"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Level; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Minimum Reward Points"; Integer)
        {
            DataClassification = OrganizationIdentifiableInformation;
            MinValue = 0;
            NotBlank = true;
            trigger OnValidate()
            var
                tempPoints: Integer;
                RewardLevel: Record "Reward Level";
            begin
                tempPoints := "Minimum Reward Points";
                RewardLevel.SetRange("Minimum Reward Points", tempPoints);
                if RewardLevel.FindFirst() then
                    Error('Minimum reward points must be unique');
            end;
        }
    }

    keys
    {
        key(PK; Level)
        {
            Clustered = true;
        }
        key(MRP;"Minimum Reward Points")
        {
            Clustered = false ;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Validate("Minimum Reward Points");
    end;

    trigger OnModify()
    begin
        Validate("Minimum Reward Points");
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}