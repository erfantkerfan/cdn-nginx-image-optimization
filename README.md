# Image Optimization with Nginx

## WHY?

because we are all slaves to SEO! and also we want a fast website, right?

## How to run?

there is a `docker-compose.yml` file which you can use to run your tests.

## Capabilities:

1. allows you to use `webp` format when it is supported by user and also available on storage

2. allows you to resize images on the fly

## How to use?

1. ### local_storage mode:

    you must visit one of these urls :

    `http://localhost:80/1.jpg`

    `http://localhost:80/2.jpg`

    `http://localhost:80/3.png`

    if there is a webp file and also if your browser supports it, then you are served with a webp file otherwise the original image is served, therefore you can play with it like deleting the original file or deleting the webp file.

2. ### S3_storage mode:

    firt you must visit the `Minio` console dashboard at `http://localhost:8900` (user: `root` , password: `password` ) and create a bucket, after creating that go ahead and change its setting from private to public so you can access its content.
    now go ahead and upload some images to this bucket from `local_storage` folder and like before you can play with having only some of those files.
    if you uploaded sample images you vist these links assuming you named your bucket `image` :

    `http://localhost:81/image/1.jpg`

    `http://localhost:81/image/2.jpg`

    `http://localhost:81/image/3.png`

## Some notes:

1. I assumed that every `webp` file is beside the original file with a suffix of `.webp` like `abcd.png` and `abcd.png.webp` .

2. there are 2 modes, port `80` for serving images on local storage and port `81` which assumes taht you are implementing some kind of proxy service for `amazon S3` or other S3 compatible storages like `Minio` (which I used for this project) or something else like a user-facing public CDN 🤯.

3. this is my best guess for how CDN providers are enabling you to just flip a switch and have webp images on your website (obviously they handle converting and then storing the webp themselves).

## How to convert my images to webp?

I have a simple way, here you go. (converts jpg jpeg png files in `local_storage` folder)

`docker build -t webp-convertor .`

`docker run --rm -v $(pwd)/local_storage:/usr/share/images webp-convertor`

---
*you are more than welcome to any contribution*

*the time I spent on this project was sponsored by my employer at the time: [Vandar](https://github.com/vandarpay)*
