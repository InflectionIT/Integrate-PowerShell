param([string]$firstName, [string]$lastName, [string]$email)

$ruleId = 1356
$config = Get-Content -Raw -Path "config.json" | ConvertFrom-Json

$headers = New-Object 'System.Collections.Generic.Dictionary[[String],[String]]'
$headers.Add('IntegrateAuthenticationToken', $config.Token)
$headers.Add('Content-Type', 'application/json')
$headers.Add('Accept', 'application/json')

function ExecuteRule([int]$ruleId, [string]$body) { 
    return Invoke-RestMethod https://$($config.Server)/api/v1/rules/$ruleId/execution -SkipCertificateCheck -Method Post -Headers $headers -Body $body
}

function CheckExecutionStatus([string]$corId) {
    return Invoke-RestMethod https://$($config.Server)/api/v1/rules/execution/$corId -SkipCertificateCheck -Method Get -Headers $headers -Body $body
}

#Convert inputs to JSON
$inputs = @()
$inputs += [pscustomobject]@{
    name  = "FirstName";
    value = $firstName;
}
$inputs += [PSCustomObject]@{
    name  = "LastName";
    value = $lastName;
}
$inputs += [PSCustomObject]@{
    name  = "Email";
    value = $email;
}

$input = @{
    inputs = $inputs
}

$json = $input | ConvertTo-Json

$results = ExecuteRule -ruleId $ruleId -body $json
if ($results.correlation_id) {
    Write-Host "Your information has been submitted. Waiting for result"
    do {
        $status = CheckExecutionStatus -corId $results.correlation_id
        if ($status.execution_status -eq "FINISHED") {
            if ($status.result_status -ne "OK") {
                Write-Host "The rule generated a warning or error. Please check the Integrate logs for further information"
            }
            else {
                $output = $status.outputs[0].content
                Write-Host "Result: " $output
            }
        }
        Start-Sleep 1
    }

    while ($status.execution_status -ne "FINISHED")
}

