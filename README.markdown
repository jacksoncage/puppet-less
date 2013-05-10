less
====


Overview
--------

The less module installs and manages less application.


Module Description
-------------------

The less module allows Puppet to install less application.

Install
-------

Run this code on your puppet node using the Puppet Module Tool:

	puppet module install jacksoncage/less

Clone from github:

	cd /etc/puppet/modules/
	git clone git://github.com/jacksoncage/puppet-less.git

Setup
-----

To setup less application on a server

    class { "less":
      autoupdate => false,
    }

Usage
------

    class { less:
      ensure     => running,
      autoupdate => true,
    }

The `less` class has several parameters to assist configuration of the ntp service.

**Parameters within `less`**

####`autoupdate`

This parameter is used to determine whether the ntp package will be updated automatically or not.

####`enable` 

This parameter allows you to choose whether to automatically start ntp daemon on boot.


Limitations
------------

This module has been built and tested using Puppet 2.7, and 3.x.

The module has been tested on:

* Debian 7.0 
* CentOS 6.4.

Testing on other platforms has been light and cannot be guaranteed. 
