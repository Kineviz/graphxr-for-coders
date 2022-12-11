deploy: md commit push

md:
	cp -R "/Users/admin/Library/Mobile Documents/iCloud~md~obsidian/Documents/GraphXR For Coders/." .

commit:
	git add .
	git commit -m "docs"

push:
	git push -u origin main