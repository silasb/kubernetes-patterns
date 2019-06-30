# builder

FROM crystallang/crystal:0.29.0 AS builder
WORKDIR /usr/src/web
ADD . /usr/src/web
RUN shards build --production

# runtime

FROM crystallang/crystal:0.29.0 AS runner
WORKDIR /app
COPY --from=builder /usr/src/web/bin/web /app/
EXPOSE 3000
CMD /app/web
