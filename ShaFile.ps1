function Get-FileSHA1($filePath){
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha = New-Object System.Security.Cryptography.SHA1Managed
    $hash = $sha.ComputeHash($fileBytes)

    Write-Host $hash -BackgroundColor Red -ForegroundColor Yellow
}
function Get-FileSHA256(){

}
function Get-FileSHA384(){

}
function Get-FileSHA512(){

}

Get-FileSHA1 C:\Users\natanael.weslley\Desktop\ShaFile.ps1

