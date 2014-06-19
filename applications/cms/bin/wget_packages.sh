#!/usr/bin/env sh

CURRENT_DIR=$(readlink -m $(dirname $0))

HONEYBEE_WGET_PACKAGES=$(readlink -m "${CURRENT_DIR}/../vendor/berlinonline/honeybee/bin/wget_packages.sh")

# always download packages that honeybee needs (except for specified other file)
if [ -z "$WGET_PACKAGES_FILE" ] ; then
    $HONEYBEE_WGET_PACKAGES
else
    echo "[INFO] Custom wget package file given. Not downloading honeybee specific files."
fi

if [ -z "$APPLICATION_DIR" ] ; then
    APPLICATION_DIR=$(readlink -m "${CURRENT_DIR}/../")
fi

if [ -z "$WGET_PACKAGES_FILE" ] ; then
    WGET_PACKAGES_FILE=$(readlink -m "${APPLICATION_DIR}/vendor/package.txt")
fi

# download packages for this application (if existant)
if [ -f $WGET_PACKAGES_FILE ] ; then
    . $HONEYBEE_WGET_PACKAGES
else
    echo "[INFO] No packages to download via wget for this application or file not found:" $WGET_PACKAGES_FILE
fi

