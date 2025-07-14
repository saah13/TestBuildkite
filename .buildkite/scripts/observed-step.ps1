$Env:BUILD_START = [int](Get-Date -UFormat %s)
$Env:STEP_START = [int](Get-Date -UFormat %s)
$Env:STEP_SPAN_ID = "windows-step"

# Run a traced command using PowerShell
C:\buildevents\buildevents.exe cmd --shell powershell.exe $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID hello -- -Command "echo 'Hello from Buildkite on Windows!'"

# End the step
C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID $Env:STEP_START windows-step

# Finish build and output Honeycomb trace
$traceUrl = C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $Env:BUILD_START success
Write-Output "Honeycomb trace: $traceUrl"
