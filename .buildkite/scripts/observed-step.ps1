# .buildkite/scripts/observed-step.ps1

$Env:BUILD_START = [int](Get-Date -UFormat %s)
$Env:STEP_START = [int](Get-Date -UFormat %s)
$Env:STEP_SPAN_ID = "windows-step"

# Run a traced command
C:\buildevents\buildevents.exe cmd $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID test -- echo "Hello from Buildkite on Windows!"

# Close the step
C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $Env:STEP_SPAN_ID $Env:STEP_START windows-step

# Final build span
C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $Env:BUILD_START success
