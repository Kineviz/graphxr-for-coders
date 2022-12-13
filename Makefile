deploy: commit push done

commit:
	git add .
	git commit -m "$$(date)" --allow-empty

push:
	git push -u origin main

done:
	git log --graph --pretty=format:'Pushed commit %h (%cr)' --abbrev-commit | head -n 1

# This dependency is if you keep your vault in a separate directory.
# You probably won't run it.
md:
	cp -R "/Users/admin/Library/Mobile Documents/iCloud~md~obsidian/Documents/GraphXR For Coders/." .
