# Get current connection profile from available source.

$NetConnectionProfile = (Get-NetConnectionProfile).Name

If ($NetConnectionProfile) {} Else {

    netsh wlan delete filter permission=denyall networktype=infrastructure

    netsh wlan show networks

    Read-Host

    Exit

}

# trust-connection

netsh wlan add filter permission=allow ssid=$NetConnectionProfile networktype=infrastructure

# block-connection

netsh wlan add filter permission=denyall networktype=infrastructure

#

Clear-Host

# showing current condition

Write-Host `n ssid : $NetConnectionProfile "was selected." `n

Read-Host