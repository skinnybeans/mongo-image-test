# Readme

Installation instructions for mongo 3.x here: https://docs.mongodb.com/v3.0/tutorial/install-mongodb-on-amazon/

## Prerequisites

Ideally this should be set up in a docker container so it doesn't have to all be installed locally.

### Install packer

https://learn.hashicorp.com/tutorials/packer/get-started-install-cli

### Install ansible

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#from-pip

## set up local environment

### Ansible

Ansible is a python app, so best to set it up in a virtual environment

```bash
# create venv
python -m virtualenv ansible
# activate venv
source ansible/bin/activate
# install python module
python -m pip install ansible
```

Now you should be able to run:

```bash
ansible --version
```

### Packer

Get packer to download the necessary modules it needs

```bash
packer init .
```

3. Run

```bash
packer build .
```

### AWS

The packer file includes no AWS creds here, so make sure you are connecting through to the correct AWS environment from your cli.

Run

```bash
aws sts get-caller-identity
```

Check the account number and user are what you expect

## Running

```bash
packer build mongo-ec2.pkr.hcl
```

## TODOs

- config

  - change the location of the data and log directories
  - /etc/mongod.conf

- storage

  - attaching data drive
    - mount point `/data`
    - create ebs volume
    - attach to instance at `xvdf`
    - log onto instance
    - format drive using `sudo mkfs -t xfs /dev/xvdf`
    - create directory `sudo mkdir /data`
    - mount disk `sudo mount /dev/xvdf /data`
    - set permissions `chmod -R 777 /data` <- fix this
  - attaching log drive
    - mount point `/log`
    - same directions as data drive

- init script
  - default init script from package install has quirks (not being able to change data directory apparently)
  - /etc/rc.d/init.d/mongod

to start mongo service

- `sudo service mongod start`
