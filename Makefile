encrypt:
	tar zcvf - ec2 sendgrid docker.io drone ionblaster | gpg --encrypt --recipient val.dumitrescu@gmail.com -o metadata.tar.gz.gpg

decrypt:
	gpg -o - metadata.tar.gz.gpg | tar xvz

sync:  sync-cave sync-ib

sync-cave:
	aws s3 cp ionblaster/cavellc/.ionblaster.json s3://cavellc-metadata/ionblaster/cavellc/.ionblaster.json
	aws s3 cp ionblaster/cavellc/default.json s3://cavellc-metadata/ionblaster/cavellc/default.json

sync-ib:
	aws s3 cp ionblaster/ionblaster/.ionblaster.json s3://cavellc-metadata/ionblaster/ionblaster/.ionblaster.json

.PHONY: encrypt decrypt sync
