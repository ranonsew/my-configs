docker exec keycloak /opt/keycloak/bin/kc.sh export \
  --dir=/opt/keycloak/data/export \
  --realm osquery-realm \
  --users realm_file

docker cp keycloak:/opt/keycloak/data/export/osquery-realm-realm.json ./keycloak/realm-export.json