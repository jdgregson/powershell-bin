#https://www.reddit.com/r/PowerShell/comments/32orwj/speedtest_via_powershell/

#get paramaters
 param (
    [string]$arg1 = ""
 );

#handle our parameters
$LeadingText = "Downloading...";
$TrailingText = "Mb/s";
switch ($arg1) { 
    "s" {$LeadingText = ""} 
    "silent" {$TrailingText = "";$LeadingText = ""}
    default {}
}

if($LeadingText -ne "") {
    write-host $LeadingText -foreground "blue"
}
$Url = "http://client.akamai.com/install/test-objects/10MB.bin";
$Path = "Out-Null";
$WebClient = New-Object System.Net.WebClient;
$Request = Get-Date;
$Result = "{0:N2} $TrailingText" -f (
    (10 / (Measure-Command {
        $Request=Get-Date; 
        $WebClient.DownloadFile($url, $path);
    }).TotalSeconds)*8
);
write-host $Result -foreground "yellow";