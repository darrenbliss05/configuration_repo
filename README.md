Introduction
The repository represents an effort to learn puppet. The goal is to work on 
continuously improving how to setup and manage a enviroment with puppet. 

There are a lot of puppet modules on puppetforge that I have yet to even 
discover. My goal is to continue to learn about puppet, the puppet forge
puppet modules, learn how to create complex puppet modules, and to keep up
with the puppet community. 

Puppet Environment Management
This puppet environment uses this github repository has the source for puppet environments. The two puppet servers in the environment each have r10K setup to pull from this github repository. 

The Puppetfile used by r10k currently pulls modules from puppetforge for 
standard modules and from my local gitlab server for custom created modules. In
the future I will also being adding some custom modules into my github area. 

As of Aug 2016 the puppet masters are being updated by a cron script that runs 
'r10k puppetfile check' on the production environment to ensure at least a small
measure of testing. This is clearly not enough testing. Better testing is needed 

Use of Roles and Profiles
The main concept is that I wanted every system configured to use puppet roles
and profiles. This enviroment uses the site directory structure to store roles
and profiles 

examples:
 <environment>/site/role/manifests/gitlab.pp
 <environment>/site/role/manifests/cdev/database.pp
 <environment>/site/role/manifests/cpw/database.pp

 <environment>/site/profile/manifests/base.pp  
 <environment>/site/profile/manifests/gitlab.pp  
 <environment>/site/profile/manifests/mysql.pp  

To maintain consistenty across all roles the base profile (base.pp) 
is included in all roles. This provides a common place to define and 
control all common modules and configurations. Any node specific data
should never be put into roles or profiles. The current state is that this
information is pulled from hiera

How Hiera is configured

Hiera currently stores node specific information in yaml files in the 
node directory, a file for each node.

The hiera node yaml files are only meant to include the role for the node. These
files should never directly include modules or profiles. There is currently
nothing to prevent someone from directly including modules or profiles. 

The common.yaml file contains an entry to install profile::base to make sure 
that at least the base level of modules are installed. 

The use of ENC for assigning a node to a class (ie role) seems like the way to 
go for large environments. I will be looking at ENC in the future.

Future plans
There are a number of areas to explore such as ENC, mcollective, puppetdb,
puppet strings, Jenkins for module and environment testing. There are also a
lot of modules available on puppetforge to explore as well. 

My next objective is to learn ruby, expand on writing modules, and
explore puppet testing (rspec-puppet, rspec-system, serverspec,
puppetlabs-spec-helper)





