# Dev Environment Setup On Windows

## Setup
* download necessary files at http://1drv.ms/1rskvEC
* run the `rubyinstaller-2.0.0-p576.exe`
  * set the path to ```c:\row\ruby200```
  * add to path
* run ```DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe```
  * set the path to ```c:\row\devkit```
* extract ```mysql-connector-c-noinstall-6.0.2-win32``` to ```c:\row``` so that you have something like
  ```
  C:\row\mysql-connector-c-noinstall-6.0.2-win32\bin

  C:\row\mysql-connector-c-noinstall-6.0.2-win32\lib
  ```
* then add ```C:\row\mysql-connector-c-noinstall-6.0.2-win32\lib``` to current %PATH%
* run ```mysql-installer-web-community-5.6.20.0.exe```
  * select server only
  * type test for password
  * after installing add the path(```C:\Program Files\MySQL\MySQL Server 5.6\bin```) to current %PATH%
  * then
    ```mysqladmin -u root -ptest password```
  * to get rid of password
* run ruby on rails console
  ```
  gem install rails --no-ri --no-rdoc

  gem install mysql2 --no-ri --no-rdoc -- with-mysql-dir=C:\row\mysql-connector-c-noinstall-6.0.2-win32
  ```
* get the following ruby file and test it (ruby test.rb)
* https://raw.githubusercontent.com/lakelse/row/master/dev/mysql_test/test.rb
* Double click and install the ImageMagick, make sure to follow the instruction on http://www.redmine.org/projects/redmine/wiki/HowTo_install_rmagick_gem_on_Windows
* bundle install should be working now.
* finally, open ```C:\row\Ruby200\lib\ruby\2.0.0``` and comment out the warn line (on windows this can be safely ignored)

## Database
```
  rake db:create
  rake db:reset
  rake db:migrate
  rake db:seed
```
## Test
* rspec will run the all test
* to manually create a test : rails generate rspec:???? name

## Release
### Assets path
* Assets (mostly SASS and CSS files) need to be updated properly in case of deploying under a subdirectory of WWWROOT.
* ```bundle exec rake assets:precompile RAILS_RELATIVE_URL_ROOT='/SUB_URI'```
### .htaccess for Passenger Phusion (or maybe Bluehost-specific thing)
```
<IfModule mod_passenger.c>
RewriteEngine On
RewriteBase /SUB_URI
Options -MultiViews
PassengerResolveSymlinksInDocumentRoot on
#Set this to whatever environment you'll be running in
RailsEnv production
RackBaseURI /SUB_URI
PassengerAppRoot THE_ABSOLUTE_PATH_OF_THE_APP
SetEnv GEM_HOME THE_ABSOLUTE_PATH_OF_THE_LOCAL_GEM_DIRECTORY
</IfModule>
``` 
