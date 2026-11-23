param(
    [string]$ZipName = "ElKingTech_Module_v1.0.0.zip"
)

$ErrorActionPreference = 'Stop'

$srcDir = Join-Path $PSScriptRoot 'module_src'
$outZip = Join-Path $PSScriptRoot $ZipName

if (-not (Test-Path (Join-Path $srcDir 'module.prop'))) {
    Write-Error "Falta module.prop en $srcDir"
    exit 1
}

# Validacion automatica anti-bootloop antes de empaquetar
$propContent = Get-Content (Join-Path $srcDir 'module.prop') -Raw
if ($propContent -notmatch '(?m)^id=[a-z0-9_]+$') {
    Write-Error "El campo id= en module.prop solo puede usar minusculas, numeros y guiones bajos."
    exit 1
}

$sysPropPath = Join-Path $srcDir 'system.prop'
if (Test-Path $sysPropPath) {
    $activeProps = (Get-Content $sysPropPath | Where-Object { $_ -notmatch '^\s*#' }) -join "`n"
    if ($activeProps -match '(?m)^\s*ro\.product\.') {
        Write-Error "BLOQUEADO: system.prop contiene ro.product.* (causa fallos de camara y soft-bootloops)."
        exit 1
    }
}

$shFiles = Get-ChildItem -Path $srcDir -Filter '*.sh' -Recurse -File
foreach ($sh in $shFiles) {
    $activeSh = (Get-Content $sh.FullName | Where-Object { $_ -notmatch '^\s*#' }) -join "`n"
    if ($activeSh -match 'chattr\s+\+i|chmod\s+000|rm\s+-rf\s+/data/fonts|pm\s+disable') {
        Write-Error "BLOQUEADO: $($sh.Name) contiene comandos destructivos persistentes en /data."
        exit 1
    }
}

if (Test-Path $outZip) {
    Remove-Item $outZip -Force
}

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$zip = [System.IO.Compression.ZipFile]::Open($outZip, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    $files = Get-ChildItem -Path $srcDir -Recurse -File
    foreach ($file in $files) {
        $relPath = $file.FullName.Substring($srcDir.Length + 1).Replace('\', '/')
        $ext = $file.Extension.ToLowerInvariant()

        if ($ext -in @('.sh', '.prop')) {
            $text = [System.IO.File]::ReadAllText($file.FullName).Replace("`r`n", "`n")
            $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($text)
            $entry = $zip.CreateEntry($relPath, [System.IO.Compression.CompressionLevel]::Optimal)
            $stream = $entry.Open()
            try {
                $stream.Write($bytes, 0, $bytes.Length)
            } finally {
                $stream.Dispose()
            }
        } else {
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
                $zip, $file.FullName, $relPath, [System.IO.Compression.CompressionLevel]::Optimal
            ) | Out-Null
        }
    }
} finally {
    $zip.Dispose()
}

Write-Host "ZIP seguro generado correctamente: $outZip"
