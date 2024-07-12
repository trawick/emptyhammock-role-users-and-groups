# Changes and migration requirements

## Version 0.0.5

* Fix problem restarting sshd on Ubuntu 24.

## Version 0.0.4

* Adjust permissions on home directory of project user.

## Version 0.0.3

* sshd: Root login as well as password authentication will be disabled.
  **Ensure that you have at least a primary and backup dev user, with ssh
  public/private keys backed up securely, defined in the `users` variable
  before running the updated role.**

## Version 0.0.2

* `log_group` and `log_dir_owner` are no longer required.  Related processing
  will be skipped.
