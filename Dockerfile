FROM caddy:2.3.0-builder-alpine AS builder

RUN xcaddy build \
	--with github.com/greenpau/caddy-auth-portal@latest \
	--with github.com/greenpau/caddy-auth-jwt@vlatest

FROM caddy:2.3.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY /root/ /
