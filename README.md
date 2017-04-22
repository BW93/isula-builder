# buildscripts

This contains metadata and build scripts for the EulerOS AntOS Host
Images.  For more information, see
http://wiki.centos.org/SpecialInterestGroup/Atomic

### Maintaining the RPMs

Owner: `mailto:t00169790 <tanzhe@huawei.com>`

The RPM packages are maintained in euleros rpmpkg repositories.  
Currently with a private repo by t00169790.

But finally will go to http://euleros.huawei.com/yum or somewhere of euleros.

### The build process

Builds are run every 24 hrs from cron. 

As step 1,the build machine will git clone the config file and all build script.
Then run the script,just checkout the lastest ostree repo from euleros-repo.huawei.com/ostree,and rpm compose a new one on the local.
After composed,generate the delta-static data/tar and copy it to euleros-repo.huawei.com to update other repo offline.
And then,pull another copy of compsed repo, rysnc it to euleros-repo.huawei.com/ostree,just same to push action.
Finally run lorax script base the compsed repo,generate a iso in /images.

artifacts in CI machine.

Resulting artifacts are delivered to :
 * http://euleros-repo.huawei.com/ostree


Currently this process is owned by t00169790

### Contributing

Discuss on http://3ms.huawei.com/hi/group/2692269/threads.html#category=1300543



