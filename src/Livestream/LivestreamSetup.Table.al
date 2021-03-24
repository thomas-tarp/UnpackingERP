table 50000 "Livestream Setup"
{
    Caption = 'Livestream Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "PK"; Code[10])
        {
            Caption = 'PK';
        }
        field(2; "Livestream URL"; Text[2048])
        {
            Caption = 'Livestream URL';

            trigger OnValidate()
            var
                EnterValidUrlErr: Label 'Please enter a valid URL. It must start with https://www.youtube.com/embed/';
            begin
                if not ValidUrl() then
                    Error(EnterValidUrlErr);
            end;
        }
        field(3; "Autoplay"; Boolean)
        {
            Caption = 'Autoplay';

            trigger OnValidate()
            var
                MuteNotEnabledErr: Label 'Autoplay cannot be activated when mute is not enabled.';
            begin
                if Autoplay and not Mute then
                    Error(MuteNotEnabledErr);
            end;
        }
        field(4; "Show Controls"; Boolean)
        {
            Caption = 'Show Controls';
        }
        field(5; "Mute"; Boolean)
        {
            Caption = 'Mute';

            trigger OnValidate()
            begin
                if not Mute then
                    Validate(Autoplay, false);
            end;
        }
        field(6; "Allow Fullscreen"; Boolean)
        {
            Caption = 'Allow Fullscreen';
        }
    }

    keys
    {
        key(PK; "PK")
        {
            Clustered = true;
        }
    }

    procedure Instantiate()
    begin
        if not Get() then begin
            Init();
            Insert();
        end;
    end;

    procedure BuildJsonObject() LivestreamParameters: JsonObject
    begin
        LivestreamParameters.Add('Url', BuildUrl());
        LivestreamParameters.Add('AllowFullscreen', "Allow Fullscreen");
    end;

    local procedure BuildUrl() Url: Text
    var
        ArgumentAdded: Boolean;
    begin
        if not ValidUrl() then
            exit;

        Url := "Livestream URL";

        if Autoplay then
            if ArgumentAdded then
                Url += '&autoplay=1'
            else begin
                Url += '?autoplay=1';
                ArgumentAdded := true;
            end;

        if not "Show Controls" then
            if ArgumentAdded then
                Url += '&controls=0'
            else begin
                Url += '?controls=0';
                ArgumentAdded := true;
            end;

        if Mute then
            if ArgumentAdded then
                Url += '&mute=1'
            else begin
                Url += '?mute=1';
                ArgumentAdded := true;
            end;
    end;

    local procedure ValidUrl(): Boolean
    begin
        if StrPos("Livestream URL", 'https://www.youtube.com/embed/') <> 1 then
            exit(false);
        exit(true);
    end;
}