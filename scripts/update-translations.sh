#!/bin/bash
set -euo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."

domain=biglinux-grub-restore
sources=(
    usr/share/biglinux/grub-restore/main.py
    usr/share/biglinux/grub-restore/backend/system_interface.py
    usr/share/biglinux/grub-restore/gui/application.py
    usr/share/biglinux/grub-restore/gui/window.py
)

xgettext \
    --language=Python \
    --keyword=_ \
    --from-code=UTF-8 \
    --package-name="$domain" \
    --package-version=4.0.0 \
    --copyright-holder=BigLinux \
    --output="locale/$domain.pot" \
    "${sources[@]}"

for catalog in locale/*.po; do
    language=$(basename "$catalog" .po)
    msgmerge --no-fuzzy-matching --update --backup=none "$catalog" "locale/$domain.pot"
    msgattrib --no-obsolete -o "$catalog" "$catalog"
    if [[ "$language" == en ]]; then
        msgen -o "$catalog" "locale/$domain.pot"
        msgattrib --clear-fuzzy -o "$catalog" "$catalog"
    fi
    msgfmt --check --check-format \
        -o "usr/share/locale/$language/LC_MESSAGES/$domain.mo" \
        "$catalog"
done
