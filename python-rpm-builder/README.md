# Python to RPM Builder image

This image uses a patched version of `virtualenv-tools` in order to suport Python 3.x

## Building your project

You will need a wrapper script, and a makefile, or just a script if you so choose. This is just how I prefer it.

```sh
$ cat package
#!/usr/bin/env sh

source /opt/rh/rh-python36/enable

make package
```

```sh
$ cat Makefile
NAME=my_cool_package
VERSION=$(shell cat VERSION)
WHEEL=$(shell echo dist/"${NAME}-${VERSION}"*.whl)

.PHONY: package clean

package: clean
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
    rm -rf *.egg-info build/ dist/ *.rpm

package_docker:
    docker run --rm -v $$(pwd):/src py2rpm ./package
```

The usage of the `source` line is to ensure that the relevant Python 3.6 configuration items, listed below, is included into the runtime before calling out to `make` to build your RPM.

```sh
sh-4.2# cat /opt/rh/rh-python36/enable
export PATH=/opt/rh/rh-python36/root/usr/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/opt/rh/rh-python36/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export MANPATH=/opt/rh/rh-python36/root/usr/share/man:$MANPATH
export PKG_CONFIG_PATH=/opt/rh/rh-python36/root/usr/lib64/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}
export XDG_DATA_DIRS="/opt/rh/rh-python36/root/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
```

When you're ready to go, you can simply run `make package_docker` and have it spin up docker, mount your source, and run the package command inside docker which will generate your RPM.

