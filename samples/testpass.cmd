set BFLAT_REF=C:\git\runtime\artifacts\bin\ref\net6.0
set BFLAT_LIB=C:\git\runtime\artifacts\bin\ILLinkTrimAssembly\net6.0-windows-Release-x64\trimmed-runtimepack;C:\git\runtime\artifacts\bin\coreclr\windows.x64.Release\aotsdk;C:\Interesting\lib
set BFLAT_LD=C:\Interesting\lld-link\lld.exe

set BFLAT=C:\git\runtime\artifacts\bin\coreclr\windows.x64.Release\ilc\net5.0\cscn.exe
set BFLAGS=--verbose

pushd HelloWorld
call test.cmd
popd
if ERRORLEVEL 1 exit /b 1
