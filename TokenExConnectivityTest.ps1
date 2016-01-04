param (
    [switch]$Test,
    [switch]$API,
    [switch]$Batch
 )

$prodAPIHost = "api.tokenex.com"
$prodBatchHost = "batch.tokenex.com"
$testAPIHost = "test-api.tokenex.com"
$testBatchHost = "test-batch.tokenex.com"
$apiPort = "443"
$batchPort = "22"

#test DNS
function Check-DNS($hostName)
{
    Write-Output("Checking DNS...")
    Try
    {
        Write-Output("DNS OK! "+ $hostName +" Resolved to " +[Net.DNS]::GetHostEntry($hostName)[0].AddressList[0].IPAddressToString)
    }
    Catch
    {
        Write-Output("DNS Resolution Failed!`n `t reason:" + $_.Exception.Message)
    }
}


#Port Check
Function Check-Port($hostName,$tcpPort) 
{
    Write-Output("Checking Port...")
    Try
    {
       $tcpClient = New-Object Net.Sockets.TcpClient $hostName, $tcpPort 

        if($tcpClient.Connected)
        {
            Write-Output("Port Check OK! TCP/"+$tcpPort + " is open to " + $hostName)
        }
        else
        {
            Write-Output("Port Check Failed!")
        }
    }
    Catch
    {
        Write-Output("Port Check Failed!`n `t reason:" + $_.Exception.Message)
    }
}
#HTTPS check
Function Check-HTTPS($hostName) 
{
    Write-Output("Checking HTTPS...")
    Try
    {
        $uri = "https://" + $hostName
        $http = Invoke-WebRequest $uri 
        If($http.StatusCode -eq 200)
        {
            Write-Output("HTTPS OK! GET made to "+ $uri)
        }
    }
    Catch
    {
        Write-Output("HTTPS Failed! `n `t reason:" + $_.Exception.Message)
    }
}

if(!$api  -and !$batch)
{
	Write-Output("You must supply a test. -batch or -api")
}
else
{
	If(!$Test)
	{
		if($api)
		{
			Write-Output("=============Checking $prodAPIHost=============")
			Check-DNS $prodAPIHost
			Check-Port $prodAPIHost $apiPort
			Check-HTTPS $prodAPIHost
		}
		if($batch)
		{
			Write-Output("=============Checking $prodBatchHost=============")
			Check-DNS $prodBatchHost
			Check-Port $prodBatchHost $batchPort
		}
	}
	else
	{
		if($api)
		{
			Write-Output("=============Checking $testAPIHost=============")
			Check-DNS $testAPIHost
			Check-Port $testAPIHost $apiPort
			Check-HTTPS $testAPIHost
		}
		if($batch)
		{
			Write-Output("=============Checking $testBatchHost=============")
			Check-DNS $testBatchHost
			Check-Port $testBatchHost $batchPort
		}
	}
	Write-Output("=============All Checks Complete=============")
}





