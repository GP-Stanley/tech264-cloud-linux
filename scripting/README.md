# Table of Contents
add an auto table of contents to md file: Ctrl+shift+p then search for what you want.

- [Table of Contents](#table-of-contents)
- [Basic Linux Commands](#basic-linux-commands)
- [Scripting](#scripting)
  - [Scripting vs programming](#scripting-vs-programming)
  - [The difference between programming + scripting](#the-difference-between-programming--scripting)
- [Scripting vs Programming](#scripting-vs-programming-1)
  - [Key Differences:](#key-differences)
  - [Scripting](#scripting-1)
  - [Programming](#programming)
- [How to Run Python Scripts from the Command Line](#how-to-run-python-scripts-from-the-command-line)
  - [How to run Python scripts from the cmd line + how arguments work](#how-to-run-python-scripts-from-the-cmd-line--how-arguments-work)
- [Understanding Arguments in Python Scripts](#understanding-arguments-in-python-scripts)


# Basic Linux Commands 
* `ls`: lists the contents of the current directory.
* `cd`: changes the current directory.
* `pwd`: prints the working directory (shows where you are).
* `touch`: creates an empty file.
* `cat`: displays the contents of a file.
* `mv`: moves or renames files or directories.
* `cp`: copies files or directories.
* `rm`: removes files or directories.
* `ls --help`: used with command-line utilities to display usage information or a help guide for that command.
* `ls -a`: The -a option with the ls command lists all files, including hidden files and directories (those starting with a dot .).
* `touch --`: The -- in a command is often used to signify the end of command options, meaning that anything after -- is treated as a file name, even if it starts with a -.
* `cd ..`: changes the directory to the parent directory (moves up one level in the directory structure).
* `cd ../..`: changes the directory up two levels in the directory structure.



# Scripting

## Scripting vs programming
^^ in terms of the diagram: Programming circle surrounds/encompasses scripting circle.

## The difference between programming + scripting

# Scripting vs Programming

In simple terms, **programming** is a broader concept, while **scripting** is a subset within programming. Think of programming as a large circle that encompasses scripting as a smaller circle within it.

## Key Differences:

| Aspect            | Scripting                                 | Programming                                |
|-------------------|-------------------------------------------|--------------------------------------------|
| **Complexity**     | Simpler, often focusing on smaller tasks  | More complex, involves larger applications |
| **Purpose**        | Automates repetitive or routine tasks     | Used to develop full applications, games, etc. |
| **Execution**      | Typically executed by an interpreter      | Can be interpreted or compiled before execution |
| **Development Cycle** | Shorter, faster iterations              | Longer and more involved (includes design, development, and testing) |
| **Learning Curve** | Easier to learn, with fewer concepts      | Requires deeper knowledge of software design patterns and system architecture |

## Scripting
- **Complexity:** Scripting languages tend to be simpler, designed for quick automation of tasks such as file manipulation or system monitoring.
- **Purpose:** The goal is typically to automate routine tasks.
- **Execution:** Scripts are usually run by an interpreter (e.g., Python, Bash).
- **Development cycle:** Scripting has a shorter development cycle, meaning faster iterations and changes.
- **Learning curve:** Scripting languages like Python, Ruby, or Bash are often easier for beginners to pick up.

## Programming
- **Complexity:** Programming typically involves more intricate logic, data structures, and algorithms.
- **Purpose:** It's used to develop full-scale applications such as games, operating systems, or large business solutions.
- **Execution:** Programming languages can be either interpreted (Python, JavaScript) or compiled (C++, Java).
- **Development cycle:** The development process is often part of a more formal Software Development Life Cycle (SDLC), which includes design, development, testing, and deployment.
- **Learning curve:** Programming requires a more in-depth understanding of concepts like data structures, algorithms, and software design patterns.

---

# How to Run Python Scripts from the Command Line

To run Python scripts from the command line, follow these steps:

1. **Open the Command Line Interface:**
   - On Windows, open the Command Prompt.

2. **Navigate to the directory where your Python script is located:**
   ```bash
   bash
   cd path/to/your/script
   # For example
   python test_for_args.py hello
   ```

3. Run the Python script using the python command
   

## How to run Python scripts from the cmd line + how arguments work
To run a python script: python .\test_for_args.py hello
test = sys.argv[0]
hello = sys.argv[1]
interpret = python
name of the python script : .\test_for_args.py
arguments from the user: hello

# Understanding Arguments in Python Scripts
In Python, command-line arguments are stored in the `sys.argv` list, which is part of the sys module.
The first element, `sys.argv[0]`, is the name of the Python script.
Any subsequent elements are the arguments passed to the script.
```python
# for example, in python:
import sys

script_name = sys.argv[0]
argument1 = sys.argv[1]

print(f"Script name: {script_name}")
print(f"First argument: {argument1}")

# Running this command:
python test_for_args.py hello

# Would output:
Script name: test_for_args.py
First argument: hello
```








