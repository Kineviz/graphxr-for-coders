all: deploy

copy-markdown:
	cp -R "/Users/admin/Library/Mobile Documents/iCloud~md~obsidian/Documents/Everything/GraphXR For Coders/." "./GraphXR For Coders/"

commit:
	git commit -a -m "docs"

push:
	git push -u origin main

deploy: copy-markdown commit push
