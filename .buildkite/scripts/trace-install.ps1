# .buildkite/scripts/trace-install.ps1

$env:BUILD_START = [int](Get-Date -UFormat %s)
$env:STEP_START  = [int](Get-Date -UFormat %s)
$env:STEP_SPAN_ID = "npm-install"

# ✅ Correct usage: run actual command directly
C:\buildevents\buildevents.exe cmd $Env:BUILDKITE_BUILD_ID $env:STEP_SPAN_ID npm-install -- npm install

# ✅ End span and build
C:\buildevents\buildevents.exe step $Env:BUILDKITE_BUILD_ID $env:STEP_SPAN_ID $env:STEP_START npm-install
C:\buildevents\buildevents.exe build $Env:BUILDKITE_BUILD_ID $env:BUILD_START success
