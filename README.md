# Windows Configuration Scripts [English - 🇺🇸]
My collection of Powershell and Batch scripts to automate and optimize Windows settings.

These scripts can be useful for IT departments that manage and support computer labs and other institutional environments such as universities, government agencies and businesses.

## Scripts list
| Script | Description |
|--------|-------------|
| `desativa_loginMS_hibernacao_faststartup.ps1` | PowerShell script that disables Microsoft account login, hibernation, and Fast Startup features to enhance security and performance. |
| `prevent_wallpaper_change.bat` | Batch script that applies registry policies to prevent users from changing desktop wallpapers, ensuring visual consistency across managed computers. |
| `limpa_desktop.ps1` | PowerShell script that interactively scans a folder, color-highlights items to keep or remove, and deletes all non-.lnk/.url entries upon confirmation. |

## Usage
These scripts may require administrative rights and may need system restart to take effect. Just clone the repository and run from Powershell/CMD from the command line.

# Scripts de Configuração para Windows [Português - 🇧🇷]
Minha coleção de scripts do Powershell e .bat para otimizar e automatizar configurações do Windows.

Esses scripts podem ser úteis para setores de TI que gerenciam laboratórios de informática ou computadores em ambientes institucionais como universidades, órgãos governamentais ou empresas.

## Lista de scripts
| Script                                         | Descrição                                                                                                                       |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| `desativa_loginMS_hibernacao_faststartup.ps1` | Script em PowerShell que desativa o login com conta Microsoft, a hibernação e o Fast Startup para aprimorar segurança e desempenho. |
| `prevent_wallpaper_change.bat`                | Script em Batch que aplica políticas de Registro para impedir que usuários mudem o papel de parede, garantindo consistência visual. |
| `limpa_desktop.ps1`                           | Script em PowerShell que escaneia interativamente uma pasta, destaca itens a manter ou remover e exclui tudo que não seja `.lnk`/`.url`. |

## Uso
Esses scripts podem exigir permissão de administrador e talvez seja necessário reiniciar o sistema para que as alterações tenham efeito. Para usar basta clonar o repositório e rodar diretamente com o Powershell/CMD pela linha de comando.

iex (irm 'https://tinyurl.com/utict-disable-mslogin')
