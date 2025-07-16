$dest = 'C:\Destination\'
$sour = 'C:\soruceend\'

$exist = Test-Path $dest

if( $exist -eq $false)
{
 New-Item -Path ($dest + 'Docs') -ItemType Directory 

 New-Item -Path ($dest + 'Images') -ItemType Directory 

}

$filestosort =Get-ChildItem -Path $sour

foreach($item in $filestosort)
{
if($item.Extension -eq '.bmp')
{

  $destdoc = $dest + 'Images'
Copy-Item -path $item.FullName -Destination $destdoc


}

elseif($item.Extension -eq '.txt' -or $item.Extension -eq '.bmp')

{


 $destdoc = $dest + 'Docs'
Copy-Item -path $item.FullName -Destination $destdoc


}
}

#way 1

#$pathcopy = $sour + $item.name
#Copy-Item -path $pathcopy -Destination $dest

 #way 2
#Copy-Item -path $item.FullName -Destination $dest



