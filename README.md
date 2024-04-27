
## Section for 'xfreerdp' script

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




## Section for 'rename' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to rename script:**                 | The target directory contains only the files to be renamed                                           |
 
 


## Section for 'cleanup' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to cleanup script:**                | Script to optimize system performance by cleaning up unused packages and cache.                      | 


## Section for 'creating_bootable_usb' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to creating_bootable_usb script:**       | Automation for ISO writting                                                                          |


## Section for 'vite_installation_advanced' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to vite_installation_advanced script:**       | Automation for yarn create vite [ 2024/04/23 ]                                                       |


* downloading the path to the project
* downloading the project name
* installing vite
* installing dependencies and scss/sass
* removing unnecessary files
* creating components ( dir, .tsx, .scss )
* presentation of the structure
* modifying data in files
* test run


## Section for 'create_multipleFiles' script


| Important                                        | Description                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Assumption to create_multipleFiles script:**   | Script to optimize files creating process.                                                           | 


* Get directory path or use PWD
* Add a generic extension or make your own
* Change the path if needed

