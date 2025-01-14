# desativa login com gerenciador de politicas de grupo:
Write-Host "desativando login em contas microsoft"
$GPOPath = "HKLM:\Software\Policies\Microsoft\Windows\System"
if (!(Test-Path $GPOPath)) {
    New-Item -Path $GPOPath -Force | Out-Null
}
Set-ItemProperty -Path $GPOPath -Name "NoConnectedUser" -Value 3 -Type DWord

# desativa criacao de contas em configuracoes
Write-Host "desativando criacao de contas microsoft"
$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
if (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}
Set-ItemProperty -Path $RegistryPath -Name "NoConnectedUser" -Value 3 -Type DWord

# bloqueia login no registro
Write-Host "bloqueando login no registro"
$BlockPath = "HKLM:\Software\Microsoft\PolicyManager\default\Accounts"
if (!(Test-Path $BlockPath)) {
    New-Item -Path $BlockPath -Force | Out-Null
}
$AllowMSAccountPath = "$BlockPath\AllowMicrosoftAccount"
if (!(Test-Path $AllowMSAccountPath)) {
    New-Item -Path $AllowMSAccountPath -Force | Out-Null
}
Set-ItemProperty -Path $AllowMSAccountPath -Name "value" -Value 0 -Type DWord

# atualiza politicas de grupo
Write-Host "aplicando modificacoes nas politicas de grupo"
gpupdate /force | Out-Null

# Confirmação final
Write-Host "LOGIN BLOQUEADO" -ForegroundColor Green

# desativa hibernacao
Write-Host "Desativando hibernacao"
powercfg -hibernate off

# desativando inicio rapido
Write-Host "Desativando inicio rapido (Fast Startup)"
$FastStartupPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power"
if (!(Test-Path $FastStartupPath)) {
    New-Item -Path $FastStartupPath -Force | Out-Null
}
New-ItemProperty -Path $FastStartupPath -Name "HiberbootEnabled" -Value 0 -PropertyType DWord -Force

# ---
Write-Host "OK!" -ForegroundColor Green