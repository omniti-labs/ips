ips Cookbook
============

The IPS cookbook exposes the `ips_publisher` resource that allows a
user to set IP publisher sources on systems that support IPS.
This usually means Oracle Solaris, and Illumos systems like OmniOS.

Requirements
------------
* Chef 11 or higher
* Ruby 1.9 (preferably from the Chef full-stack installer)

Resources/Providers
-------------------
### ips_publisher
This resource manages `pkg set-publisher` commands, and will repair
publisher settings when needed.

#### Example
# add the Zenoss repository

    ips_publisher 'OmniTI Managed Services' do
      publisher 'ms.omniti.com'
      url 'http://pkg.omniti.com/omniti-ms/'
      action :create
    end

#### Actions
- `:create` - creates a publisher
- `:delete` - deletes a publisher

#### Parameters
* `publisher` -  Must be a string value for the publisher, as consumed
  by the `pkg set-publisher` and `pkg unset-publisher` commands.
  
* `url` -  Must be a string value for the URL, as consumed by the `pkg
  set-publisher` and `pkg unset-publisher` commands.   

Usage
-----
Consume as a normal Chef resource after putting `depends 'ips'` in a cookbooks metadata.rb

License & Authors
-----------------
- Author:: Sean OMeara (<someara@getchef.com>)

```text
Copyright:: 2008-2013 Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
