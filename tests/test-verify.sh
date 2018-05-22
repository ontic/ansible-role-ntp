#!/bin/bash
# Copyright (c) Ontic. (http://www.ontic.com.au). All rights reserved.
# See the COPYING file bundled with this package for license details.

# Verify the date uses the correct timezone.
docker exec --tty ${container_id} env TERM=xterm date