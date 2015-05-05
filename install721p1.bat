cd "teamsite_admin.tk.war.dir"
"C:\Program Files\Java\jdk1.6.0_21\bin\jar.exe" xf "teamsite_admin.tk.war"
rem "teamsite_admin.tk.war\teamsite_admin.tk.war" "teamsite_admin.tk.war\teamsite_admin.tk.war.bak"
del teamsite_admin.tk.war
copy ..\sci_hopi.jar WEB-INF\lib
copy ..\hopi.jar WEB-INF\lib
copy ..\cssdk_sci.jar WEB-INF\lib

cd ..
"C:\Program Files\Java\jdk1.6.0_21\bin\jar.exe" cvf "teamsite_admin.tk.war" teamsite_admin.tk.war.dir\*
rmdir /Q /S teamsite_admin.tk.war.dir

copy /y teamsite_admin.tk.war c:\Interwoven\TeamSite\private\lib\content_center

rem Drivers
ren c:\windows\system32\drivers\iwfsd.map iwfsd.map.old
ren c:\windows\system32\drivers\iwfsd.pdb iwfsd.pdb.old
ren c:\windows\system32\drivers\iwfsd.sys iwfsd.sys.old

copy /y "32bit_driver\iwfsd.map" c:\windows\system32\drivers\ 
copy /y "32bit_driver\iwfsd.pdb" c:\windows\system32\drivers\
copy /y "32bit_driver\iwfsd.sys" c:\windows\system32\drivers\

rem IWServer
ren c:\Interwoven\TeamSite\bin\iwserver.exe iwserver.exe.old  
ren c:\Interwoven\TeamSite\bin\iwserver.map iwserver.map.old
ren c:\Interwoven\TeamSite\bin\iwserver.pdb iwserver.pdb.old

copy /y iwserver.exe  c:\Interwoven\TeamSite\bin\
copy /y iwserver.map  c:\Interwoven\TeamSite\bin\
copy /y iwserver.pdb  c:\Interwoven\TeamSite\bin\

rem WARs
copy /y "base.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "teamsite.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "ccpro.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "livesite.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "tagui.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "mtdialog.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "formspub.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "teamsite_admin.tk.war"  c:\Interwoven\TeamSite\private\lib\content_center\
copy /y "cssdkiface.jar"  c:\Interwoven\TeamSite\cssdk\
copy /y "cssdkjava.jar"  c:\Interwoven\TeamSite\cssdk\java\
copy /y "cssdk_sci.jar"  c:\Interwoven\TeamSite\cssdk\java\
copy /y "sci_hopi.jar"  c:\Interwoven\TeamSite\cssdk\java\
copy /y "hopi.jar"  c:\Interwoven\TeamSite\cssdk\java\
copy /y "sci_hopi.jar"  c:\Interwoven\ApplicationContainer\server\default\deploy\iw-cc.war\WEB-INF\lib\
copy /y "hopi.jar"  c:\Interwoven\ApplicationContainer\server\default\deploy\iw-cc.war\WEB-INF\lib\
copy /y "rtserver.jar"  C:\Interwoven\OpenDeploy\OpenDeployNG\userlib\
copy /y "lscsdeliveryadapter.jar"  C:\Interwoven\OpenDeploy\OpenDeployNG\userlib\
copy /y "iwlscspreviewcontent.cfg"  C:\Interwoven\LiveSiteCSAuth\idol\
copy /y "rtserver.jar"  C:\Interwoven\LiveSiteCSAuth\runtime\webapps\lscs\WEB-INF\lib\
copy /y "rtserver.jar"  C:\Interwoven\LiveSiteCSAuth\runtime\lib\
copy /y "lscsdeliveryadapter.jar"  C:\Interwoven\LiveSiteCSAuth\runtime\lib\
copy /y "lscsclient.jar"  C:\Interwoven\LiveSiteCSAuth\client\java\
copy /y "lscsclient.jar"  c:\Interwoven\TeamSite\lib\
copy /y "livesite-runtime.jar"  c:\Interwoven\TeamSite\lib\


cd C:\Interwoven\TeamSite\install 
install_webapps.bat -f