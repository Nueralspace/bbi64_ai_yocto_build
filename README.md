# Yocto BeagleBone AI-64 manifest

## Creating Yocto Source directory with Repo Tool:

### Setup repo tool

```bash
$ cd ~/bin
$ wget https://storage.googleapis.com/git-repo-downloads/repo
$ chmod a+x ./repo
```

### Run below command to fetch manifest from repository

```bash
$ repo init -u https://github.com/Nueralspace/bbi64_ai_yocto_build.git -b scarthgap -m bbi64_ai_yocto_build
```

### Sync the repository

```
$ repo sync
```
