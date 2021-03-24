page 50000 "Maps"
{
    PageType = CardPart;
    SourceTable = Vendor;

    layout
    {
        area(Content)
        {
            usercontrol(Maps; MapsAddin)
            {
                ApplicationArea = All;

                trigger OnControlReady()
                begin
                    CurrPage.Maps.embedMap(Rec.Address);
                end;
            }
        }
    }
}