#!/bin/bash

set -eu

ldapsearch -LLL -Wx -D "cn=admin,dc=example,dc=org" -b "dc=example,dc=org" > example.org.ldif

