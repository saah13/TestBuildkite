$Env:BUILD_START = [int](Get-Date -UFormat %s)
$Env:STEP_START = [int](Get-Date -UFormat %s)
$Env:STEP_SPAN_ID = "windows-step"

# Run a traced command using PowerShell as the shell
C:\buildevents\buildevents.exe cmd --shell "powershell.exe -Command" $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID hello -- echo "Hello from Buildkite on Windows!"

# Mark end of step
C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID $Env:STEP_START windows-step

# Mark end of build and capture trace URL
$traceUrl = C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $Env:BUILD_START success

# Output the trace URL correctly
Write-Output "Honeycomb trace: $traceUrl"
