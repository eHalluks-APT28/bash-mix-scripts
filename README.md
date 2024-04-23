
# Section for 'xfreerdp' script

| Command                                          | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| `/multimon`                                      | Run a session for all monitors.                                                                      |
| `/f`                                             | Enable fullscreen for an individual when there is a session open only on one monitor.                |
| `xfreerdp /monitor-list`                         | See the available monitors.                                                                          |
| `/monitors:X`                                    | Run an RDP window on a specific monitor (replace `X` with the monitor number).                       |
| `/v:`                                            | ip taget pc                                                                                          |
| `/u:`                                            | target username                                                                                      |
| `/p:`                                            | password to the remote host                                                                          |
| `/network:`                                      | auto is sufficient for most connections, optionally LAN or broadband-high                            |
| `/gfx:`                                          | for improved quality and productivity during remote connection                                       |
| `/rfx:`                                          | better graphics performance                                                                          |
| `/compression:`                                  | sharing the clipboard between the remote and the local system                                        |
| `/drive:`                                        | Maps a local drive or directory as a network drive in a remote session,                              |


**Note:** Monitor numbers may not always match those set in the system

**MAN:** more information at: https://manpages.ubuntu.com/manpages/focal/man1/xfreerdp.1.html




# Section for 'rename' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to rename script:**                 | The target directory contains only the files to be renamed                                           |
 
 


# Section for 'cleanup' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to cleanup script:**                | Script to optimize system performance by cleaning up unused packages and cache.                      | 


# Section for 'creating_bootable_usb' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to creating_boot... script:**       | Automation for ISO writting                                                                          |


# Section for 'vite_installation_advanced' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to vite_installation_advanced script:**       | Automation for yarn create vite [ 2024/04/23 ]                                                       |


```js
 
 1. downloading the path to the project
 2. downloading the project name
 3. installing vite
 4. installing dependencies and scss/sass
 5. removing unnecessary files
 6. creating components ( dir, .tsx, .scss )
 7. presentation of the structure
 8. modifying data in files
 9. test run
 
```




