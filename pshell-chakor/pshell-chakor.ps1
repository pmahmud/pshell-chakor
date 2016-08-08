Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs

# Module initialization is at the end of file

# |-------------------------|
# | rp: reset profile	
# |-------------------------|
# | Reset the current profile
# |-------------------------|
function rp {
	. $profile
}

# |-------------------------
# | cr: cd to repo directory     
# |-------------------------
#   Go to repository directory
# |-------------------------
function cr {
    $repo_location = 'c:\git\demandstream-main'
    cd $repo_location
}

# |-------------------------
# | xr: open repo in explorer   
# |-------------------------
#   Open the repository folder in the exlorer
# |-------------------------
function xr {
    $repo_location = 'c:\git\demandstream-main'
    start $repo_location
}

# |-------------------------
# | crw: cd to MerchantWebMVC   
# |-------------------------
#   CD to the MerchantWebMVC folder
# |-------------------------
function crw {
    $web_location = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc'     
	cd $web_location
}

# |-------------------------
# | xrw: open MerchantWebMVC in explorer   
# |-------------------------
#   open the MerchantWebMVC in the exlorer
# |-------------------------
function rwx {
    $web_location = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc'     
	start $web_location
}

# |-------------------------
# | buildw: webpack build   
# |-------------------------
#  Webpack build and watch
# |-------------------------
function bw {
    Write-Host "Running installation script..." -ForegroundColor Cyan    
    $build_script = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc\webpackBuildWatch.bat'     
	& $build_script
}

# |-------------------------
# | buildw: Test module installation   
# |-------------------------
#  Test pshell-chakor installation
# |-------------------------
function testInstallChakor {
    Write-Host "$nl  pshell-chakor module installed successfully!" -ForegroundColor Green
}

# |-------------------------
# | ipc: install pshell-chakor
# |-------------------------
#  Install Pshell Chakor
# |-------------------------
function ipc {
    Write-Host "Running installation script..." -ForegroundColor Cyan
    . "C:\git\pshell-chakor\install.ps1"
    resprof
}

# |-------------------------
# | vs: open visual studio in admin mode
# |-------------------------
#  Open Visual Studio in admin mode
#  To make this work in your system, you have to:
#  right click on devenv.exe and select:
#  troubleshoot compatibility-> troubleshoot -> run in admin mode -> save
# |-------------------------
function vs {
    Write-Host "Running visual studio in admin mode..." -ForegroundColor Cyan
    & "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
}

# |-------------------------
# | jd: open jira dashboard
# |-------------------------
#  Open jira dashboard
# |-------------------------
function jd {
    Write-Host "Navigating to jira dashboard" -ForegroundColor Cyan
    Start-Process -FilePath "http://jira.nexus.commercehub.com/secure/Dashboard.jspa"
}

# |-------------------------
# | jd: open jira dashboard
# |-------------------------
#  Open jira dashboard
# |-------------------------
function jd {
    $dashPath = "http://jira.nexus.commercehub.com/secure/Dashboard.jspa"
    Write-Host "Navigating to jira dashboard" -ForegroundColor Cyan
    Start-Process -FilePath $dashPath
}

# |-------------------------
# | jd: open jira scrum board
# |-------------------------
#  Open jira scrum board
# |-------------------------
function js {
    $scrumPath = "http://jira.nexus.commercehub.com/secure/RapidBoard.jspa?rapidView=36"
    Write-Host "Navigating to jira Einstein Scrum Page" -ForegroundColor Cyan
    Start-Process -FilePath $scrumPath
}

# |-------------------------
# | npp: open file with notepad++
# |-------------------------
#  Open a file with notepad++
# |-------------------------
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

# |-------------------------
# | cod: checkout, fetch and reset dev
# |-------------------------
#  Checkout dev, fetch and reset
# |-------------------------
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

# |-------------------------
# | corn: Checkout release/next fetch and reset 
# |-------------------------
#  Check out release/next, fetch and reset
# |-------------------------
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

# |-------------------------
# | mfb: merge feature branch
# |-------------------------
#  Performs Merge to dev Steps
# |-------------------------
# 
function mfb {

    Param($featureBranch, $branch = $(git symbolic-ref --short HEAD))

    If(-Not $featureBranch){        
        Write-Host "Specify a branch to merge. Here is the branches that you got: " -ForegroundColor Red
        git branch
    }else{
        #Merge changes from your branch to dev
        Write-Host "Attempting to merge $featureBranch to $branch" -ForegroundColor Cyan
        git merge origin/dses/$featureBranch
    }
}

# |-------------------------
# | ptd: push to feature branch
# |-------------------------
#  Push to feature branch
# |-------------------------
# 
function ptf {
    Param($featureBranch = $(git symbolic-ref --short HEAD))
    Write-Host "Attempting to push to $featureBranch" -ForegroundColor Cyan
    git push origin HEAD:refs/for/$featureBranch
}

# |-------------------------
# | ptd: push to dev
# |-------------------------
#  Performs Merge to dev Steps
# |-------------------------
# 
function ptd {
    Write-Host "Attempting to push to dev" -ForegroundColor Cyan
    #Push to origin/dev
    git push origin HEAD:refs/for/dev
}

# |-------------------------
# | ptr: push to release/next
# |-------------------------
#  Push to release/next
# |-------------------------
# 
function ptr {
    Write-Host "Attempting to push to release/next" -ForegroundColor Cyan
    #Push to origin/dev
    git push origin HEAD:refs/for/release/next
}

# |-------------------------
# | buildw: Build the web project
# |-------------------------
#  Build the web project
# |-------------------------
# 
function buildw {
    Write-Host "Attempting to build Web Solution" -ForegroundColor Cyan
    $MSBuildPath = "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe"
    $SolutionPath
    . $MSBuildPath $SolutionPath
}

# |-------------------------
# | glp: Git log pretty
# |-------------------------
#  Pretty git log
# |-------------------------
# 
function glp {
    Write-Host "Trying to execute git log and make it pretty" -ForegroundColor Cyan
    git log --oneline --graph --decorate
}


# |-------------------------
# | gl: Git log
# |-------------------------
#  Pretty git log
# |-------------------------
# 
function glg {
    Write-Host "Trying to execute git log" -ForegroundColor Cyan
    git log
}


# |-------------------------
# | gl: Git reflog
# |-------------------------
#  Pretty git reflog
# |-------------------------
# 
function grl {
    Write-Host "Trying to execute git reflog" -ForegroundColor Cyan
    git reflog
}



# |-------------------------|
# | Module initialization	
# |-------------------------|

#  Change directory to our repo folder
cr


