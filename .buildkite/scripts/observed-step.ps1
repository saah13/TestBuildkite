$Env:BUILD_START = [int](Get-Date -UFormat %s)
$Env:STEP_START = [int](Get-Date -UFormat %s)
$Env:STEP_SPAN_ID = "windows-step"

# Use --shell to force PowerShell
C:\buildevents\buildevents.exe cmd --shell "powershell.exe -Command" $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID hello -- echo "Hello from Buildkite on Windows!"

C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID $Env:STEP_START windows-step

$traceUrl = C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $Env:BUILD_START success
Write-Output "🔍 Honeycomb trace: $traceUrl"
