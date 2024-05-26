Clear-Host

$pattern = "autoclick, nitr0, undisputed, cnd, horion, injector, invalid"

Get-ChildItem -Recurse | ForEach-Object {
    Select-String -Pattern $pattern -Path $_.FullName | ForEach-Object {
        [PSCustomObject]@{
            Path        = $_.Path
            Placeholder = $_.Matches[0].Value
            LineNumber  = $_.LineNumber
            Line        = $_.Line
            Pattern     = $pattern
            Context     = $_.Context.PreContext + $_.Context.PostContext
            Matches     = $_.Matches.Value
        }
    }
} | Out-GridView
