function Get-FileSHA1($filePath) {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha = New-Object System.Security.Cryptography.SHA1Managed
    $hash = $sha.ComputeHash($fileBytes)

    $hexaHash = New-Object System.Text.StringBuilder

    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $hexaHash.Append($hexaNotation) > $null
    }

    return $hexaHash.ToString()
}
function Get-FileSHA256() {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha = New-Object System.Security.Cryptography.SHA256Managed
    $hash = $sha.ComputeHash($fileBytes)

    $hexaHash = New-Object System.Text.StringBuilder

    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $hexaHash.Append($hexaNotation) > $null
    }

    return $hexaHash.ToString()
}
function Get-FileSHA384() {

}
function Get-FileSHA512() {

}

# $file = "C:\Users\natanael.weslley\Desktop\Calculo-de-hash\ShaFile.ps1"
# $hashFile = Get-FileSHA1 $file


# Write-Host $hashFile -BackgroundColor Red -ForegroundColor Yellow
