**Port group check script. Execute it in vmWare PowerCLI


Connect-VIServer -Server <vcenter>
foreach ($switch in $switches)
{
get-vdsecuritypolicy -vdswitch $switch.name | out-file output.txt -append
$portgroups=get-vdportgroup -vdswitch $switch.name
write-host $portgroups
$portgroupname=$portgroups.name
foreach ($port in $portgroupname)
{
get-vdsecuritypolicy -vdportgroup $port | out-file output.txt -append
}
}
