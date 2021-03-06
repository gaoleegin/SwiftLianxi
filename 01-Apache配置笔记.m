配置Apache服务器，目的：有一个自己专属的测试环境

需要做几件事情

1. 新建一个目录，存放我们的网页
	注意：不能将目录放在桌面或者文档等个人文件夹中
	/Users/apple/Sites
2. 修改Apache配置文件，httpd.conf
－修改两个目录
－10.10 需要增加一个属性
－支持php脚本
3.	拷贝php.ini

// $ 开头的命令都可以直接复制
# 配置 httpd.conf
# 切换目录
$ cd /etc/apache2
# 查看当前工作目录
$ pwd
# 查看当前目录内容
$ ls
# 备份配置文件
# 提示，终端命令都要有空格
# - 执行系统管理员的命令时，需要输入sudo 
# - 使用终端操作，没有办法撤销
# 注意：这条命令只需要执行一次！！！
$ sudo cp httpd.conf httpd.conf.bak

*** 如果配置过程中出现错误可以用以下命令恢复 配置文件
$ sudo cp httpd.conf.bak httpd.conf

*** 关闭中文输入法
# 编辑 httpd.conf，以下就不能粘贴了
$ sudo vim httpd.conf

# 查找 DocumentRoot
/DocumentRoot

将以下两行中的目录，替换成在Finder中新建的目录
DocumentRoot "/Library/WebServer/Documents"
<Directory "/Library/WebServer/Documents">

# 进入编辑模式
i

# 继续向下，按向下键，不要用鼠标

找到 
Options FollowSymLinks Multiviews

加一个单词

Options Indexes FollowSymLinks Multiviews

# 按键盘左上角的 ESC 键，进入命令模式

# 查找php

/php

# 将光标移动到行首，进入编辑模式
i
# 将行首的 # 删除

# 按键盘左上角的 ESC 键，进入命令模式

# 保存退出，一定要在命令模式下输入
:wq

$ sudo cp /etc/php.ini.default /etc/php.ini

# 启动apache服务器
$ sudo apachectl -k start
# 停止apache服务器
$ sudo apachectl -k stop
# 重新启动apache服务器
$ sudo apachectl -k restart

通常会有一个提示

AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using Teacher.local. Set the 'ServerName' directive globally to suppress this message

注意，只有出现这个提示，可以忽略！

测试 Apache 服务器

在浏览器地址栏输入 127.0.0.1

安装过程中，可能出现的问题：

1. 由于不熟悉，vim里面感觉自己做了什么不应该做的，一定不要保存
# 不保存退出
:q!

2. 在输入sudo的时候，会要求输入密码
如果开机没有密码，是不允许使用sudo的

打开“系统偏好”“用户群租”“更改密码”

3. 如果配置完成之后，提示没有权限访问，绝大多数目录写错了

4. 如果点击“php”，出现“下载”或者显示php的源文件内容
说明php没有配置成功！

－没有打开httpd.conf中php一行的注释
－没有拷贝php.ini

如果以上俩个步骤都完成了，还不行可以将Apache停止一下，然后再启动
# 停止apache服务器
$ sudo apachectl -k stop

# 启动apache服务器
$ sudo apachectl -k start

5. Apache是一个服务器，为了保证用户的安全，每次重新启动计算机Apache不会自动启动
需要进入终端，手动启动一次

# 启动apache服务器
$ sudo apachectl -k start

========================================
Apache服务器实际上就是一个程序，能够提供http访问的服务，配置之后，用户就可以使用浏览器访问本地的网页服务！

Tomcat是Apache的一个应用服务扩展，主要是Java,JSP用来开发Web应用使用的

后续的课程会给大家讲：
－PUT上传，特点：文件大小没有限制
－HTTPS，安全访问，安全证书，在整个网络访问过程中，是需要加密的

Apache是一个使用最为广泛的Web服务器，被用于 UNIX, LINUX, Windows

再次提醒，不要浪费一分钟时间去学习vim！
