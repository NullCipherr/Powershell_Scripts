
# Message()
function Message{
	
	param(
		[string]$Color,
		[string]$Text
	)

	switch ($Color){
			"vermelho" { $ColorCode = "Red" }
			"verde" { $ColorCode = "Green" }
			"amarelo" { $ColorCode = "Yellow" }
			"azul" { $ColorCode = "Blue" }
			"default" { $ColorCode = "White" }
		}

		Write-Host $Text -ForegroundColor $ColorCode

	}

function Backup-Directory {
    param (
        [string]$Directory
    )

    $DirectoryName = Split-Path $Directory -Leaf
    $ActualDate = Get-Date -Format "yyyyMMdd"
    $Archive = "$PWD\$DirectoryName-$ActualDate.zip"

    # Compacta o diretório em um arquivo zip
    Compress-Archive -Path $Directory -DestinationPath $Archive

    # Realiza a impressão da mensagem de sucesso e o nome do arquivo compactado.
    Message -Color "verde" -Text "`nO backup de $Directory foi realizado com sucesso!!"
    Message -Color "verde" -Text "`nO arquivo foi salvo como -> $Archive em $PWD\n"
}

function Start-Backup {
    Message -Color "azul" -Text "`nInsira o nome do diretório"
    Message -Color "azul" -Text "`nDiretórios: Documentos, Downloads, Imagens ..."
    $Directory = Read-Host -Prompt "`n> "

    # Concatena o diretório pessoal com o nome do diretório
    $Directory = "$HOME\$Directory"

    # Verifica se o caminho é um diretório válido
    if (Test-Path $Directory -PathType Container) {
        Message -Color "verde" -Text "`n Inicializando o backup do diretório ..."
        Backup-Directory -Directory $Directory
    } else {
        # Imprime uma mensagem de erro
        Message -Color "vermelho" -Text "`nO caminho $Directory não é um diretório válido. Tente novamente.\n"
    }
}

Start-Backup
