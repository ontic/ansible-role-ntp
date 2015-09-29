# Ontic NTP ![Status](https://img.shields.io/badge/project-maintained-brightgreen.svg)

| Branch             | Build               | Galaxy              | Release              |
| :----------------- | :------------------ | :------------------ | :------------------- |

## Introduction

This role installs NTP on RedHat/CentOS and Debian/Ubuntu Linux servers.

## Requirements

| Name                                                                                          | Version       |
| :-------------------------------------------------------------------------------------------- | :------------ |
None                                                                                            | N/A           |


## Installation

We strongly suggest installing this role using [Ansible Galaxy](https://galaxy.ansible.com) so that any dependencies
will get resolved and downloaded automatically. However, we've listed a few other alternatives.

### 1.1 Downloading

Download the project files as a `.zip` archive, extracting them into your `./roles/` directory.

### 1.2 Cloning

Clone the project it into your `./roles/` directory.

### 1.3 Ansible Galaxy

The easiest way to install this module is via the command line:

```
$ ansible-galaxy install ontic.ntp
```

If you have multiple roles to install, the ansible-galaxy CLI can be fed a `requirements.yml` file.

```yml
- src: ontic.ntp
```

```
$ ansible-galaxy install -r requirements.txt
```

Alternatively you could download the source by setting the repository in your `requirements.yml` file:

```yml
- src: git+https://github.com/ontic/ansible-role-ntp.git
  version: master
  name: ontic.ntp
```

### 2.1 Enabling

Enable the role in your playbook file.

```yml
- name: Example web server
  hosts: web_servers
  roles:
    - { role: ontic.ntp }
```

## Documentation

Full documentation is available in the [docs](/docs) directory.

## License

Licensed under the BSD License. See the [LICENSE](/LICENSE) file for details.