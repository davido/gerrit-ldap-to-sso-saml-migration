#!/bin/bash

set -eu

ldapmodify -Wx -D "cn=admin,dc=example,dc=org" -a -f example.org.ldif

