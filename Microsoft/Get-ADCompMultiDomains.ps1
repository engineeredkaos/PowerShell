$ADs = "172.16.1.60","10.50.0.24", "10.160.2.244", "10.50.0.23"

foreach ($AD in $ADs) {

    $Comps = Get-ADComputer -Filter * -Properties * -Server $AD | Select-Object Name,DNSHostName,OperatingSystem,IPv4Address,LastLogonDate | Sort OperatingSystem,LastLogonDate,DNSHostName

    $Report += $Comps
}

$Report | Export-CSV C:\Users\%user%\Desktop\ADReport.csv
