page 50001 "Livestream"
{
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            usercontrol(Livestream; LivestreamAddin)
            {
                ApplicationArea = All;

                trigger OnControlReady()
                begin
                end;

                trigger OnInvoke()
                var
                    LivestreamSetup: Record "Livestream Setup";
                    Parameters: JsonObject;
                begin
                    LivestreamSetup.Instantiate();
                    Parameters := LivestreamSetup.BuildJsonObject();
                    CurrPage.Livestream.OnInvokeResult(Parameters);
                end;
            }
        }
    }
}