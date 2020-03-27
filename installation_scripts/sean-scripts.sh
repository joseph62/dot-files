#! /usr/bin/env bash
echo "Installing Sean's scripts..."

. installation_scripts/installation-functions.sh

git clone https://github.com/joseph62/Scripts /tmp/Scripts

create-directory-if-not-exists ~/bin

copy-all-script-files () {
	for script in $(find $1 -type f); do
		name=$(basename $script)
		update-file $script ~/bin/$name $name
		chmod +x ~/bin/$name
	done;
}

copy-all-script-files /tmp/Scripts/pyscripts
copy-all-script-files /tmp/Scripts/shscripts
rm -r /tmp/Scripts

echo "Installed Sean's scripts"

