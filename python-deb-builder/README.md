# Python to Deb Builder image

## Building your project

You will need a wrapper script, and a makefile, or just a script if you so choose. This is just how I prefer it.

```sh
$ cat package
#!/usr/bin/env sh

source /opt/rh/rh-python36/enable

make package_"${1}"
```

```sh
$ cat Makefile
NAME=my_cool_project
VERSION=$(shell cat VERSION)
WHEEL=$(shell echo dist/"${NAME}-${VERSION}"*.whl)

.PHONY: package clean

package_rpm: clean
    python setup.py bdist_wheel
    fpm \
        -s virtualenv \
        -t rpm \
        --name $(NAME) \
        -v $(VERSION) \
        --iteration release \
        --virtualenv-setup-install \
        --prefix /opt/$(NAME)/virtualenv \
        $(WHEEL)

clean:
    rm -rf *.egg-info build/ dist/ *.rpm *.deb

package:
    docker run --rm -v $$(pwd):/src py2$(TYPE) ./package $(TYPE)

package_deb: clean
    python setup.py bdist_wheel
    fpm \
        -s virtualenv \
        -t deb \
        --name $(NAME) \
        -v $(VERSION) \
        --virtualenv-setup-install \
        --prefix /opt/$(NAME)/virtualenv \
        $(WHEEL)
```
