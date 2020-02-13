# ********************************************************************************************************************* #
# Get vCenter Server from Text File #
# $date is the variable for the actual date and time #
# $vcname is the variable for the short name of the vCenter and the name of the file #
# $vcsource is the variable for the vCenter object from the text file #
# $myhosts is the variable from the vSphere hosts of the vCenter #
$date = (Get-Date -f "ddMMyyyyhhmmss")
$vcname = Read-Host -Prompt 'Input Name Of Your vCenter Server .txt File'
Connect-VIServer $vcname -User administrator@vsphere.local -Password VMware1!
$vcsource = Get-Content C:\Users\<foldername>\$vcname.txt
$myhosts = Get-Cluster | Get-VMHost | Sort Name
# ********************************************************************************************************************* #
# Loop to collect Advanced Settings of vSphere hosts #
foreach ($myhost in $myhosts)
	{
		Write-Host 'Collecting Advanced Settings of Host' $myhost
		Get-AdvancedSetting -Entity $myhost | Select Name,Value | Sort Name | 
		Export-Csv C:\Users\Administrator.MARCUS-HUELLER\AdvSettings-$myhost-$date.csv -NoTypeInformation -UseCulture
	}
# ********************************************************************************************************************* #
