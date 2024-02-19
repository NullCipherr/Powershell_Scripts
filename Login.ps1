
function Get-Login 
{
    $username = Read-Host "Digite o nome de usuario"
    $password = Read-Host "Digite a senha" -AsSecureString
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
    $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    

    if ($username -eq 'admin' -and $UnsecurePassword -eq 'senha123') 
    {
        Write-Host "Login bem-sucedido ..."
    } else 
    {
        Write-Host "Usuario ou senha incorretos!"
    }
}


Get-Login
