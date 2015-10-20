# webbuild

Package that allows to build a private pkg's from package.json files.

## Requirements
 FreeBSD 10+
 
 
## Setup

### General setup
Install packages:
```bash 
 pkg install make bash p5-JSON
 ```
### Optional setup with local repository
Create a folder: 
```bash
mkdir -p /usr/local/www/repo
```


 Other requirements should be included inside a package.

## Build
```bash
 git clone https://github.com/spagu/webbuild.git
 make clean
 rm -f distinfo
 make makesum
 make
 make makeplis
 make package
```


## Automate Build with Jenkins
1. create new job (make sure jenkins has a github plugin installed)
2. add github link
3. open Build->Execute shell and add this:
```bash
#!/usr/local/bin/bash
GH_VERSION=`git ls-remote --tags ${GIT_URL} | tail -n 1 |  tail -n 1 | sed 's/.*refs\/tags\///g'`
make clean
rm -f distinfo
make DISTVERSION=${GH_VERSION} makesum
make DISTVERSION=${GH_VERSION} makeplis
make DISTVERSION=${GH_VERSION} package
sudo pkg install work/pkg/webbuild.zxy
```
to automate repository add:
```bash
cp work/pkg/*.txz /usr/local/www/repo/
pkg repo -l /usr/local/www/repo/
```

create new file called ``/etc/pkg/spagu.conf`` with content:
```conf
spagu: {
    url             : "file:///usr/local/www/repo/",
    enabled         : yes,
    mirror_type     : NONE
}
```


## Install
### cowboy style
```bash
cd work/pkg/
pkg install webbuild
```
### repository
```bash
pkg update
pkg install webbuild
```

## Uninstall
```bash
pkg remove webbuild
```


## Usage
```bash
webbuild {source_json} {requirements}
```

## Known issues
-make plist error : ignore this error for now  