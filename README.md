
# Section for xfreerdp

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


# Section for rename


**Assumption to rename script:** in the target directory you have only target files.
