encrypt:
	tar zcvf - ec2 docker.io drone ionblaster | gpg --encrypt --recipient michael@gilt.com --recipient ionathan@gmail.com --recipient val.dumitrescu@gmail.com -o metadata.tar.gz.gpg

decrypt:
	gpg -o - metadata.tar.gz.gpg | tar xvz -

sync:
	aws s3 sync . s3://gilt-metadata-cavellc --sse --exclude "*" --include "ionblaster/*"

.PHONY: encrypt decrypt sync
