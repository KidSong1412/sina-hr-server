# sina-hr-server
新浪HR简历管理CMS系统后端部分<br />
文档地址：[https://www.kancloud.cn/ghost_king/sina](https://www.kancloud.cn/ghost_king/sina)
## 版本
ThinkPHP 5.1
## Server 端必备环境
* 安装MySQL（version： 5.7+）
* 安装PHP环境(version： 7.1+)
## 安装依赖包
执行命令前请确保你已经安装了composer工具
```bash
# 进入项目根目录
cd sina-hr-server
# 先执行以下命令，全局替换composer源，解决墙的问题
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
# 接着执行以下命令安装依赖包
composer install
```
## 数据库配置
需要你自己在 MySQL 中新建一个数据库，名字由你自己决定。例如，新建一个名为` sina_hr `的数据库。接着，我们需要在工程中进行一项简单的配置。使用编辑器打开工程根目录下``/config/database.php``，找到如下配置项：

```php
// 服务器地址
  'hostname'        => '',
// 数据库名
  'database'        => 'sina_hr',
// 用户名
  'username'        => 'root',
// 密码
  'password'        => '',
  
  //省略后面一堆的配置项
```
## 导入数据
接下来使用你本机上任意一款数据库可视化工具，为已经创建好的`sina_hr`数据库运行sina-hr-server根目录下的`sina_hr.sql`文件，这个SQL脚本文件将会为你生成项目的数据库表和数据。
## 运行
如果前面的过程一切顺利，项目所需的准备工作就已经全部完成，这时候你就可以试着让工程运行起来了。在工程的根目录打开命令行，输入：
```bash
php think run --port 5000 //启动thinkPHP内置的Web服务器
```
启动成功后会看到如下提示：
```php
ThinkPHP Development server is started On <http://127.0.0.1:5000/>
You can exit with `CTRL-C`
```
打开浏览器，访问``http://127.0.0.1:5000``，你会看到一个欢迎界面，至此，sina-hr-server部署完毕，可搭配[sina-hr-surface]()使用了。
