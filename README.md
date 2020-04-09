# Docker image for Puppet server based on CentOS 8

Usage 

```shell
$ docker run -d \
  -v /data/puppet/config:/etc/puppetlabs \
  -v /data/puppet/data:/opt/puppetlabs/server/data/puppetserver \
  -v /data/puppet/log:/var/log/puppetlabs/puppetserver \
  quay.io/idwrx/puppet-server
```
