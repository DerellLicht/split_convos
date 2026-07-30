::  This will be an example file that demonstrates flow-control options
::  To see An A-Z Index of Windows CMD commands, visit:
::  https://ss64.com/nt/

@if /I "%~1"=="build" goto :build_init
@if /I "%~1"=="clean" goto :clean

:usage
   @echo USAGE:
   @echo     build [build <convo_filename>.json] [clean]
   @echo.
   @echo ARGUMENTS
   @echo    build - run build command 
   @echo    clean - run clean command
   @echo.
   @echo    Either build or clean are required
   @echo.
   @echo    Example: 
   @echo    build build 
   @goto :eof

:build_init
   @if /I "%~2"=="" goto :usage
   @rem this will build the target
   python split_convos.py %2
   del *6_Untitled_conversation.md
   @goto :eof

:clean
   @rem this is equivalent to 'make clean'
   del *.md *.svg
   @goto :eof






