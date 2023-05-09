# emptyhammock-role-users-and-groups

This is an Ansible role that, in conjunction with a number of other Emptyhammock
roles, handles provisioning and deployment of Django applications.

I use this role in some non-Django projects as well, as it serves a more generic
purpose.  Specifically:

This role

* sets up developer users on the system so that they can log in via ssh and
  use `sudo` (i.e., deploy to the system or log in for troubleshooting)
* creates a project user, with a home directory
* optionally creates a logging group and adds the project user and optional
  log directory owner to that group

## Usage

### Example invocation in a playbook

```
- hosts: webservers
  become: true
  become_user: root
  roles:
    - users_and_groups
```

### Variables

#### `users` - deployer usernames with their public keys

```
users:
  - name: jouser
    public_key:
      - ssh-rsa 11223344...
  - name: bethuser
    public_key:
      - ssh-rsa 22334455...
```

Once this role is executed, no user will be able to log in with a password over
ssh, and `root` won't be able to login over ssh at all.  Thus you should test
your `users` setting on a test system before deploying to production.  Also,
double-check using your cloud (or physical) console for logging in as root.

#### `project_user`

Username associated with the project, not able to ssh into the system; typically
project source will be owned by this user and daemons may run as this user

#### `project_name`

Name of project

#### `log_dir_owner` (optional)

When this is defined, the specified user will be created.  The intention is
that the log directory is owned by this user, but that isn't handled by this
role.

#### `log_group` (optional)

When this is defined, the specified group will be created, and the project user
and the log dir owner will be members of this group.
