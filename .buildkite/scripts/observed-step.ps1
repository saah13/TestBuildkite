$buildId = $Env:BUILDKITE_BUILD_ID
$buildStart = [int](Get-Date -UFormat %s)
$projectDir = "C:\buildkite-agent\builds\Agent1\larchi\starter"

# npm install
$span1 = "install"
$start1 = [int](Get-Date -UFormat %s)
C:\buildevents\buildevents.exe cmd --shell powershell.exe $buildId $span1 install -- -Command "cd $projectDir; npm install"
C:\buildevents\buildevents.exe step $buildId $span1 $start1 install

# npm run build
$span2 = "build"
$start2 = [int](Get-Date -UFormat %s)
C:\buildevents\buildevents.exe cmd --shell powershell.exe $buildId $span2 build -- -Command "cd $projectDir; npm run build"
C:\buildevents\buildevents.exe step $buildId $span2 $start2 build

# npm test
$span3 = "test"
$start3 = [int](Get-Date -UFormat %s)
C:\buildevents\buildevents.exe cmd --shell powershell.exe $buildId $span3 test -- -Command "cd $projectDir; npm test"
C:\buildevents\buildevents.exe step $buildId $span3 $start3 test

# Finish trace
$traceUrl = C:\buildevents\buildevents.exe build $buildId $buildStart success
Write-Host "Trace uploaded: $traceUrl"
