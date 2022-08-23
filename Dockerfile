FROM alpine:3.16

RUN apk add --no-cache libwebp-tools

WORKDIR /usr/share/images

RUN addgroup --system --gid 1000 user_1000 && adduser --system --uid 1000 -G user_1000 user_1000

USER user_1000

# for better qualitty of webp output you can use this instead:
# CMD ["sh", "-c", "for F in *.jpg *.jpeg *.png; do if [ -f "$F" ]; then cwebp -short -mt -m 6 -q 80 -sharp_yuv -alpha_filter best -pass 10 -segments 4 -af $F -o `basename ${F}`.webp; fi done;"]
CMD ["sh", "-c", "for F in *.jpg *.jpeg *.png; do if [ -f $F ]; then cwebp -short $F -o `basename ${F}`.webp; fi done;"]
