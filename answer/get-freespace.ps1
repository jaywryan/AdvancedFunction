Function {
	Param (
		[string]$Computername=localhost,
		[int]$percentfree=10
		)
	
	$disks = Get-WmiObject -ComputerName $Computername -Class Win32_logicaldisk -Filter "Drivetype=3"

	foreach ($disk in $disks){
		$free = ($disk.FreeSpace/$disk.Size)*100
		if ($free -ge $percentfree){
			$OK = $true
		}else{
			$OK = $false
			$disk | select deviceid,volumename,size,freespace,@{Name="OK";Expression={$OK}}
		}

	}

}
