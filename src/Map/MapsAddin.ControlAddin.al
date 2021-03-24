controladdin "MapsAddin"
{
    RequestedHeight = 500;
    MinimumHeight = 300;
    MaximumHeight = 700;
    RequestedWidth = 500;
    MinimumWidth = 300;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'src\Map\scripts\Map.js';
    StyleSheets = 'src\Map\scripts\style.css';
    StartupScript = 'src\Map\scripts\start.js';
    RecreateScript = 'src\Map\scripts\recreate.js';
    RefreshScript = 'src\Map\scripts\refresh.js';

    event OnControlReady()

    procedure embedMap(Address: Text)

    procedure ShowAddress()
}