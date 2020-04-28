# Manage process

- [Manage process](#manage-process)
  - [top](#top)
  - [ps](#ps)
  - [pgrep](#pgrep)

## top

The top command is the traditional way to view your system’s resource usage and see the processes that are taking up the most system resources. Top displays a list of processes, with the ones using the most CPU at the top.

To exit top or htop, use the Ctrl-C keyboard shortcut. This keyboard shortcut usually kills the currently running process in the terminal.

## ps

The ps command lists running processes. The following command lists all processes running on your system:

```ps -A```

This may be too many processes to read at one time, so you can pipe the output through the less command to scroll through them at your own pace:

```ps -A | less```

Press q to exit when you’re done.

You could also pipe the output through grep to search for a specific process without using any other commands. The following command would search for the Firefox process:

```ps -A | grep firefox```

## pstree

The pstree command is another way of visualizing processes. It displays them in tree format. So, for example, your X server and graphical environment would appear under the display manager that spawned them.

## kill

The kill command can kill a process, given its process ID. You can get this information from the ps -A, top or pgrep commands.

```kill PID```

Technically speaking, the kill command can send any signal to a process. You can use kill -KILL or kill -9 instead to kill a stubborn process.

## pgrep

Given a search term, pgrep returns the process IDs that match it. For example, you could use the following command to find Firefox’s PID:

```pgrep firefox```

## pkill & killall
The pkill and killall commands can kill a process, given its name. Use either command to kill Firefox:

```pkill firefox```

```killall firefox```

## renice

The renice command changes the nice value of an already running process. The nice value determines what priority the process runs with. A value of -19 is very high priority, while a value of 19 is very low priority. A value of 0 is the default priority.

The renice command requires a process’s PID. The following command makes a process run with very low priority:

```renice 19 PID```