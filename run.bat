for /f "tokens=5 delims= " %%a in ('netstat -ano ^| findstr "8091" ^| findstr "LISTENING"') do set pid=%%a
if not "%pid%" == "" (
  taskkill /f /PID %pid%
) else (
  rem echo Server is not running.
)

start /b java -jar d:\deploy\receipt-service-0.0.1-SNAPSHOT.jar
