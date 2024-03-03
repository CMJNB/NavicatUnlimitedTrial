@echo off
setlocal enabledelayedexpansion
set dn=Info
set dn2=ShellFolder
set rp=HKEY_CURRENT_USER\Software\Classes\CLSID

echo reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration14XCS /f
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration14XCS /f

echo reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration16XCS /f
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration16XCS /f

echo reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update /f
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update /f

echo finding %rp%\{xxx-xxx-xxx-xxx}\%dn%
for /f %%i in ('reg query %rp% /s /e /f "%dn%" ^| findstr \%dn%') do (
    set "VAR=%%i"
    set "VAR=!VAR:%dn%=!"
    echo reg delete !VAR! /f
    reg delete !VAR! /f

)
echo finding %rp%\{xxx-xxx-xxx-xxx}\%dn2%
for /f %%i in ('reg query %rp% /s /e /f "%dn2%" ^| findstr \%dn2%') do (
    set "VAR=%%i"
    set "VAR=!VAR:%dn2%=!"
    echo reg delete !VAR! /f
    reg delete !VAR! /f

)
endlocal