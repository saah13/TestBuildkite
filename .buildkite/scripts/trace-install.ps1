$env:BUILD_START = [int](Get-Date -UFormat %s)
$env:STEP_START = [int](Get-Date -UFormat %s)
$env:STEP_SPAN_ID = "npm-install"

# Run traced command
C:\buildevents\buildevents.exe cmd `
  $env:BUILDKITE_BUILD_ID `
  $env:STEP_SPAN_ID `
  npm-install `
  -- cmd /c "cd C:\buildkite-agent\builds\Agent1\larchi\starter && npm install"

# End span and build
C:\buildevents\buildevents.exe step $env:BUILDKITE_BUILD_ID $env:STEP_SPAN_ID $env:STEP_START npm-install
C:\buildevents\buildevents.exe build $env:BUILDKITE_BUILD_ID $env:BUILD_START success
