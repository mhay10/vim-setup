# Make sure you want to continue
Write-Host "Warning: This will REPLACE the _vimrc file in home dir"
$check = Read-Host -Prompt "Are you sure you want to continue? (y/n)"

# Make sure you enter the correct response
$values = @("y", "Y", "n", "N")
while (!$values.Contains($check)) {
    $check = Read-Host -Prompt "Are you sure you want to continue? (y/n)"
}

# What to do when correct response entered
if ( $check -eq "y" -or $check -eq "Y") {
    # Check if vim-plug is installed. If not, install it
    if ($(Test-Path "$env:UserProfile\vimfiles\autoload") -eq $false) {
        mkdir -Path "$env:UserProfile\vimfiles\autoload"

        $pluginUrl = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        Invoke-WebRequest -Uri $pluginUrl -OutFile "$env:UserProfile\vimfiles\autoload\plug.vim"
    }

    # Make the vimrc file in $env:UserProfile
    if (Test-Path "$env:UserProfile\_vimrc") {
        Remove-Item -Recurse -Force -Path "$env:UserProfile\_vimrc"
        Copy-Item ".vimrc" "$env:UserProfile\_vimrc"
    } else {
        Copy-Item ".vimrc" "$env:UserProfile\_vimrc"
    }

    Write-Host "_vimrc file has been overwritten."
} elseif ($check == "n" -or $check == "N") {
    Write-Host "Okay, bye!"
}
