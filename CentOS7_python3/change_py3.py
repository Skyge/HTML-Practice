#运行前需要将该文件放在指定位置。
#因为yum等指令默认的python版本是python2.7，但我已经将系统默认的版本修改为python3.6，
#所以为了yum等指令仍可以使用python2.7运行，需要将其运行文件指定python版本。

def csh():
	with open("/usr/bin/yum") as file:
		data = file.readlines()
	data[0] = '#!/usr/bin/python2.7\n'
	with open("/usr/bin/yum","w") as file:
		file.writelines(data)
	with open("/usr/libexec/urlgrabber-ext-down") as file:
		data = file.readlines()
	data[0] = '#!/usr/bin/python2.7\n'
	with open("/usr/libexec/urlgrabber-ext-down","w") as file:
		file.writelines(data)

if __name__ == "__main__":
	csh()
