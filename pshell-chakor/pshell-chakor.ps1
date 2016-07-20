Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs

# |-------------------------|
# | resprof: reset profile	
# |-------------------------|
#   Reset the current profile

function resprof {
	. $profile
}

# |-------------------------|
# | rep: repo directory     
# |-------------------------|
#   Go to repository directory

function rep {
    $repo_location = 'c:\git\demandstream-main'
    cd $repo_location
}

# |-------------------------|
# | repex: open   
# |-------------------------|
#   Open the 

function repex {
    $repo_location = 'c:\git\demandstream-main'
    start $repo_location
}

function repweb {
    $web_location = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc'     
	cd $web_location
}

# |-------------------------|
# | buildw: webpack build   
# |-------------------------|
#  Webpack build and watch

function buildw {
    $build_script = 'c:\git\demandstream-main\Solution\Web\MerchantWebMvc\webpackBuildWatch.bat'     
	& $build_script
}
