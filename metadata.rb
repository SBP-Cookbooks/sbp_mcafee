name             'sbp_mcafee'
maintainer       'Schuberg Philis'
maintainer_email 'cookbooks@schubergphilis.com'
license          'Apache-2.0'
description      'Installs/Configures McAfee'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.10'
chef_version     '>= 12.6' if respond_to?(:chef_version)

source_url 'https://github.com/sbp-cookbooks/sbp_mcafee'
issues_url 'https://github.com/sbp-cookbooks/sbp_mcafee/issues'

supports 'windows'

depends 'windows', '>= 1.30.0'
