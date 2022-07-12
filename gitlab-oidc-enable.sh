#!/bin/sh
sleep 15
vault operator unseal _key
sleep 5
vault login _token
sleep 5
vault auth enable oidc
sleep 5
vault write auth/oidc/config \
oidc_client_id="_oidc_client_id" \
oidc_client_secret="_oidc_client_secret" \
default_role="default" \
oidc_discovery_url="_oidc_discovery_url"
sleep 5
vault write auth/oidc/role/default \
user_claim="sub" \
allowed_redirect_uris="_allowed_redirect_uris" \
oidc_scopes="openid" \
policies=default
