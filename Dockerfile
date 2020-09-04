FROM alpine:latest

ARG user=cafecat6503
ARG password=!test_tset!
ARG UID=1000

RUN apk update --no-cache && apk upgrade
RUN apk add samba --no-cache
RUN adduser -S ${user} -u ${UID}
RUN echo "${user}:${password}" | chpasswd
RUN echo -e '${password}\n${password}\n' | pdbedit -a -u ${user}

ADD smb.conf /etc/samba

CMD nmbd -D && smbd -FS --no-process-group