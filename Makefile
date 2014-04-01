encrypt:
	tar zcvf - ec2 | gpg --encrypt --recipient michael@gilt.com --recipient ionathan@gmail.com --recipient val.dumitrescu@gmail.com -o metadata.tar.gz.gpg

decrypt:
	gpg -o - metadata.tar.gz.gpg | tar xv -

.PHONY: encrypt decrypt
