# .buildkite/scripts/trace-install.ps1

$env:BUILD_START = [int](Get-Date -UFormat %s)
$env:STEP_START  = [int](Get-Date -UFormat %s)
$env:STEP_SPAN_ID = "npm-install"

# Wrap npm install with a trace
C:\buildevents\buildevents.exe cmd $Env:BUILDKITE_BUILD_ID $env:STEP_SPAN_ID install -- powershell -Command "npm install"

# Close step span
C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $env:STEP_SPAN_ID $env:STEP_START install

# Close build span
C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $env:BUILD_START success
