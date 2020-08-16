FROM alpine

ARG user=cafecat6503
ARG password=!test_tset!

RUN apk -U upgrade
RUN apk add samba 
RUN echo -e '${password}\n${password}\n' | adduser ${user}
RUN echo -e '${password}\n${password}\n' | pdbedit -a -u ${user}

ADD smb.conf /etc/samba

CMD [ "bash", "-c", "nmbd -D && smbd -F </dev/null" ]