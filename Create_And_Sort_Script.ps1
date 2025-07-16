
#Variables
$dest = 'C:\Destination\'
$sour = 'C:\SourceEnd\'

# Ensure destination folders exist
$exist = Test-Path $dest

if( $exist -eq $false)
{
 New-Item -Path ($dest + 'Docs') -ItemType Directory 

 New-Item -Path ($dest + 'Images') -ItemType Directory 

}
#creating the array 
$filestosort =Get-ChildItem -Path $sour

#copying and filtering the files
foreach($item in $filestosort)
{
#filtering the images
if($item.Extension -eq '.bmp')
{
 
  $destdoc = $dest + 'Images'
Copy-Item -path $item.FullName -Destination $destdoc


}
#Filtering the documents
elseif($item.Extension -eq '.txt' -or $item.Extension -eq '.docx')

{


 $destdoc = $dest + 'Docs'
Copy-Item -path $item.FullName -Destination $destdoc


}
}


