# jdgregson - 2017
# http://stackoverflow.com/questions/34447793

#get paramaters
 param (
    [string]$search = ""
 );
 $googleURL = "https://www.google.com/search" +
              "?&source=jdgregson-powershell-google&q=";

function _help {
    "Usage: google 'any text at all'" +
    "`n`nQuotes are optional`n";
    exit;
}

if($search -eq "") {
    _help;
} else {
    ForEach($word in $args) {$search+=" $word"};
    [Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
    $URL = $googleURL + [System.Web.HttpUtility]::UrlEncode("$search");
    start "$URL";
}
