# Server configuration

There are some settings that cannot be configured automatically. Here's a reminder:

1. LLDAP:
    1. Create the `authelia` account, belonging to the `lldap_password_manager` group. This will be used by Authelia to interact with LLDAP.
    1. Add a display name and an email address to the master account.
    1. Create groups:
        - `admins`: Administrators of all services
        - `mealie-users`: Users of Mealie
        - `jellyfin-users`: Users of Jellyfin
        - `nextcloud-admins`: Administrators of Nextcloud
        - `nextcloud-users`: Users of Nextcloud

      Assign relevant users to these groups.
1. Authelia:
    1. Update the `AUTHELIA_LDAP_USER_PASSWORD` secret with the password of the `authelia` account created in LLDAP.
1. Nextcloud:
    1. Follow [this guide](https://www.authelia.com/integration/openid-connect/nextcloud/) to add support to OIDC.
1. Jellyfin
    1. Follow [this guide](https://www.authelia.com/integration/openid-connect/jellyfin/) to enable OIDC.

## Generating secrets

All secrets are strings composed of 64 alphanumeric characters. Use `openssl rand -hex 64` to generate new strings.
