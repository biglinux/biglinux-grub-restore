#!/bin/bash
set -Eeuo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

parse_arguments "$@"
[[ -n "$ROOT_PARTITION" ]] || fail "System partition was not provided."
abort_prepare() {
    local status=$1
    trap - ERR INT TERM
    cleanup_mount_tree || true
    exit "$status"
}
trap 'abort_prepare $?' ERR
trap 'abort_prepare 130' INT
trap 'abort_prepare 143' TERM
show_progress "Preparing the installed system"
mount_filesystems
log_message "Chroot environment prepared successfully."
