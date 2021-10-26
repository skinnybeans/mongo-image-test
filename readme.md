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

  - what do we need to config from the current box?

- storage
  - attaching data drive
  - attaching log drive
  - other drives??
