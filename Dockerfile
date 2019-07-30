FROM alpine:latest
ENV PYTHONUNBUFFERED 1

RUN apk update

RUN apk add vim && apk add git && apk add make && apk add curl && apk add openssh && apk add nodejs && apk add yarn && apk add docker 
RUN apk add --update npm
RUN apk add bash


# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

CMD ["/bin/bash"]


