# Basic Operation

## Checkout system version

If I need to know what it is say Linux/Unix , 32/64 bit

```uname -a``` 
This would give me almost all information that I need,

If I further need to know what release it is say (Centos 5.4, or 5.5 or 5.6) on a Linux box I would further check the file ```/etc/issue``` to see its release info ( or for Debian / Ubuntu ```/etc/lsb-release``` )

Alternative way is to use the lsb_release utility:

```lsb_release -a```

Or do a ```rpm -qa | grep centos-release``` or ```redhat-release``` for RHEL derived systems

In centos, use

```vi /etc/os-release```