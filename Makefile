encrypt:
	tar zcvf - ec2 | gpg --encrypt --recipient michael@gilt.com --recipient ionathan@gmail.com --recipient val.dumitrescu@gmail.com > metadata.tar.gz.gpg

decrypt:
	gpg metadata.tar.gz.gpg
	tar -xvf metadata.tar.gz

.PHONY: encrypt decrypt
