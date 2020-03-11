#!/bin/sh

set -e

stack build
exec stack exec -- yesod devel
