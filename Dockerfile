FROM alpine:latest

ARG user=cafecat6503
ARG password=!test_tset!
ARG UID=1000

RUN apk -U upgrade
RUN apk add samba 
RUN ["/bin/bash", "echo -e '${password}\n${password}\n' | adduser -u &{UID} ${user}"]
RUN ["/bin/bash", "echo -e '${password}\n${password}\n' | pdbedit -a -u ${user}"]

ADD smb.conf /etc/samba

CMD [ "ash", "-c", "nmbd -D && smbd -F </dev/null" ]