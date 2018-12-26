# About

This repository contains ansible role for php, nginx and wordpress setup. Molecule is used to perform testing of ansible role in docker image with Testinfra. Supported OS:

* Ubuntu/Debian
* RedHat/CentOS
* Amazon Linux AMI

# Requirements

* gcc
* pip
* virtualenv
* molecule
* ansible
* docker
* goss

# Usage

Make sure you have gcc installed in the system. Install pip in your system then install virtualenv globally. Then create python environment in the project root as following,

```
$ virtualenv --python=/usr/bin/python .venv
```

Use environment python and then install other dependencies,

```
$ source .venv/bin/activate
$ pip install ansible
$ pip install molecule
$ pip install docker
```

In the project root directory run the following command to run tests,

```
$ molecule test
```

If your docker image and role is the same but test case changes then use,

```
$ molecule create
$ molecule Converge
$ molecule verify
```

# Note

If you want to test goss test case manually in remote workstation then

* Install `facter` in remote os
* Apply following command `goss --vars <(facter -j) validate`
* Make sure you use `osfamily` variable in `goss.yaml`

```
{{if eq .Vars.osfamily "RedHat"}}
user:
  nginx:
    exists: true
    groups:
    - nginx
    home: /var/cache/nginx
    shell: /sbin/nologin
group:
  nginx:
    exists: true
{{end}}
{{if eq .Vars.osfamily "Debian"}}
user:
  www-data:
    exists: true
    groups:
    - www-data
    home: /var/www
    shell: /usr/sbin/nologin
group:
  www-data:
    exists: true
{{end}}
```
