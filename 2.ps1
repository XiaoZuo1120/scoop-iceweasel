# fix-trailing-whitespace.ps1
# Safely remove trailing whitespace while preserving Chinese characters and other Unicode

$extensions = @('.json', '.yml', '.yaml', '.ps1', '.md', '.txt', '.gitignore')
$files = Get-ChildItem -Recurse -File | Where-Object { $extensions -contains $_.Extension }

$total = $files.Count
$fixed = 0
$index = 0

Write-Host "Scanning and fixing trailing whitespace in text files..." -ForegroundColor Cyan
Write-Host ""

foreach ($file in $files) {
    $index++
    $pad = "   "
    if ($index -ge 10) { $pad = "  " }
    if ($index -ge 100) { $pad = " " }

    $path = $file.FullName

    try {
        # Read file with proper UTF-8 encoding (no BOM)
        $content = [System.IO.File]::ReadAllText($path, [System.Text.UTF8Encoding]::new($false))

        if (-not $content) {
            Write-Host "$pad$index`: SKIPPED empty file $($file.Name)"
            continue
        }

        # Remove trailing whitespace on each line
        $lines = $content -split "`r?`n"
        $newLines = @()
        $changed = $false

        for ($i = 0; $i -lt $lines.Count; $i++) {
            $trimmed = $lines[$i].TrimEnd()
            if ($trimmed -ne $lines[$i]) {
                $changed = $true
            }
            $newLines += $trimmed
        }

        if ($changed) {
            $newContent = $newLines -join "`n"
            # Ensure file ends with newline
            if (-not $newContent.EndsWith("`n")) {
                $newContent += "`n"
            }

            # Write back with UTF-8 without BOM
            $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
            [System.IO.File]::WriteAllText($path, $newContent, $utf8NoBom)

            Write-Host "$pad$index`: FIXED trailing whitespace in $($file.Name)"
            $fixed++
        }
        else {
            Write-Host "$pad$index`: No trailing whitespace in $($file.Name)"
        }
    }
    catch {
        Write-Host "$pad$index`: ERROR processing $($file.Name) - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Done. Processed $total files, fixed $fixed files." -ForegroundColor Green
Write-Host "All files preserved with UTF-8 encoding (no BOM)."
