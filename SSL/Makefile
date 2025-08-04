DIR?=ssl
C?=SG
ST?=Singapore
L?=Singapore
O?=NCS
OU?=Engg
CN?=localhost # e.g. example.com or 192.168.1.240
SAN?=DNS # or IP

.PHONY: gen-ssl

gen-ssl:
	mkdir -p ssl/$(DIR) && \
	openssl req -x509 -newkey rsa:4096 -sha256 -days 365 \
  -nodes -keyout ssl/$(DIR)/key.pem -out ssl/$(DIR)/cert.pem \
  -subj "/C=$(C)/ST=$(ST)/L=$(L)/O=$(O)/OU=$(OU)/CN=$(CN)" \
	-addext "subjectAltName=$(SAN):$(CN)" && \
	cp ssl/$(DIR)/cert.pem ssl/$(DIR)/cert.crt
