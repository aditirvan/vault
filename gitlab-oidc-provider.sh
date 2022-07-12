#!/bin/sh
vault auth enable oidc

vault write auth/oidc/config \
oidc_client_id="$oidc_client_id" \
oidc_client_secret="$oidc_client_secret" \
default_role="demo" \
oidc_discovery_url="$oidc_discovery_url"

vault write auth/oidc/role/demo \
user_claim="sub" \
allowed_redirect_uris="$allowed_redirect_uris" \
oidc_scopes="openid" \
policies=demo
