page 50003 "Livestream Setup"
{
    Caption = 'Livestream Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Livestream Setup";

    layout
    {
        area(Content)
        {
            field("Livestream URL"; Rec."Livestream URL")
            {
                ApplicationArea = All;
                ToolTip = 'URL for video to be played in livestream';
            }
            field(Autoplay; Rec.Autoplay)
            {
                ApplicationArea = All;
                ToolTip = 'Autoplay when livestream loads';
            }
            field("Show Controls"; Rec."Show Controls")
            {
                ApplicationArea = All;
                ToolTip = 'Show YouTube controls for livestream';
            }
            field(Mute; Rec.Mute)
            {
                ApplicationArea = All;
                ToolTip = 'Start livestream muted';
            }
            field("Allow Fullscreen"; Rec."Allow Fullscreen")
            {
                ApplicationArea = All;
                ToolTip = 'Allow fullscreen video';
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Instantiate();
    end;
}