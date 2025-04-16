# Yocto BeagleBone AI-64 manifest

## Creating Yocto Source directory with Repo Tool:

### Setup repo tool

```bash
# Debian/Ubuntu.
$ sudo apt-get install repo

# Install Manually
$ mkdir -p ~/.bin
$ PATH="${HOME}/.bin:${PATH}"
$ curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
$ chmod a+rx ~/.bin/repo
```

### Run repo init to fetch manifest from repository

```bash
$ repo init -u https://github.com/Nueralspace/bbi64_ai_yocto_build.git -b scarthgap -m bbi64_ai_yocto_build.xml
```

### Sync the repository

```
$ repo sync
```
