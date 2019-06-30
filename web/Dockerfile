# builder

FROM crystallang/crystal:0.29.0 as builder
WORKDIR /usr/src/web
ADD . /usr/src/web
RUN crystal build --release src/web.cr

# runtime

FROM crystallang/crystal:0.29.0
WORKDIR /app
COPY --from=builder /usr/src/web/web /app/
EXPOSE 3000
CMD /app/web
