# Gerrit LDAP to SSO SAML authentication scheme migration

[Gerrit](https://www.gerritcodereview.com) is a code review and project
management tool for Git based projects.

[OpenLDAP](https://www.openldap.org) is a free, open-source implementation
of the Lightweight Directory Access Protocol.

[Keycloak](https://www.keycloak.org) is open source Identity and Access
Management tool.

## Objective

This doument provides a step-by-step tutorial how to migrate Gerrit site
from LDAP to SSO SAML authentication provider.

In this document OpenLDAP gerrit site is migrated to Keycloak IdP that
supports SAML protocol.

## Prerequisites

- Linux or MacOS operating system
- Docker-compose is installed

## Documentation

1. Start OpenLDAP Docker image using: [docker compose file](./resources/openldap/docker-ldap.yml) 
2. Import [LDIF script](./resources/openldap/import.sh) to popuplate LDAP data, or, alternatively,
use [phpLDAPadmin](https://localhost:6443/cmd.php) to populate the data.
3. Set up gerrit site using the [LDAP config file](./resources/gerrit/gerrit_ldap.config).
4. Login to [Gerrit](localhost:8081) using this credentials: user=gerritadmin, pwd=secret.
5. First user created in Gerrit should have admin privileges.
6. Start Keycloak Docker image uing: [docker compose file](./resources/keycloak/keycloak-postgres.yml).
7. Login to [Keycloak](localhost:8081) using this credentials: user=admin, pwd=secret.
8. Import SAML2Client client into Keycloak using this [realm import file](./resources/keycloak/keycloak-realm-export.json).
9. Create user in Keycloak with the same username: gerritadmin.
10. Stop Gerrit
11. Replace gerrit authentication scheme from LDAP to HTTP_LDAP and configure saml plugin using
this [configuration file](resources/gerrit/gerrit_saml.config).
12. Start Gerrit.
13. Login to [Gerrit](localhost:8081) using this credentials: user=gerritadmin, pwd=secret.
14. Note, that the user is now authenticated against the Keycloakand not against the LDAP.
15. Congrats, you have sucessfully migrated authentication scheme in Gerrit from LDAP to SSO SAML.

