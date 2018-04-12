FROM openjdk:8-alpine

# add run dependencies
RUN set -e \
	&& runDeps=' \
		git \
		bash \
		docker \
		tar \
		gzip \
		ca-certificates \
	' \
	&& apk add --no-cache --virtual .rundeps $runDeps

# add java dependencies
RUN set -e \
	&& javaDeps=' \
		maven \
	' \
	&& apk add --no-cache --virtual .javadeps $javaDeps

# add kubectl
ARG KUBECTL_VERSION=1.9.3
RUN set -e \
	&& wget -cq -O \
		/usr/bin/kubectl \
		https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
	&& chmod +x /usr/bin/kubectl
