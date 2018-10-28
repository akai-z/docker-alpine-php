#!/bin/sh

set -eo pipefail

readonly SIGNATURE="93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8"
readonly INSTALLER_URL="https://getcomposer.org/installer"
readonly SETUP_FILE="composer-setup.php"

curl -fsL --retry 3 -o "$SETUP_FILE" "$INSTALLER_URL"

php -r " \
    \$hash = hash_file('SHA384', '${SETUP_FILE}'); \
    if (!hash_equals(${SIGNATURE}, \$hash)) { \
        unlink('${SETUP_FILE}'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    } \
"

php "$SETUP_FILE" --no-ansi --install-dir=/usr/local/bin --filename=composer
rm "$SETUP_FILE"
