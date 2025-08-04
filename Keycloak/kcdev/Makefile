KC?=keycloak
KC_REALM?=kcdev
KC_OUT_PATH?=/opt/keycloak/data/export
OUT_PATH?=kecylaok/$(KC_REALM)
KC_IMPORT_PATH?=keycloak/import

.PHONY: kc-export

kc-export:
	docker exec $(KC) /opt/keycloak/bin/kc.sh export --dir $(KC_OUT_PATH) --realm $(KC_REALM) --users realm_file && \
	mkdir -p $(OUT_PATH) && \
	docker cp $(KC):$(KC_OUT_PATH)/$(KC_REALM)-realm.json $(OUT_PATH)/realm-export.json && \
	mkdir -p $(KC_IMPORT_PATH) && \
	cp $(OUT_PATH)/realm-export.json $(KC_IMPORT_PATH)
