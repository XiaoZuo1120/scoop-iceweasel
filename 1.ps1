# Fix text files to ensure they end with a newline and have no UTF-8 BOM
# Supported extensions: .json, .ps1, .md, .txt, .yml, .yaml, .sh, .gitignore

$extensions = @('.json', '.ps1', '.md', '.txt', '.yml', '.yaml', '.sh', '.gitignore')
$files = Get-ChildItem -Recurse -File | Where-Object { $extensions -contains $_.Extension }

$total = $files.Count
$fixed = 0
$index = 0

Write-Host "Scanning and fixing text files to ensure they end with a newline..." -ForegroundColor Cyan
Write-Host ""

foreach ($file in $files) {
    $index++
    $pad = "   "
    if ($index -ge 10) { $pad = "  " }
    if ($index -ge 100) { $pad = " " }
    if ($index -ge 1000) { $pad = "" }

    Write-Host "$pad$index`: Checking $($file.Name)"

    try {
        $path = $file.FullName
        $bytes = [System.IO.File]::ReadAllBytes($path)

        # Skip empty files
        if ($bytes.Count -eq 0) {
            continue
        }

        # Remove UTF-8 BOM (EF BB BF)
        if ($bytes.Count -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
            $bytes = $bytes[3..($bytes.Count - 1)]
        }

        # Check if ends with LF (0x0A)
        $endsWithNewline = ($bytes.Count -ge 1 -and $bytes[-1] -eq 0x0A)

        if (-not $endsWithNewline) {
            # Append LF (Unix-style newline, accepted by Scoop tests)
            $bytes += 0x0A
            [System.IO.File]::WriteAllBytes($path, $bytes)
            $fixed++
        }
    }
    catch {
        Write-Host "    [SKIPPED] $($file.Name) - $($_.Exception.Message)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Done. Processed $total files, fixed $fixed files." -ForegroundColor Green
Write-Host "All text files now end with a newline and have no UTF-8 BOM."
