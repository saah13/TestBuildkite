@echo off
setlocal enabledelayedexpansion

REM Collect metadata
set BUILD_ID=%BUILDKITE_BUILD_ID%
set STEP_ID=%BUILDKITE_STEP_ID%
set TRACEPARENT=%TRACEPARENT%
set TRACE_ID=00000000000000000000000000000000
set PARENT_SPAN_ID=0000000000000000

REM Parse TRACEPARENT into TRACE_ID and PARENT_SPAN_ID if available
for /f "tokens=2,3 delims=-" %%a in ("%TRACEPARENT%") do (
  set TRACE_ID=%%a
  set PARENT_SPAN_ID=%%b
)

set SPAN_ID=npm-install
set START_TS=%DATE% %TIME%

REM Trace command
echo 📦 Running npm install with buildevents...
"C:\buildevents\buildevents.exe" cmd --trace-id %TRACE_ID% --parent-id %PARENT_SPAN_ID% --output json %BUILD_ID% %SPAN_ID% "npm install" -- "C:\Program Files\Git\bin\bash.exe" -c "cd $BUILDKITE_BUILD_CHECKOUT_PATH && npm install"

REM Finalize span
echo ✅ Finalizing step...
set /a EPOCH=%TIME:~0,2%*3600 + %TIME:~3,2%*60 + %TIME:~6,2%
"C:\buildevents\buildevents.exe" step %BUILD_ID% %SPAN_ID% %EPOCH% %SPAN_ID%
