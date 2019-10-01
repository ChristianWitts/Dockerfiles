# Dockerfiles
A home for my dockerfiles

All `Dockerfile`'s are linted with [hadolint](https://github.com/lukasmartinelli/hadolint) to ensure best practices.

| Name | Purpose | Implemented |
| ---- | ------- | ----------- |
| [image_resizer](./image_resizer) | Easy image transformations | <ul><li>nginx</li><li>OpenResty</li><li>Imagemagick</li><li>Luajit</li><li>S3</li></ul> |
| [python-rpm-builder](./python-rpm-builder) | Convert a Python project to a shippable RPM | |
