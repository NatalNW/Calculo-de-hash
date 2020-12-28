function install-WindowsFeatureInServers {
    param(
        [String[]] $computers,
        [String] $featureName
    )

    $jobScriptBlock = {
        param(
            [String] $computerName,
            [String] $featureName
        )

        install-WindowsFeature -ComputerName $computerName -Name $featureName
    }

    $computers | ForEach-Object {
        Start-Job -Name "JOB_$_" -ScriptBlock $jobScriptBlock -ArgumentList ($_, $featureName)
    }
}