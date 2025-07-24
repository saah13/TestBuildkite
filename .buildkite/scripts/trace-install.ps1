$buildId = $env:BUILDKITE_BUILD_ID
$spanId = "npm-install"
$start = [int](Get-Date -UFormat %s)

Write-Host "📦 Running npm install with buildevents..."

& "C:\buildevents\buildevents.exe" cmd --shell powershell.exe $buildId $spanId $spanId -- -Command "cd C:\buildkite-agent\builds\Agent1\larchi\starter; npm install"

Write-Host "✅ Finished install, sending step event..."

& "C:\buildevents\buildevents.exe" step $buildId $spanId $start $spanId
