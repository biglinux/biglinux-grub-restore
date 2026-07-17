#!/bin/bash
set -Eeuo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

parse_arguments "$@"
show_progress "Cleaning up the recovery session"
sync
cleanup_mount_tree
log_message "Chroot cleanup finished."
