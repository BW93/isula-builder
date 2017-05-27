# buildscripts

This contains metadata and build scripts for the EulerOS iSula Host
Images.

### Maintaining the RPMs

Owner: `mailto: <liangchenye@gmail.com>`

The RPM packages are maintained in euleros rpmpkg repositories.  

### The build process

As step 1,the build machine will git clone the config file and all build script.
Then run the script,just checkout the lastest ostree repo from euleros-repo.huawei.com/ostree,and rpm compose a new one on the local.
After composed,generate the delta-static data/tar and copy it to euleros-repo.huawei.com to update other repo offline.
And then,pull another copy of compsed repo, rysnc it to euleros-repo.huawei.com/ostree,just same to push action.
Finally run lorax script base the compsed repo,generate a iso in /images.

### Contributing
