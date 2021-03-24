function initialize() {
  let root = document.getElementById("controlAddIn");
  let livestream = document.createElement("iframe");
  livestream.id = 'livestreamIframe';
  livestream.height = '100%';
  livestream.width = '100%';
  root.appendChild(livestream);
  InvokeAl();
}

function InvokeAl() {
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
    "OnInvoke",
    [],
    false
  );
}

function OnInvokeResult(Parameters) {
  let livestream = document.getElementById('livestreamIframe');
  livestream.allowFullscreen = Parameters.AllowFullscreen;
  livestream.frameBorder = "0";
  livestream.src = Parameters.Url;
}