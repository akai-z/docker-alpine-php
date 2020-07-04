#!/bin/sh

set -eo pipefail

readonly SIGNATURE="baf1608c33254d00611ac1705c1d9958c817a1a33bce370c0595974b342601bd80b92a3f46067da89e3b06bff421f182"
readonly INSTALLER_URL="https://getcomposer.org/installer"
readonly SETUP_FILE="composer-setup.php"

curl -fsL --retry 3 -o "$SETUP_FILE" "$INSTALLER_URL"

php -r " \
    \$hash = hash_file('SHA384', '${SETUP_FILE}'); \
    if (!hash_equals('${SIGNATURE}', \$hash)) { \
        unlink('${SETUP_FILE}'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    } \
"

php "$SETUP_FILE" --no-ansi --install-dir=/usr/local/bin --filename=composer
rm "$SETUP_FILE"
