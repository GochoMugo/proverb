#!/usr/bin/env bash
#
# Get a Proverb
#


# modules
msu_require "console"
msu_require "core_utils"


# module variables
DEPS="curl"
ENDPOINT="http://proverbs-app.antjan.us/random"


function main() {
  # ensure `curl` is installed
  has_command "curl" || {
    error "\`curl' is not installed"
    exit 1
  }

  # now let's curl
  response=$(curl --silent --show-error ${ENDPOINT} 2>&1)

  [[ "$?" == "0" ]] && {
    echo
    echo "    ${response}"
    echo
  } || {
    error "curl fucked up!"
    error "${response}"
  }
}
