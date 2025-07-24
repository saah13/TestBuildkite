# trace-install.ps1
$buildId = $Env:BUILDKITE_BUILD_ID
$traceparent = $Env:TRACEPARENT

if ($traceparent) {
    $parts = $traceparent -split '-'
    $traceId = $parts[1]
    $parentSpanId = $parts[2]
} else {
    $traceId = "00000000000000000000000000000000"
    $parentSpanId = "0000000000000000"
}

$spanId = "npm-install"
$start = [int](Get-Date -UFormat %s)

# Run the command
C:\buildevents\buildevents.exe cmd `
  $buildId `
  $spanId `
  "npm install" -- `
  powershell.exe -Command "cd C:\buildkite-agent\builds\Agent1\larchi\starter; npm install"

# Finalize span
C:\buildevents\buildevents.exe step $buildId $spanId $start $spanId
