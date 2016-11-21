# image_resizer

An OpenResty + Imagemagick resizer based on a [Leafo](http://leafo.net/posts/creating_an_image_server.html) blog post.

Utilizing the base [docker-openresty](https://github.com/openresty/docker-openresty) image, the relevant Imagemagick package and bindings for Lua are installed.

A custom nginx.conf is copied through, along with the lua script that handles the resizing.
