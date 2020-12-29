function Add-ApplicationPool {
    param (
        [String[]] $computersName,
        [String] $applicationPoolName
    )

    $sessions = $computersName | ForEach-Object { New-PSSession -ComputerName $_ }
    $jobs = $sessions | ForEach-Object {
        Invoke-Command -Session $_ -ScriptBlock {
            $appCmdArgs = "add apppool /name:$($args[0]) /managedRunTimeVersion:v4.0 /managedPipelineMode:Integrated"
            C:\Windows\System32\inetsrv\appcmd.exe $appCmdArgs.Split(' ')
        } -ArgumentList $applicationPoolName -AsJob
    }

    $computersName 

    $jobs | Wait-Job | Select-Object @{Exepression = { Receive-Job $_ }; Label = "Resultado" }, "Name"
    $jobs | Remove-Job
    $sessions | Remove-PSSession
}