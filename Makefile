NAME=SciPass
VERSION=1.0.2

rpm:	dist
	rpmbuild -ta dist/$(NAME)-$(VERSION).tar.gz
	rm -rf dist

clean:
	rm -rf dist/$(NAME)-$(VERSION)
	rm -rf dist

test:
	cd python; coverage run --source=./ --omit=__init__.py,Ryu.py,*Test.py,t/SciPass.py t/Test.py; coverage report -m; coverage xml;coverage annotate; coverage html;

dist:
	rm -rf dist/$(NAME)-$(VERSION)
	mkdir -p dist/$(NAME)-$(VERSION)
	cp -r etc/ python/ perl/ SciPass.spec dist/$(NAME)-$(VERSION)/
	cd dist; tar -czvf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)/ --exclude .svn
