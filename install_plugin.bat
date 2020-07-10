@ECHO OFF

set ver=1.8.0
set local=%CD%
set x64=%local%\%ver%\x64
set x86=%local%\%ver%\x86

cd %appdata%\Mozilla\Firefox\Profiles\*.default\
mkdir gmp-gmpopenh264\%ver%

if exist "%ProgramFiles(x86)%" (
	copy %x64%\gmpopenh264.dll .\gmp-gmpopenh264\%ver%\
	copy %x64%\ .\gmp-gmpopenh264\%ver%\
) else (
	copy %x86%\gmpopenh264.dll .\gmp-gmpopenh264\%ver%\
	copy %x64%\ .\gmp-gmpopenh264\%ver%\
)

cd %appdata%\Mozilla\Firefox\Profiles\*.default-release*\
echo %CD%

echo user_pref("media.gmp-gmpopenh264.version", "%ver%") >> prefs.js

echo done.
