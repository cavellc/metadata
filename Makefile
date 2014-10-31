encrypt:
	tar zcvf - ec2 sendgrid docker.io drone ionblaster | gpg --encrypt --recipient val.dumitrescu@gmail.com --recipient praszewski@gilt.com -o metadata.tar.gz.gpg

decrypt:
	gpg -o - metadata.tar.gz.gpg | tar xvz

sync:
	aws s3 sync . s3://gilt-metadata-cavellc --sse --exclude "*" --include "ionblaster/*"

sync-cave:
	aws s3 cp ionblaster/cavellc/.ionblaster.json s3://cavellc-metadata/ionblaster/cavellc/.ionblaster.json

.PHONY: encrypt decrypt sync
