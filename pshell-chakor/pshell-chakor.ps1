Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs


# Module initialization is at the end of file.

# |------------------------------------------------------------
# | printFiglet: cd to git directory
# |------------------------------------------------------------
#   Go to repository directory
# |------------------------------------------------------------
function printFigletTitle {
    $figletTitle = '
     ______     _           _ _       _______ _           _
    (_____ \   | |         | | |     (_______) |         | |
     _____) )__| |__  _____| | |_____ _      | |__  _____| |  _ ___   ____
    |  ____/___)  _ \| ___ | | (_____) |     |  _ \(____ | |_/ ) _ \ / ___)
    | |   |___ | | | | ____| | |     | |_____| | | / ___ |  _ ( |_| | |
    |_|   (___/|_| |_|_____)\_)_)     \______)_| |_\_____|_| \_)___/|_|

    -----------------------------------------------------------------------
    Pallab Mahmud [pmahmud@commercehub.com] 10/7/2016
    -----------------------------------------------------------------------
    Pshell-Chakor module successfully loaded!
    '
    Write-Host $figletTitle -ForegroundColor Cyan
}


# |------------------------------------------------------------
# | cg: cd to git directory
# |------------------------------------------------------------
#   Go to repository directory
# |------------------------------------------------------------
function cg {
    $git_location = 'c:\git'
    cd $git_location
    ls
}

# |------------------------------------------------------------
# | cr: cd to repo directory
# |------------------------------------------------------------
#   Go to repository directory
# |------------------------------------------------------------
function cr {
    $repo_location = 'c:\git\demandstream-main'
    cd $repo_location
}

# |------------------------------------------------------------
# | xr: open repo in explorer
# |------------------------------------------------------------
#   Open the repository folder in the explorer
# |------------------------------------------------------------
function xr {
    $repo_location = 'c:\git\demandstream-main'
    start $repo_location
}

# |------------------------------------------------------------
# | crw: cd to MerchantWebMVC
# |------------------------------------------------------------
#   CD to the MerchantWebMVC folder
# |------------------------------------------------------------
function crw {
    $web_location = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc'
	cd $web_location
}

# |------------------------------------------------------------
# | xrw: open MerchantWebMVC in explorer
# |------------------------------------------------------------
#   open the MerchantWebMVC in the explorer
# |------------------------------------------------------------
function xrw {
    $web_location = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc'
	start $web_location
}

# |--------------------------------------------------------------------------
# | vs: open visual studio in admin mode
# |--------------------------------------------------------------------------
#  Open Visual Studio in admin mode
#  To make this work in your system, you have to:
#  right click on devenv.exe and select:
#  troubleshoot compatibility-> troubleshoot -> run in admin mode -> save
# |--------------------------------------------------------------------------
function vs {
    Write-Host "Running visual studio in admin mode..." -ForegroundColor Cyan
    & "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
}

# |------------------------------------------------------------
# | jd: open jira dashboard
# |------------------------------------------------------------
#  Open jira dashboard
# |------------------------------------------------------------
function jd {
    $dashPath = "http://jira.nexus.commercehub.com/secure/Dashboard.jspa"
    Write-Host "Navigating to jira dashboard" -ForegroundColor Cyan
    Start-Process -FilePath $dashPath
}

# |------------------------------------------------------------
# | js: open jira scrum board
# |------------------------------------------------------------
#  Open jira scrum board
# |------------------------------------------------------------
function js {
    $scrumPath = "http://jira.nexus.commercehub.com/secure/RapidBoard.jspa?rapidView=36"
    Write-Host "Navigating to jira Einstein Scrum Page" -ForegroundColor Cyan
    Start-Process -FilePath $scrumPath
}

# |------------------------------------------------------------
# | npp: open file with notepad++
# |------------------------------------------------------------
#  Open a file with notepad++
# |------------------------------------------------------------
function npp {
    Param($filePath)
    $nppPath = "C:\Program Files (x86)\Notepad++\notepad++.exe"
    Write-Host "Openning $filePath in notepad++" -ForegroundColor Cyan
    If(-Not $filePath){
        Start $nppPath
    }else{
        Start $nppPath $filePath
    }
}

# |------------------------------------------------------------
# | gerrit: create branch off of master via gerrit
# |------------------------------------------------------------
# | create branch off of master via gerrit#
# |------------------------------------------------------------
function gerrit {
    Param($branchName)
    Write-Host "Trying to create $branchName branch on gerrit." -ForegroundColor Cyan
    If(-Not $branchName){
        Write-Host "Specify a branch name first! " -ForegroundColor Red
    }else{
        cr
        ssh -p 29418 pmahmud@gerrit 'gerrit create-branch' demandstream-main $branchName master
        Write-Host "Success! $branchName branch created on gerrit." -ForegroundColor Cyan
        git fetch
        Write-Host "Checking out $branchName..." -ForegroundColor Cyan
        git checkout $branchName
        Write-Host "Success! you can start working on your new branch now." -ForegroundColor Green
    }
}


# |------------------------------------------------------------
# | cod: checkout, fetch and reset dev
# |------------------------------------------------------------
#  Checkout dev, fetch and reset
# |------------------------------------------------------------
#
function cod {

    #Checkout dev branch
    Write-Host "Checking out dev branch" -ForegroundColor Cyan
    git checkout dev
    Write-Host "Success!" -ForegroundColor Green

    #Fetch latest
    Write-Host "Fetching dev branch" -ForegroundColor Cyan
    git fetch
    Write-Host "Success!" -ForegroundColor Green

    #Reset everything
    Write-Host "Resetting dev branch" -ForegroundColor Cyan
    git reset --hard origin/dev
    Write-Host "Success!" -ForegroundColor Green

}

# |------------------------------------------------------------
# | corn: Checkout release/next fetch and reset
# |------------------------------------------------------------
#  Check out release/next, fetch and reset
# |------------------------------------------------------------
#
function corn {

    #Checkout release/next branch
    Write-Host "Checking out release/next" -ForegroundColor Cyan
    git checkout release/next
    Write-Host "Success!" -ForegroundColor Green

    #Fetch latest
    Write-Host "Fetching release/next" -ForegroundColor Cyan
    git fetch
    Write-Host "Success!" -ForegroundColor Green

    #Reset everything
    Write-Host "Resetting release/next branch" -ForegroundColor Cyan
    git reset --hard origin/release/next
    Write-Host "Success!" -ForegroundColor Green

}


# |------------------------------------------------------------
# | com: checkout, fetch and reset master
# |------------------------------------------------------------
#  Checkout master, fetch and reset
# |------------------------------------------------------------
#
function com {

    #Checkout dev branch
    Write-Host "Checking out master branch" -ForegroundColor Cyan
    git checkout master
    Write-Host "Success!" -ForegroundColor Green

    #Fetch latest
    Write-Host "Fetching master branch" -ForegroundColor Cyan
    git fetch
    Write-Host "Success!" -ForegroundColor Green

    #Reset everything
    Write-Host "Resetting master branch" -ForegroundColor Cyan
    git reset --hard origin/master
    Write-Host "Success!" -ForegroundColor Green

}


# |------------------------------------------------------------
# | merge: merge feature branch
# |------------------------------------------------------------
#  Performs Merge to dev Steps
# |------------------------------------------------------------
#
function merge {

    Param($featureBranch, $branch = $(git symbolic-ref --short HEAD))

    If(-Not $featureBranch){
        Write-Host "Specify a branch to merge. Here are the local branches you have: " -ForegroundColor Red
        git branch
    }else{
        #Merge changes from your branch to dev
        Write-Host "Attempting to merge $featureBranch to $branch" -ForegroundColor Cyan
        git merge origin/$featureBranch
    }
}

# |------------------------------------------------------------
# | cout: checkout a feature branch
# |------------------------------------------------------------
#  Checks out feature branch that has been already created
# |------------------------------------------------------------
#
function cout {

    Param($featureBranch)

    If(-Not $featureBranch){
        Write-Host "Specify a branch to checkout. If you are not sure, consider running com first. Here are the local branches you have : " -ForegroundColor Red
        git branch
    }else{
        Write-Host "Attempting checkout $featureBranch" -ForegroundColor Cyan
        git checkout $featureBranch
    }
}

# |------------------------------------------------------------
# | ptf: push to feature branch
# |------------------------------------------------------------
#  Push to feature branch
# |------------------------------------------------------------
#
function ptf {
    Param($featureBranch = $(git symbolic-ref --short HEAD))
    Write-Host "Attempting to push to $featureBranch" -ForegroundColor Cyan
    git push origin HEAD:refs/for/$featureBranch
}

# |------------------------------------------------------------
# | ptd: push to dev
# |------------------------------------------------------------
#  Performs Merge to dev Steps
# |------------------------------------------------------------
#
function ptd {
    Write-Host "Attempting to push to dev" -ForegroundColor Cyan
    #Push to origin/dev
    git push origin HEAD:refs/for/dev
}

# |------------------------------------------------------------
# | ptr: push to release/next
# |------------------------------------------------------------
#  Push to release/next
# |------------------------------------------------------------
#
function ptr {
    Write-Host "Attempting to push to release/next" -ForegroundColor Cyan
    #Push to origin/dev
    git push origin HEAD:refs/for/release/next
}

# |------------------------------------------------------------
# | buildw: Build the web project
# |------------------------------------------------------------
#  Build the web project
# |------------------------------------------------------------
#
function buildw {
    Write-Host "Attempting to build Web Solution" -ForegroundColor Cyan
    $MSBuildPath = "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe"
    $SolutionPath
    . $MSBuildPath $SolutionPath
}

# |------------------------------------------------------------
# | watchw: webpack build and watch
# |------------------------------------------------------------
#  Webpack build and watch
# |------------------------------------------------------------
function watchw {
    Write-Host "Running installation script..." -ForegroundColor Cyan
    $build_script = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc\webpackBuildWatch.bat'
	& $build_script
}

# |------------------------------------------------------------
# | stat: Git status
# |------------------------------------------------------------
#   git status
# |------------------------------------------------------------
#
function stat {
    Write-Host "Running git status:" -ForegroundColor Cyan
    git status
}

# |------------------------------------------------------------
# | log: Git log
# |------------------------------------------------------------
#   git log
# |------------------------------------------------------------
#
function log {
    Write-Host "Trying to execute git log" -ForegroundColor Cyan
    git log
}

# |------------------------------------------------------------
# | logp: Git log pretty
# |------------------------------------------------------------
#   Pretty git log
# |------------------------------------------------------------
#
function logp {
    Write-Host "Trying to execute git log and make it pretty" -ForegroundColor Cyan
    git log --oneline --graph --decorate
}

# |------------------------------------------------------------
# | logr: Git reflog
# |------------------------------------------------------------
#   git reflog
# |------------------------------------------------------------
#
function logr {
    Write-Host "Trying to execute git reflog" -ForegroundColor Cyan
    git reflog
}

function stash {
    Param($stashName)
    Write-Host "Trying to stash your current works." -ForegroundColor Cyan
    git stash save $stashName
}

function cleanall {
    Write-Host "Trying to execute git clean -xdf" -ForegroundColor Cyan
    git clean -xdf
}

function stashls {
    Write-Host "Trying to get the stash list." -ForegroundColor Cyan
    git stash list
}

function pop {
    Write-Host "Trying to pop the first item on the stash list." -ForegroundColor Cyan
    git stash pop stash@"{0}"
}

function syncdb {
    Write-Host "Trying to sync MercentAdmin." -ForegroundColor Cyan
    C:\git\demandstream-main\Solution\Database\ScriptDB\ScriptDB.exe -sync localhost Script_Admin MercentAdmin -SourceDir C:\git\demandstream-main\Solution\Database\Admin

    Write-Host "Trying to sync MerchantBase." -ForegroundColor Cyan
    C:\git\demandstream-main\Solution\Database\ScriptDB\ScriptDB.exe -sync localhost Script_MerchantBase MerchantBase -SourceDir C:\git\demandstream-main\Solution\Database\MerchantBase

    Write-Host "Trying to sync Merchant_BizarroNordstrom." -ForegroundColor Cyan
    C:\git\demandstream-main\Solution\Database\ScriptDB\ScriptDB.exe -sync localhost Script_Merchant Merchant_BizarroNordstrom -SourceDir C:\git\demandstream-main\Solution\Database\Merchant
}

# |---------------------------------------------------------------------------------------------
# | Module initialization
# |---------------------------------------------------------------------------------------------

#  Change directory to our repo folder
printFigletTitle
cr
