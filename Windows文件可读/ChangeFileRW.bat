attrib -R ../* /S /D
if ERRORLEVEL 1 (goto :error)

goto :EOF

error:
pause