# Setup
$buildId = $Env:BUILDKITE_BUILD_ID
$buildStart = [int](Get-Date -UFormat %s)
$projectDir = "$PSScriptRoot\..\.."

# Trace npm install
$span1 = "install"
$start1 = [int](Get-Date -UFormat %s)
C:\buildevents\buildevents.exe cmd --shell powershell.exe $buildId $span1 "npm install" -- -Command "cd '$projectDir' && npm install"
C:\buildevents\buildevents.exe step $buildId $span1 $start1 install

# Trace npm run build
$span2 = "build"
$start2 = [int](Get-Date -UFormat %s)
C:\buildevents\buildevents.exe cmd --shell powershell.exe $buildId $span2 "npm run build" -- -Command "cd '$projectDir' && npm run build"
C:\buildevents\buildevents.exe step $buildId $span2 $start2 build

# Trace npm test
$span3 = "test"
$start3 = [int](Get-Date -UFormat %s)
C:\buildevents\buildevents.exe cmd --shell powershell.exe $buildId $span3 "npm test" -- -Command "cd '$projectDir' && npm test"
C:\buildevents\buildevents.exe step $buildId $span3 $start3 test

# End of trace
$traceUrl = C:\buildevents\buildevents.exe build $buildId $buildStart success
Write-Host "Trace uploaded: $traceUrl"
