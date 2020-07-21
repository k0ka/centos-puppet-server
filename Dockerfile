FROM centos:8 

ENV PUPPET_VERSION="6.12.1" \
	SUMMARY="Platform for running puppet server $PUPPET_VERSION" \
	DESCRIPTION="Puppet provides tools to automate managing your infrastructure. "

LABEL \ 
	maintainer="admin@idwrx.com" \
    summary="${SUMMARY}" \
    description="${DESCRIPTION}" \
    name="idwrx/puppet-server"

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r puppet && useradd -r -g puppet puppet

RUN	dnf -y clean all &&\
    dnf -y --nodoc --setopt=install_weak_deps=false update && \
    dnf -y erase acl bind-export-libs cpio dhcp-client dhcp-common dhcp-libs \
        ethtool findutils hostname ipcalc iproute iputils kexec-tools \
        less lzo pkgconf pkgconf-m4 procps-ng shadow-utils snappy squashfs-tools \
        vim-minimal xz && \
	dnf -y autoremove && \
	dnf -y install https://yum.puppetlabs.com/puppet-release-el-8.noarch.rpm && \
	dnf -y install puppetserver-${PUPPET_VERSION}.el8 && \
	dnf -y clean all 

EXPOSE 8140/tcp


CMD ["/opt/puppetlabs/bin/puppetserver", "foreground"]
