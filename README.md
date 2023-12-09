# upx-docker

Dockerfile for [UPX](https://upx.github.io/) - the Ultimate Packer for eXecutables.

## build

```bash
docker build -t upx .
```

## usage

```bash
docker run --rm -v $(pwd):/data upx upx /data/yourfile
```