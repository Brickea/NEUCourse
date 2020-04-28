# Mysql in Centos

- [Mysql in Centos](#mysql-in-centos)
  - [Use yum to install mysql](#use-yum-to-install-mysql)
    - [Problem - 'Failed to set locale, defaulting to C'](#problem---failed-to-set-locale-defaulting-to-c)
    - [Problem - When use ```yum localinstall``` install wrong rpm packages](#problem---when-use-yum-localinstall-install-wrong-rpm-packages)
  - [After install mysql5.6](#after-install-mysql56)
    - [Problem - Access Denied](#problem---access-denied)
    - [Connect Mysql by using workbrench](#connect-mysql-by-using-workbrench)

## Use yum to install mysql

[Reference(yum not work in centos 7)](https://dev.mysql.com/doc/refman/8.0/en/linux-installation-yum-repo.html)  
[Reference(yum work in centos7)](https://www.jianshu.com/p/7cccdaa2d177)  
[Reference(Use brew)](https://mal-suen.github.io/2018/05/27/MySQL%E5%AE%89%E5%85%A8%E8%AE%BE%E7%BD%AE%E5%91%BD%E4%BB%A4mysql_secure_installation/)

### Problem - 'Failed to set locale, defaulting to C'

Locales define language and country-specific setting for your programs and shell session. You can use locales to see the date, time, number, currency and other values formatted as per your country or language on a Linux or Unix-like system. To set system’s locale, you need use shell variable. For example, LANG variable can be used to set en_US (English US) language.

It means local values did not correctly setup on your CentOS Linux server or desktop system. The following instructions should help you to fix this problem.

To set i18n stuff CentOS/Fedora and RedHat Enterprise Linux call a special script called /etc/profile.d/lang.sh. Make sure this file exist in your system:

```$ ls -l /etc/profile.d/lang.sh```

If file exist just call it:

```$ source /etc/profile.d/lang.sh```

Verify that LANG and LC_* shell variable are set:

```$ echo "$LANG"```  
```$ echo "$LC_CTYPE"```

### Problem - When use ```yum localinstall``` install wrong rpm packages

Check if install some yum resource

```rpm -qa | grep -i repo-name```

Delete yum repo

```rpm -e repo-name``

Delete yum repo configuration 

```cd /etc/yum.repos.d/```

```rm filename```

## After install mysql5.6

```mysql_secure_installation``` to set root password

check and start the mysql

```$sudo systemctl start mysqld #CentOS 7```  
```$sudo systemctl status mysqld```

### Problem - Access Denied

Using yum will generate a ramdom password for root in error-log

Find mysql error-log in ```/etc/my.cnf```

Find first time password from error-log

### [Connect Mysql by using workbrench](MySQL/Connect%20Remote%20MySQL.md)

