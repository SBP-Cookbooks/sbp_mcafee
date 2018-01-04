sbp_mcafee Cookbook
===================

[![Build Status](https://travis-ci.org/sbp-cookbooks/sbp_mcafee.svg?branch=master)](https://travis-ci.org/sbp-cookbooks/sbp_mcafee) [![Cookbook Version](https://img.shields.io/cookbook/v/sbp_mcafee.svg)](https://supermarket.chef.io/cookbooks/sbp_mcafee)

This cookbook will install the McAfee-client on Windows-systems

Requirements
------------

The cookbook depends on the windows cookbook, the client should be managed from an EPO server

Attributes
----------

```ruby
default['mcafee']['agent']['package_name']      = 'McAfee Agent'
default['mcafee']['agent']['url']               = ''
default['mcafee']['virusscan']['package_name']  = 'McAfee VirusScan Enterprise'
default['mcafee']['virusscan']['url']           = ''
```

For the agent you'll need the FramePkg.exe and for the virusscan the av.zip.
Both files should be placed on your local repo and defined in the attributes.

The cookbook now also supports installation of McAfee Endpoint Security.
In order to do so set the virusscan attributes like this:

```ruby
default['mcafee']['virusscan']['package_name']      = 'McAfee Endpoint Security Platform'
default['mcafee']['virusscan']['options']           = 'ADDLOCAL="tp" /qn /nocontentupdate'
default['mcafee']['virusscan']['installer_exe']     = 'setupEP.exe'
```

Usage
-----

Just include `sbp_mcafee` in your node's `run_list`

Contributing
------------

 1. Fork the repository on Github
 1. Create a named feature branch (i.e. `add-new-recipe`)
 1. Write you change
 1. Write tests for your change (if applicable)
 1. Run the tests, ensuring they all pass
 1. Submit a Pull Request

License and Authors
-------------------

Authors: Schuberg Philis

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>
