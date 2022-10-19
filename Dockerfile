FROM ubuntu:20.04

RUN apt-get update && apt-get install -y nginx

RUN mkdir fun/

WORKDIR fun

RUN pwd

CMD ["bash"]

COPY README.md .

ADD index.html .

RUN cat index.html > "Persistent"

EXPOSE 8085
