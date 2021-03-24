controladdin "LivestreamAddin"
{
    RequestedHeight = 315;
    RequestedWidth = 560;
    Scripts = 'src\Livestream\scripts\livestream.js';
    StyleSheets = 'src\Livestream\scripts\style.css';
    StartupScript = 'src\Livestream\scripts\start.js';

    event OnControlReady()
    event OnInvoke()
    procedure OnInvokeResult(Parameters: JsonObject)
}