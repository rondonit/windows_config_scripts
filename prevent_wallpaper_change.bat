@echo off
setlocal

echo .
echo [PT] Verificando privilégios de administrador...
echo [EN] Checking administrator privileges...

:: Verifica privilégios de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [PT] Este script requer privilégios de administrador para funcionar.
    echo [EN] This script requires administrative privileges to work.
    echo [PT] Execute como administrador.
    echo [EN] Run as administrator.
    pause
    exit /b 1
)

echo [PT] Aplicando política para impedir alteração do papel de parede...
echo [EN] Applying policy to prevent desktop background changes...

:: Cria chave de registro para o usuário atual se ela não existir
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f
:: Bloqueia alteração de wallpaper para o usuário atual (não requer administrador)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v NoChangingWallpaper /t REG_DWORD /d 1 /f >nul 2>&1

:: Cria chave de registro para todos os usuários se ela não existir
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f
:: Bloqueia alteração de wallpaper para todos os usuários (requer administrador)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v NoChangingWallpaper /t REG_DWORD /d 1 /f >nul 2>&1

echo [PT] Política aplicada com sucesso.
echo [EN] Policy applied successfully.
echo [PT] Nota: Você pode precisar reiniciar ou logar novamente para que as mudanças tenham efeito.
echo [EN] Note: You may need to restart or log out and back in for changes to take effect.
pause
