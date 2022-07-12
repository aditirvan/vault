#!/bin/sh
vault auth enable oidc

vault login _token

vault write auth/oidc/config \
oidc_client_id="_oidc_client_id" \
oidc_client_secret="_oidc_client_secret" \
default_role="default" \
oidc_discovery_url="_oidc_discovery_url"

vault write auth/oidc/role/demo \
user_claim="sub" \
allowed_redirect_uris="_allowed_redirect_uris" \
oidc_scopes="openid" \
policies=default
