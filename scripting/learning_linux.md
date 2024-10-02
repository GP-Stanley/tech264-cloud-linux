# Research managing file ownership Linux

## Why is managing file ownership important?
* Managing file ownership is important in Linux because it `controls who has the ability to read, write, or execute a file or directory`. 
* In a multi-user system, this helps `maintain security and privacy` by ensuring that only authorised users can access or modify certain files. 
  * For example, you wouldn’t want everyone on a shared system to be able to change system files or view private documents.

`Ownership` defines **who** (which user or group) **has control** over a file or directory and **how they can interact with it**.

## What is the command to view file ownership?
* To view the ownership of a file or directory, you can use the `ls -l` command. 
* This command *lists the files in a directory* and *shows detailed information*, including the owner.

#### For example:
`ls -l` > This will display something like: `-rw-r--r--  1  john  staff  1234  Jan 1 12:00  file.txt`

## What permissions are set when a user creates a file or directory? Who does the file or directory belong to?
When a user creates a file or directory, Linux assigns default permissions using the umask value (which we'll explain below), and the file or directory belongs to the user who created it.

By default, files are given read and write permissions for the owner, and read permissions for others. For directories, the owner typically gets read, write, and execute permissions.

For example:
* File: `rw-r--r--`
  * Owner can read (`r`) and write (`w`).
  * Others can only read (`r`).
* Directory: `rwxr-xr-x`
  * Owner can read (`r`), write (`w`), and execute (`x`).
  * Others can read and execute, but not write.

## Why does the owner, by default, not receive X (execute) permissions when they create a file?
When you create a regular file (like a text file), the system assumes that it is meant for reading or writing—not executing as a program. For security reasons, execute (`x`) permissions are not granted by default. If you need to make a file executable (such as a script or program), you must manually give it execute permission using the `chmod` command.

```bash
Example: chmod +x my_script.sh
```

This makes the file executable.


## What command is used to change the owner of a file or directory?
To change the ownership of a file or directory, you use the `chown` command (short for "change owner").
```bash
sudo chown new_owner file.txt
# This command changes the ownership of file.txt to the user new_owner.
# You can also change the group ownership using:
sudo chown new_owner:new_group file.txt
# This command sets both the user and group ownership.
```

## Summary of Commands:
1. View ownership:
```bash
ls -l
```

2. Change ownership:
```bash
sudo chown new_owner file.txt
sudo chown new_owner:new_group file.txt
```

3. Set execute permission:
```bash
chmod +x file.txt
```

By understanding and managing file ownership and permissions, you can better control who can access and modify files, which is crucial for maintaining a secure system.

---

# Research managing file permissions
### No.

Being the owner does not automatically give you full permissions. 
* The owner of a file has permissions based on the file's user permissions (the first three characters in the permissions string). 
* If the owner only has read and write access, they won’t be able to execute the file unless they explicitly add execute permissions.

For example, if the permissions look like this:
```bash
-rw-r--r--

# The owner can read and write, but cannot execute the file because there is no x (execute) permission.
```

---
## If you give permissions to the User entity, what does this mean?
Giving permissions to the User entity means you're setting the permissions for the owner of the file. 
* The owner is the person who created the file or to whom ownership has been transferred. 
* The user’s permissions determine what actions the owner can perform on the file.

For example, if the permissions are:
```bash
-rw-------

# This means the owner can read and write the file, but no one else has access.
```
---
## If you give permissions to the Group entity, what does this mean?
When you give permissions to the Group entity, you are setting permissions for other users who are part of the group that owns the file. These users can interact with the file based on the group's permissions.

For example, if the permissions are:
```bash
-rw-r-----

# The owner can read and write, and members of the group can read the file but not write or execute it.
```

--- 
## If you give permissions to the Other entity, what does this mean?
Giving permissions to the Other entity (also called "world" permissions) means you're setting permissions for all other users on the system, regardless of whether they own the file or are in the group.

For example, if the permissions are:
```bash
-rw-r--r--

# The owner can read and write, the group can read, and everyone else (Other) can only read the file.
```
---
## You give the following permissions to a file:
* **User permissions** are read-only.
* **Group permissions** are read and write.
* **Other permissions** are read, write, and execute.

#### You are logged in as the user who is the owner of the file. What permissions will you have on this file? Explain.
* Even though Group and Other have more permissions, the *User permissions apply to you because you are the owner of the file*.
* If the User permissions are *read-only*, then you can *only read the file*, even though others may have more permissions.

--- 
## Here is one line from the ls -l command:
```bash
-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh
```
### Breakdown of the permissions:
* `-rwxr-xr--`: This is the permissions string.
* `-`: The first character shows the file type (`-` means a regular file, `d` would mean directory).
* `rwx`: The owner (`User`) has read (`r`), write (`w`), and execute (`x`) permissions.
* `r-x`: The group has read (`r`) and execute (x) permissions, but not write.
* `r--`: Others (everyone else) only have read (`r`) permission.

### Other details:
* `1`: Number of hard links.
* `tcboony`: The owner of the file.
* `staff`: The group associated with the file.
* `123`: File size in bytes.
* `Nov 25 18:36`: The last modification date and time.
* `keeprunning.sh`: The file name.

### Summary of file permissions:
* The **owner** (`tcboony`) can *read, write*, and *execute* the file.
* The **group** (members of `staff`) can *read and execute*, but not write.
* **Others** can only *read* the file.
---

# Research managing file permissions using numeric values

## What numeric values are assigned to each permission?
Each permission is assigned a numeric value:
* Read (r) = 4
* Write (w) = 2
* Execute (x) = 1
* No permission = 0

To assign multiple permissions, you add these values together.

## What can you assign with the values read + write permissions?
For read + write permissions, you add the values for read (4) and write (2), giving you:
```bash
4 + 2 = 6

#So, the value 6 assigns read and write permissions.
```
---

## What value would assign read, write, and execute permissions?
For read, write, and execute, you add the values for all three:
```bash
4 (read) + 2 (write) + 1 (execute) = 7
# So, the value 7 assigns read, write, and execute permissions.
```
---
## What value would assign read and execute permissions?
For read and execute, you add:
```bash
4 (read) + 1 (execute) = 5
# So, the value 5 assigns read and execute permissions.
```
---
# Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?

#### A file’s permissions represented by three numbers apply to:
1. **User** (owner) permissions (the `first` digit).
2. **Group** permissions (the `second` digit).
3. **Other** (everyone else) permissions (the `third` digit).

#### For 644, the permissions break down as:
* 6 (User): Read (4) + Write (2) = *read and write* for the *owner*.
* 4 (Group): Read (4) = *read-only for the group.*
* 4 (Other): Read (4) = *read-only for others.*

#### So, 644 means:
* The owner can read and write the file.
* The group and others can only read the file.
---

# Research changing file permissions

## What command changes file permissions?
The command used to change file permissions is:
```bash
chmod
```
* `chmod` stands for change mode and is used to modify file or directory permissions.

## To change permissions on a file, what must the end user be? (2 answers)
* The owner of the file.
* A superuser (root), which has the ability to modify any file's permissions.

## Examples of Different Ways/Syntaxes to Set Permissions on a New File (testfile.txt)
1. Set User to read, Group to read + write + execute, and Other to read and write only

You can use `chmod` with symbolic values:
```bash
chmod u=r,g=rwx,o=rw testfile.txt
```
This breaks down as:
* `u=r` (User has read permission)
* `g=rwx` (Group has read, write, and execute permissions)
* `o=rw` (Other has read and write permissions)

2. Add execute permissions (to all entities)
To add execute permissions for User, Group, and Other:

```bash
chmod a+x testfile.txt

# This gives execute permission (+x) to all (a) entities.
```
 
3. Take write permissions away from Group
To remove write permissions from Group:

```bash
chmod g-w testfile.txt

#This removes write permission (-w) from the group (g).
```

4. Use numeric values to give read + write access to User, read access to Group, and no access to Other

You can use numeric values for this:

```bash
chmod 640 testfile.txt
```

This breaks down as:
* 6: Read (4) + Write (2) = read and write for the User.
* 4: Read (4) = read-only for the Group.
* 0: No permissions for Others.

