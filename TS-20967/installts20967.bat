rmdir /Q /S Backup
mkdir Backup

copy c:\windows\system32\drivers\iwfsd.* Backup

rem Drivers
ren c:\windows\system32\drivers\iwfsd.map iwfsd.map.old
ren c:\windows\system32\drivers\iwfsd.pdb iwfsd.pdb.old
ren c:\windows\system32\drivers\iwfsd.sys iwfsd.sys.old

rem THESE ARE THE 32-bit DRIVERS - CHANGE PATH FOR 64-bit VERSIONS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
copy /y "nti86\iwfsd.map" c:\windows\system32\drivers\ 
copy /y "nti86\iwfsd.pdb" c:\windows\system32\drivers\
copy /y "nti86\iwfsd.sys" c:\windows\system32\drivers\

echo ********* Now Reboot System ********