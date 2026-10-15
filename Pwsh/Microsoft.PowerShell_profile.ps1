# Descriptions for your custom commands
$ProfileDescriptions = @{
    'updatescoop' = 'wrapper to update scoop using powershell 5.1'
    'edit' = '!! Not an alias. Microsoft.Edit, windows terminal editor'
    'curl' = 'curl.exe. Pwsh 7 is normal. 5.1 uses some Invoke-WebRequest'
    'bash' = 'Alias to git bash'
    'pskeys' = 'Alias to get psreadlinekeyhandler'
    'profile' = 'Show registered $PROFILE aliases & functions'
    'touch' = 'To create new file like in Linux'
    'psinline' = 'Set psreadline to inline mode'
    'pslistview' = 'Set psreadline to list view mode'
    'which' = 'Get cmd name, type, source; like Linux-ish'
    'nano' = 'technically an alias to Microsoft.Edit thing since I keep mistyping'
    'll' = 'use eza to get detailed dir listing, inc. hidden files, in grid display'
    'tree' = 'use eza to get hierarchical tree of files at chosen path, at select levels defaulting at 2'
    '..' = 'cd ..'
    '...' = 'cd ../..'
    'home' = 'go to home directory'
    'dfh' = 'show disk usage'
    'psg' = 'get process name'
    'killp' = 'kill process <name>'
    'ports' = 'show local ports'
    'myip' = 'invoke req to ipify api to get actual ip address'
    'flushdns' = 'flush the dns cache'
    'pinggg' = 'alternative ping'
    'pingsweep' = 'pwsh 7 only, ping sweep across a chosen subnet (e.g. 172.16.24) from 1-254'
    'rmr' = 'rm -r: Recursive removal'
    'rmrf' = 'rm -rf: Recursive + force removal'
    'rmrfs' = 'rm -rf with suppressed non-terminating errors'
    'verify-devonb' = 'curl.exe wrapper to handle verifying SmartFM ToAI onboarding package'
}

Set-Alias -Name bash -Value "$HOME\scoop\apps\git\current\bin\bash.exe"

Set-Alias -Name pskeys -Value Get-PSReadLineKeyHandler

function profile {
    $ProfileDescriptions.GetEnumerator() |
        ForEach-Object {
            $cmd = Get-Command $_.Key -ErrorAction SilentlyContinue

            if ($cmd) {
                [PSCustomObject]@{
                    Command     = $_.Key
                    Type        = $cmd.CommandType
                    Description = $_.Value
                }
            }
        } |
        Sort-Object Command |
        Format-Table -AutoSize
}

function updatescoop {
    powershell.exe -NoProfile -Command "scoop update '*'"
}

function touch {
    param([string]$File)
    if (Test-Path $File) {
        (Get-Item $File).LastWriteTime = Get-Date
    } else {
        New-Item -ItemType File $File | Out-Null
    }
}

function psinline {
    Set-PSReadLineOption -PredictionViewStyle InlineView
}

function pslistview {
    Set-PSReadLineOption -PredictionViewStyle ListView
}

function which {
    param([string]$Name)
    Get-Command $Name | Select-Object Name, CommandType, Source
}

function nano {
    param([string]$Path=".")
    edit $Path
}

function ll {
    param([string]$Path=".")
    
    # -l = detailed list
    # -a = show hidden files
    # -G = grid pattern (more compact)
    # -o = show octal permissions (unix only)
    eza -laG $Path
}

function tree {
    param(
        [string]$Path = ".",
        [int]$Lvl = 2
    )
    
    # --tree = hierarchical tree structure display
    # --level=2 limit the tree to 2 levels (prevent data flooding)
    eza --tree --level=$Lvl $Path
}

function .. {
    Set-Location ..
}

function ... {
    Set-Location ../..
}

function home {
    Set-Location ~
}

function dfh {
    Get-Volume |
    Where-Object DriveLetter |
    Select-Object `
        @{Name="Drive";Expression={$_.DriveLetter}},
        @{Name="FS";Expression={$_.FileSystem}},
        @{Name="Size(GB)";Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name="Used(GB)";Expression={[math]::Round(($_.Size - $_.SizeRemaining) / 1GB, 2)}},
        @{Name="Free(GB)";Expression={[math]::Round($_.SizeRemaining / 1GB, 2)}},
        @{Name="Use%";Expression={
            [math]::Round((($_.Size - $_.SizeRemaining) / $_.Size) * 100, 1)
        }} |
    Format-Table -AutoSize
}

function psg {
    param(
        [Parameter(ValueFromPipeline=$true)]
        [string]$Name
    )
    Get-Process *$Name*
}

function killp {
    param([string]$Name)
    Get-Process *$Name* | Stop-Process -Confirm
}

function ports {
    Get-NetTCPConnection | Sort-Object LocalPort | Format-Table LocalAddress,LocalPort,RemoteAddress,State -AutoSize
}

function myip {
    (Invoke-RestMethod "https://api.ipify.org?format=json").ip
}

function flushdns {
    Clear-DnsClientCache
}

function pinggg {
    param([string]$HostName)
    Test-Connection $HostName -Count 4
}

# pwsh 7
function pingsweep {
    param([string]$Subnet = "172.16.24")
    
    1..254 | ForEach-Object -Parallel {
        $ip = "$using:Subnet.$_"
    
        if (Test-Connection $ip -Count 1 -Quiet -TimeoutSeconds 1) {
            Write-Output $ip
        }
    } -ThrottleLimit 32
}

# rm -r: Recursive removal
function rmr {
    param([Parameter(Mandatory, Position = 0)][string[]]$Path)
    Remove-Item -LiteralPath $Path -Recurse
}

# rm -rf: Recursive + force removal
function rmrf {
    param([Parameter(Mandatory, Position = 0)][string[]]$Path)
    Remove-Item -LiteralPath $Path -Recurse -Force
}

# rm -rf with suppressed non-terminating errors
function rmrfs {
    param([Parameter(Mandatory, Position = 0)][string[]]$Path)
    Remove-Item -LiteralPath $Path -Recurse -Force -ErrorAction SilentlyContinue
}

# verify-devonb 
function verify-devonb {
    param([string]$File)
    curl.exe -X POST "http://172.16.24.21:8085/verify/v2/new/deviceOnboarding" -H "Accept: */*" -H "Accept-Encoding: gzip" -H "Connection: keep-alive" -F "csv=@${File}"
}

$env:PRE_COMMIT_HOME = "C:\pre-commit"
$env:Path = "$HOME\scoop\shims;$env:LOCALAPPDATA\Python\bin;$HOME\workspace\_tools\nasm-3.02;$env:Path"

# can alternatively run the env path in regular terminal, then run this one
# [Environment]::SetEnvironmentVariable(
#     "Path",
#     "$env:LOCALAPPDATA\Python\bin;" + [Environment]::GetEnvironmentVariable("Path","User"),
#     "User"
# )

# then can verify
# [Environment]::GetEnvironmentVariable("Path", "User")

# codex
#   login | logout | --version | doctor | --help

# Invoke-Expression (&starship init powershell)
# Invoke-Expression (& { (zoxide init powershell | Out-String) })
oh-my-posh init pwsh --config "$HOME\workspace\OhMyPosh\probua.minimal.omp.json" | Invoke-Expression
