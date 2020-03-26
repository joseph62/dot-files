#! /usr/bin/env bash
echo 'Running installation scripts...'
ls installation_scripts | xargs -I '{}' bash 'installation_scripts/{}'
echo 'Installation scripts completed!'
