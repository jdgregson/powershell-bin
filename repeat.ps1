# jdgregson - 2016

#get paramaters
 param (
    [string]$command = "",
    [string]$count = 0
 );


function _help {
    "Usage: repeat 'command args' [0-9]";
    exit;
}

if($command -eq "" -Or $count -eq "") {
    _help;
}
if($count -ne 0) {
    $count = -1 + $count;
}
for($i=0; $i -le $count; $i++) {
    Invoke-Expression "$command";
    if($count -eq 0) {
        $i--;
    }
}