#!/bin/bash

# Verify the date uses the correct timezone.
docker exec --tty ${container_id} env TERM=xterm date