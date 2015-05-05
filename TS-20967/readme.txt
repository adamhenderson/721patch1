Install instruction:
    0. Shutdown TeamSite - everything including iwserver
    1. Backup current driver in c:\windows\system32\drivers\iwfsd.*
    2. Copy new driver files iwfsd.* to c:\windows\system32\drivers folder
    3. Reboot

Note:
    The patch contains both 32-bit and 64-bit versions:
        - amd64 folder contains driver files for 64-bit Windows
        - nti86 folder contains driver files for 32-bit Windows
