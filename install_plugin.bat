@ECHO OFF

set ver=1.8.0
set local=%CD%
set x64=%local%\openh264_%ver%\x64
set x86=%local%\openh264_%ver%\x86

cd /d %appdata%\Mozilla\Firefox\Profiles\*.default-release*\ > nul 2>&1
if errorlevel 1 cd /d %appdata%\Mozilla\Firefox\Profiles\*.default\ > nul 2>&1

mkdir gmp-gmpopenh264\%ver% > nul 2>&1

if exist "%ProgramFiles(x86)%" (
	copy %x64%\gmpopenh264.dll .\gmp-gmpopenh264\%ver%\ > nul 2>&1
	copy %x64%\ .\gmp-gmpopenh264\%ver%\ > nul 2>&1
) else (
	copy %x86%\gmpopenh264.dll .\gmp-gmpopenh264\%ver%\ > nul 2>&1
	copy %x86%\ .\gmp-gmpopenh264\%ver%\ > nul 2>&1
)

echo user_pref("media.gmp-gmpopenh264.lastUpdate", 1578389816); >> prefs.js
echo user_pref("media.gmp-gmpopenh264.version", "%ver%"); >> prefs.js
