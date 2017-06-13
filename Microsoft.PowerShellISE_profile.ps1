Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm
Import-Module posh-git
cd ~

<#
The following function and alias assignment
are for use with git to create files which
start with a period, e.g. .gitignore
#>
function touch_file
{
    $file = $args[0]
    if($file -eq $null) {
		Set-ExecutionPolicy -ExecutionPolicy Undefined
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}
new-alias -name touch -value touch_file