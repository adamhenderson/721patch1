ADDITIONAL NOTED - ADAM HENDERSON

There are numerous issues with this patch, and these were this fixes:

teamsite.tk.war
- was missing 2 jars:
	teamsite_admin.jar
	sci_hopi.jar

Fixes:
A copy of teamsite.tk.war in thi patch was copied as a backup.
The extension of the teamsite.tk.war file was changed to .zip
Open the zip in Windows Explorer and navigate into lib folder - you will drop files directly into here, so dont close
Check that both the above jars are missing, they should be missing.
1. Copy:
	FROM	C:\Interwoven\ApplicationContainer\server\default\deploy\iw-cc.war\WEB-INF\lib\teamsite_admin.jar
	To	the open Explorer window of the zip in the patch
2. Copy:
	FROM	[DIRECTORY OF 7.2.1 Patch 1]/sci_hopi.jar
	TO	the open Explorer window of the zip in the patch
3. Navigate out of the zip view
4. Change the extension back to .war


-----------------------------------------

Following is the correct steps for installing TS 7.2.1 Patch 1

Install Instructions for TeamSite and Search on Windows for 7.2.1 patch 1.
-------------------------------------------------------------------------

It is assumed that TeamSite is installed under c:\Interwoven. Please substitute depending on your installation.

Installation on TeamSite Server
------------------------------
* Stop all TeamSite services, OpenDeploy Server and IDOL Server.

* Backup the following files on the TeamSite System.

  - c:\windows\system32\drivers\iwfsd.* 
  - c:\Interwoven\TeamSite\bin\iwserver.*
  - c:\Interwoven\TeamSite\private\lib\content_center\base.tk.war
  - c:\Interwoven\TeamSite\private\lib\content_center\teamsite.tk.war
  - c:\Interwoven\TeamSite\private\lib\content_center\ccpro.tk.war
  - c:\Interwoven\TeamSite\private\lib\content_center\livesite.tk.war
  - c:\Interwoven\TeamSite\private\lib\content_center\tagui.tk.war
  - c:\Interwoven\TeamSite\private\lib\content_center\mtdialog.tk.war
  - c:\Interwoven\TeamSite\private\lib\content_center\formspub.tk.war
  - c:\Interwoven\TeamSite\private\lib\content_center\teamsite_admin.tk.war (See the Specicific steps for teamsite_admin.tk.war as we do not supply an updated one in the Patch zip package)
  - c:\Interwoven\TeamSite\cssdk\cssdkiface.jar
  - c:\Interwoven\TeamSite\cssdk\java\cssdkjava.jar
  - c:\Interwoven\TeamSite\cssdk\java\cssdk_sci.jar
  - c:\Interwoven\TeamSite\cssdk\java\sci_hopi.jar
  - c:\Interwoven\TeamSite\cssdk\java\hopi.jar
  - c:\Interwoven\ApplicationContainer\server\default\deploy\iw-cc.war\WEB-INF\lib\sci_hopi.jar
  - c:\Interwoven\ApplicationContainer\server\default\deploy\iw-cc.war\WEB-INF\lib\hopi.jar
  - <OD-Home>\userlib\rtserver.jar
  - <OD-Home>\userlib\lscsdeliveryadapter.jar
  - <LiveSiteCSAuth-home>\idol\iwlscspreviewcontent.cfg
  - <LiveSiteCSAuth-Home>/runtime/webapps/lscs/WEB-INF/lib/rtserver.jar
  - <LiveSiteCSAuth-Home>/runtime/lib/rtserver.jar
  - <LiveSiteCSAuth-Home>/runtime/lib/lscsdeliveryadapter.jar
  - <LiveSiteCSAuth-Home>/client/java/lscsclient.jar
  - c:\Interwoven\TeamSite\lib\lscsclient.jar
  - c:\Interwoven\TeamSite\lib\livesite-runtime.jar

1. After the files are backed up, overwrite all of them with the new copy from the TeamSite folder in the patch zip package.
  Make sure the ownership and permission settings match the older copy.

----------------------------------------------
Specicific steps for:  teamsite_admin.tk.war
----------------------------------------------
* After you have backed up this file, Access c:\Interwoven\TeamSite\private\lib\content_center\teamsite_admin.tk.war

* Create a temporary folder so you can copy the teamsite_admin.tk.war file into and expand it.

* Access sci_hopi.jar in /teamsite_admin.tk.war/WEB-INF/lib/sci_hopi.jar

* Replace it with the new copy from the TeamSite folder in the patch zip package. (This would require Expanding the war file, replace the sci_hopi.jar file in it and compacting it again)

         sci_hopi.jar is supposed to have the following size and timestamp:
        -rw-r--r-- 1 bsmith iw 1955007 Nov 9 2011 sci_hopi.jar 

* Move back the updated teamsite_admin.tk.war into its original location: c:\Interwoven\TeamSite\private\lib\content_center

----------------------------------------------

2. Reboot the system (This is needed for the new file system driver to take effect). 

3. custom_instantiation.cfg file which is for the Globalization, needs to be placed in the admin store in the Globalization config directory under the corresponding workflow name sub folder.

Y:\iwadmin\main\workflowModels\EDITION\IW_7.2.1\Config\Globalization_config\custom_instantiation.cfg

Y:\iwadmin\main\workflowModels\WORKAREA\iw-wa\Config\Globalization_config\custom_instantiation.cfg

Y:\iwadmin\main\workflowModels\STAGING\Config\Globalization_config\custom_instantiation.cfg

----------------------------------------------
Skip these steps 4 to Step 6 for .net preview
----------------------------------------------

4.  Edit C:\Interwoven\TeamSite\local\config\lib\content_center\livesite_customer_src\etc\conf\livesite_customer\resources\customer-teamsite-resource-config.xml

  Look for the line <property name="targetNode" value="LiveSiteRuntime"/> under the com.interwoven.livesite.deployment.model.DeploymentTarget bean element.
  Add this line before that line.
        <property name="targetName" value="LiveSiteRuntime"/>

  If you want to configure multiple production targets, then look at the sample customer-teamsite-resource-config.xml attached as part of the patch for an example of adding Staging.
  
5. Navigate to C:\Interwoven\TeamSite\local\config\lib\content_center\livesite_customer_src folder and run the following command from the command prompt.
  
  build.bat install 

----------------------------------------------
.NET Preview Steps Only (steps 6 to Step 11)
----------------------------------------------
6. Backup: 

ApplicationContainer\server\default\deploy\iw-cc.war\WEB-INF\conf\livesite\resources\teamSite-resource-config.xml 

7. Copy livesite-runtime.jar and livesite-tk.war files needed to be copied to TeamSite\iw.preview.net as part of Patch 1 steps. 

8.Edit \Interwoven\TeamSite\iw-preview.net\webroot\WEB-INF\conf\livesite_customer\resources\customer-teamsite-resource-config.xml

  Look for the line <property name="targetNode" value="LiveSiteRuntime"/> under the com.interwoven.livesite.deployment.model.DeploymentTarget bean element.
  Add this line before that line.
        <property name="targetName" value="LiveSiteRuntime"/>

  If you want to configure multiple production targets, then look at the sample customer-teamsite-resource-config.xml attached as part of the patch for an example of adding Staging.
  

9. Need to run TeamSite\iw.preview.net\update.bat to build .netpreview 

10. Restore Web.config file 

11. Run iisreset 

----------------------------------------------
12. Run iwreset -ui stop

13. Copy the following 2 files again from the patch zip package to the c:\Interwoven\ApplicationContainer\server\default\deploy\iw-cc.war\WEB-INF\lib. If this folder does not exist please create one.
  - sci_hopi.jar
  - hopi.jar
  
14. Run iwreset -ui start

15. Stop IDOL server: 
cd to  <LiveSiteCSAuth-home>/idol/ 
Run the command "iwlscspreviewcontent.exe stop"  

16. Edit the <LiveSiteCSAuth-home>/idol/iwlscspreviewcontent.cfg and add a new property field "*/contextDeployedDate" in [SetNumericFields] section.
	
    For example: 
     
    [SetNumericFields] 
    // Specify which fields are entirely numeric (or a csv of numbers) to be stored for optimised numeric matching 
    Property=NumericFields 
    PropertyFieldCSVs=*/contextDeployedDate,*/fileSize,*/LSCS_NUM_* 
	
17. Start IDOL Server: 
cd to  <LiveSiteCSAuth-home>/idol/ 
Run the command "iwlscspreviewcontent.exe start"   
	

18. Save the following 2 two zip files in the patch to C:\report_units (or a location of your choice) on the system where advanced reports is installed.
   Deployment_Leg_Manifest.zip
   Deployment_Receiver_Manifest.zip
   
19. Update the reports with the following command. Before running the commands, please update the path C:\Interwoven\ReportCenter with actual path to ReportCenter in the your installation.  
  
  C:\Interwoven\ReportCenter\install\rptctr\cfgscripts\js-import.bat --input-zip C:\report_units\Deployment_Leg_Manifest.zip --update
  C:\Interwoven\ReportCenter\install\rptctr\cfgscripts\js-import.bat --input-zip C:\report_units\Deployment_Receiver_Manifest.zip --update


Installation on TeamSite Search
------------------------------

* Stop Search Indexer and Search Server

* Backup the following files
  * <search-home>\lib\hunter_common.jar
  * <search-home>\lib\hunter_search.jar
  
* After the files are backed up, overwrite all of them with the new copy from the TeamSiteSearch folder in the patch zip package.

* Start Search Indexer and Search Server

  

Special installation instructions for IDOL based Tagging instead of Metatagger
------------------------------------------------------------------------------
This section details the steps necesary to replace Metatagger and use IDOL for getting metadata suggestions in TagUI. In 
order to achieve this functionality, additional components need to be added to the IDOL engine that ships with TeamSite 
Search.   

In addition to updating the search component we would also need to update certain components within the TeamSite 
installation.

Listed below are detailed steps to update the necessary components.

1. Updating IDOL server components 
   - Copy the idol-taxonomy (located in the idol/ folder in this package) to the TeamSite search install home.  It should 
     be a sibling to the idol directory that is already present in the TeamSite search home directory.  This new directory 
     contains all the extra components that are needed to enable taxonomies and categorization in IDOL.
   - The default port configuration are in the 9xxx range and if the default port configurations were kept when installing 
     TeamSite search, no further configuration is needed at this point.
   - There are scripts provided in the idol-taxonomy/ folder that can be used to install the components as windows services. 
   - Using this script start all the idol services.  Check the appliation.log files located under the logs directory of each component.
     Ensure that all have started correctly.

2. Adding Eduction to the TeamSite installation.
   - Eduction is software package that uses grammar files to extract specific keywords in the content.  This functionality is 
     used to suggest specific keywords like title, author etc. 
   - Copy the Eduction directory (located under the idol/ folder in this package) to some location on the TeamSite Server machine.
   - TagUI webpapp which runs in the content of the content center web application will need file system access to files located 
     in the Eduction folder.  Hence it is necessary that this folder be copied onto the server running the teamsite web application.
     One recommended location is /Interwoven/Eduction. 

3. Installing and Configuring Autonomy Collaborative Client
   - Autonomy collaborative client is used to create and administer taxonomies in IDOL.  ACC is packaged as a webapp and is installed
     within a servlet container.
   - Deploy acc.war to TeamSite JBoss.  This should be done by manually exploding the war file and copying the contents to server/default/deploy/acc.war 
   - Open this url in a browser: http://TeamSite-Server:jboss_port/acc. The default value for JBoss port is 8080.
   - A page to bootstrap ACC will open.  Enter the requested parameters:
	- Enter user name and password.  If it does not exist, please use a new name and password. 
        - Select Encrypted IDOL connection checkbox.
        - It is not necessary to enable https.
	- Search Host & Port: Hostname and port for TeamSite IDOL Content Engine (Eg. TeamSite Search Server and Port. Default port is 9000)
	- Authentication Host & Port: Hostname and port for TeamSite Community Server(Default port is 9030)
	- Catergory Host & Port: Hostname and port for TeamSite Category Server (Default port is 9020)
        - View Server is not important and can be kept to the default values.
	- Complete the bootstrap process and launch ACC application which is a Java Webstart app.

TeamSite Configuration for IDOL tagging
---------------------------------------
 
* Stop UI services (iwreset -ui stop)

* Configuration
	   - To enable the IDOL tagging solution the following configs need to be
        updated
       - In iw.cfg add a [iwidoltagger] section as follows
             
       [iwidoltagger]
        idol_tagger_installed=true
                    
       - In addition, the IDOL Tagging solution will be enabled in the tagUI resource config file
         idol-tagger-resource-config.xml
         <bean
              id="iw.cc.tagui.idol.tagger.service.config"
              parent="iw.cc.tagui.idol.service.config">
             <property name="enabled" value="true" />
         </bean>
                                                                                                      
       - Edit the spring configuration file located at `iwgethome`/../ApplicationContainer/server/defaut/iw-cc.war/WEB-INF/conf/tagui/resources/idol-tagger-resource-config.xml. Most of this configuration involved host & port configuration. 

      In this file the following beans have to be edited
    
      The authoringIdolAci.  This bean is used to configure the location of the IDOL content and category engine.
      
      <bean name="authoringIdolAci"
            class="com.interwoven.wcm.iwrr.dao.idol.authoring.AuthoringIdolACI"
            init-method="init">
            <property name="queryHost" value=IDOL_HOST/> 
            <property name="queryPort" value="9000"/>
            <property name="categoryHost" value=IDOL_HOST/> 
            <property name="categoryPort" value="9020"/>
            <property name="encrypt" value="true"/>
      </bean>

     ........
     The recognizer bean is used to configure the location of the Eduction libraries.

       <bean id="recognizer"
                class="com.interwoven.wcm.lscs.service.categorization.EductionRecognizerImpl"
                init-method="init">
        <property name="libraryPath"
                value="c:/Interwoven/Eduction/bin/edkjni.dll">
        </property>
        <property name="licenseFile"
                value="c:/Interwoven/Eduction/licensekey.dat">
        </property>
        <property name="grammarFiles">
                <list>
                        <value>c:/Interwoven/Eduction/grammar/company_eng.ecr</value>
                        <value>c:/Interwoven/Eduction/grammar/place_eng.ecr</value>
                </list>
        </property>
        <property name="entities">
                <list>
                        <value>company/name/eng</value>
                        <value>place/eng</value>
                </list>
        </property>
        </bean>
     .......

* Start UI services(iwreset -ui start)