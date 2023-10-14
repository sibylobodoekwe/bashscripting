# Managing User Accounts in Linux

## 1. create a User

#### to create a new user named "newuser," use the following command:

```
useradd newuser
```
![Screenshot](/images/useradd.png)

#### in the case the user "renge" has been added.

now to view the changes by running:

```
cat /etc/passwd | grep newuser
```

![Screenshot](/images/catuseradd.png)

now you can see renge username, user id, group id, and home directory has been succefully added.

## 2. set Expiry Date for the User

set an expiry date for the user "newuser" using the chage command:

```
chage -E $(date -d '+2 weeks' +%Y-%m-%d) newuser
```

![Screenshot](/images/userexpiry.png)

view the changes you made using the chage command, you can use the following command:

```
chage -l newuser
```

-l stands for "list" and it will display the password expiry information for the specified user.

you'll get an output similar to this:
![Screenshot](/images/catuserexpiry.png)

## 3. prompt the user to change their password on login

to prompt the user to change their password on login, you can use the `chage` command with the `-d` option set to 0. This will force the user to change their password upon their next login. For example:

```
sudo chage -d 0 username
```

![Screenshot](/images/passwdpmt.png)

view the changes you made using the chage command:

```
chage -l newuser
```

you'll get an output similar to this:
![Screenshot](/images/catpasswdpmt.png)

## 4. attach User to a group called altschool

to add user to the group altschool, first create a group altschool

```
sudo groupadd altschool
```

![Screenshot](/images/creategrp.png)

great, now that we have an existing group called altschool, we can now add the user "newuser" to the "altschool" group using the usermod command:

```
usermod -aG altschool newuser
```

![Screenshot](/images/addusergrp.png)

we can view user group using command;

```
groups newuser
```

![Screenshot](/images/catusergrp.png)

## 5. allow altschool to run only cat command on /etc/

edit the sudoers file with the visudo command, this requires root privileges, then you can add the line for the "altschool" group:

```
%altschool ALL=(ALL) /bin/cat /etc/*
```

![Screenshot](/images/visudo.png)

or you can simply echo it witouth opening the file using the command:

```
echo "%altschool ALL=(ALL) /bin/cat /etc/*" >> /etc/sudoers
```

to view the result use the command:

```
cat /etc/sudoers | grep altschool
```

![Screenshot](/images/catsudoers.png)

altshool group now has permission to use the cat command with superuser privileges (ALL=(ALL)) specifically for files in the /etc/ directory

## 6. create User Without a Home Directory

create a user named "anotheruser" without a home directory using the -M option:

```
sudo useradd -M anotheruser
```

view the changes with:

```
cat /etc/passwd | grep anotheruser
```

![Screenshot](/images/catnohome.png)

even though you used the --no-create-home flag for new user "granger", the home directory was still created because the behavior of the useradd command can depend on the configuration of the system or the user management settings. Some systems might ignore the --no-create-home flag, and the home directory could still be created.
to ensure that no default home directory is created, you can specify a non-existent directory using the -d flag:

```
useradd -M -d /nonexistent anotheruser
```

![Screenshot](/images/catevict.png)

## now let see the content of users information

to display the content of the /etc/passwd file with superuser (root) privileges, use:

```
sudo cat /etc/passwd
```

![Screenshot](/images/content.png)

you can see the entries for various system and service accounts, as well as the users "renge" and "granger." The "granger" user's home directory is set to "/nonexistent," which means that even though you used the --no-create-home option when creating the user, the system still assigned a directory for the user, but it is not intended for actual usage.
