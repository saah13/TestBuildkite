$Env:BUILD_START = [int](Get-Date -UFormat %s)
$Env:STEP_START = [int](Get-Date -UFormat %s)
$Env:STEP_SPAN_ID = "windows-step"

# Run the command traced by buildevents using PowerShell
C:\buildevents\buildevents.exe cmd --shell powershell.exe $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID hello -- -Command "Write-Host 'Hello from Buildkite on Windows!'"

# Close the step
C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID $Env:STEP_START windows-step

# Complete build and print Honeycomb trace link
$traceUrl = C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $Env:BUILD_START success
Write-Host "✅ Honeycomb trace: $traceUrl"
