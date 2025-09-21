# rollback.ps1
# Script para desplegar y restaurar rollback en caso de fallo

# 1. Respaldar versión actual
if (Test-Path deploy\test) {
    if (Test-Path deploy\backup) { Remove-Item deploy\backup -Recurse -Force }
    Rename-Item deploy\test backup
}

# 2. Crear nuevo despliegue
New-Item -ItemType Directory -Force -Path deploy\test
Copy-Item -Path target\*.jar -Destination deploy\test\app.jar -Force
"Deploy date: $(Get-Date)" | Out-File -FilePath deploy\test\version.txt -Encoding utf8
git rev-parse --short HEAD | Out-File -FilePath deploy\test\version.txt -Append -Encoding utf8

# 3. Simulación de fallo -> restaurar backup
$fail = $false   # cambia a $true para probar el rollback
if ($fail) {
    Write-Host "❌ FALLO DEPLOY - restaurando versión previa..."
    if (Test-Path deploy\backup) {
        if (Test-Path deploy\test) { Remove-Item deploy\test -Recurse -Force }
        Rename-Item deploy\backup test
    }
}
