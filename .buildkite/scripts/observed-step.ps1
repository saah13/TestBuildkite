$Env:BUILD_START = [int](Get-Date -UFormat %s)
$Env:STEP_START = [int](Get-Date -UFormat %s)
$Env:STEP_SPAN_ID = "windows-step"

# Run a traced command using PowerShell shell explicitly
C:\buildevents\buildevents.exe cmd --shell "powershell.exe -Command" $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID hello -- echo "Hello from Buildkite on Windows!"

# Finish the step
C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID $Env:STEP_START windows-step

# Finish the build and print trace URL
$traceUrl = C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $Env:BUILD_START success
Write-Output "🔍 Honeycomb trace: $traceUrl"
