#运行前需要将该文件放在指定位置，内容是修改yum等系统默认的python版本，由2.7改为3.6

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