# File download and unzip

## File download

Open terminal and type

```wget "http://domain.com/directory/4?action=AttachFile&do=view&target=file.tgz" ```
to download the file to the current directory.

```wget  -P /home/omio/Desktop/ "http://thecanadiantestbox.x10.mx/CC.zip"```
will download the file to /home/omio/Desktop

```wget  -O /home/omio/Desktop/NewFileName "http://thecanadiantestbox.x10.mx/CC.zip"```
will download the file to /home/omio/Desktop and give it your NewFileName name.

## File unzip

```zip -r myfile.zip ./*```

to zip all file and direciton into myfile.zip base on current direction

unzip命令
```unzip -o -d /home/sunny myfile.zip```
zip myfile.zip unzip into /home/sunny/

* -o means cover file without sending messages

* -d means the file path
