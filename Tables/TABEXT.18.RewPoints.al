tableextension 50100 MyExtension extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100;RewardPoints;Integer)
        {
            MinValue = 0;
        }
    }
    
    var
        myInt: Integer;
}