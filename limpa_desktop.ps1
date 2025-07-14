param(
    [string[]] $Keep  # nomes de itens a manter (arquivos/pastas)
)

# Isso aqui serve só pros caracteres saírem certos
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

# Definir pasta-alvo
$desktop = [Environment]::GetFolderPath("Desktop")  # original
#$desktop = "$HOME\Desktop\TesteScript"            # para testes

# Coletar itens
$allItems = Get-ChildItem -Path $desktop

# Filtrar remover e manter
$toRemove = $allItems | Where-Object { -not ($_.Extension -in '.lnk','.url') -and -not ($Keep -contains $_.Name) }
$toKeep   = $allItems | Where-Object {  ($_.Extension -in '.lnk','.url') -or    ($Keep -contains $_.Name) }

if ($allItems.Count -eq 0) {
    Write-Host "Pasta vazia: $desktop"; exit
}

# Listagem colorida
Write-Host ("Itens em " + $desktop + "`n")
$toRemove | ForEach-Object { Write-Host "[REMOVER] $($_.FullName)" -ForegroundColor Red }
$toKeep   | ForEach-Object { Write-Host "[MANTER]  $($_.FullName)" -ForegroundColor Green }

# Confirmação
$resp = Read-Host "Deseja remover todos os itens marcados como [REMOVER]? (S/N)"
if ($resp -notin 'S','s','Y','y') {
    Write-Host "Cancelado. Use: `n";
	Write-Host ".\limpa_desktop.ps1 -Keep 'arquivo_01' 'arquivo_02'`n";
	Write-Host "Para manter alguns arquivos.`n"; exit
}

# Execução
$toRemove | Remove-Item -Force -Recurse
Write-Host "Remoção concluída em $desktop." -ForegroundColor Cyan