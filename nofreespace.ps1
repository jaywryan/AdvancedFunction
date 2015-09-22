


#Turn this into an advanced function

# Part 1 - make things Variables turn them into parameters, and make it a working function you could share with your helpdesk

#This script returns a list of all the disks that have less thank 10% freespace from a computer
$disks = Get-WmiObject -ComputerName localhost -Class Win32_logicaldisk -Filter "Drivetype=3"

foreach ($disk in $disks){
    $free = ($disk.FreeSpace/$disk.Size)*100
    if ($free -ge '10'){
        $OK = $true
    }else{
        $OK = $false
        $disk | select deviceid,volumename,size,freespace,@{Name="OK";Expression={$OK}}
    }

}
