# builder

FROM crystallang/crystal:0.29.0 AS builder

RUN apt-get update && \
		apt-get install -y --no-install-recommends curl

RUN curl -O -L https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb && \
		apt install -y --no-install-recommends ./wkhtmltox_0.12.5-1.xenial_amd64.deb && \
		rm -rf wkhtmltox_0.12.5-1.xenial_amd64.deb && \
		rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/pdf-microservice
ADD . /usr/src/pdf-microservice
RUN shards build --production

# runtime

FROM crystallang/crystal:0.29.0 AS runner
WORKDIR /app
ADD https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb /tmp
RUN apt-get update && \
		apt install -y --no-install-recommends /tmp/wkhtmltox_0.12.5-1.xenial_amd64.deb && \
		rm -rf wkhtmltox_0.12.5-1.xenial_amd64.deb && \
		rm -rf /var/lib/apt/lists/* /tmp/*.deb
COPY --from=builder /usr/src/pdf-microservice/bin/pdf-microservice /app/
EXPOSE 3000
CMD /app/pdf-microservice
