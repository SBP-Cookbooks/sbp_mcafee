sbp_mcafee Cookbook
===================
This cookbook will install the McAfee-client on Windows-systems


Requirements
------------
The cookbook depends on the windows-cookbook, the client should be managed from an EPO server


Attributes
----------
default['mcafee']['agent']['package_name']      = 'McAfee Agent'
default['mcafee']['agent']['url']               = ''
default['mcafee']['virusscan']['package_name']  = 'McAfee VirusScan Enterprise'
default['mcafee']['virusscan']['url']           = ''

For the agent you'll need the FramePkg.exe and for the virusscan the av.zip.
Both files should be placed on your local repo and defined in the attributes.


Usage
-----
Just include `sbp_mcafee` in your node's `run_list`


Contributing
------------
	1. Fork the repository on Github
	2. Create a named feature branch (i.e. `add-new-recipe`)
	3. Write you change
	4. Write tests for your change (if applicable)
	5. Run the tests, ensuring they all pass
	6. Submit a Pull Request


License and Authors
-------------------
Authors: Sander van Harmelen, Ane van Straten

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
