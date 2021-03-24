pageextension 50000 "Vendor Card" extends "Vendor Card"
{
    layout
    {
        addafter("Post Code")
        {
            part("Maps"; "Maps")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }
}