#!/bin/bash

# fehlix 29.06.2018
# mx-edit-as-root.sh

# opens user's mime-default text-editor as root
# option -e <EDITOR> : overrides default

P=$(readlink -f $0 ) # PROG

## for option -e 
unset E
while getopts "e:" opt; do
	case $opt in
		e)  E=$OPTARG   ;; #  EDITOR
	esac
done
shift $((OPTIND-1))
# do we have default editor 
[ -z "$E" ] && { 
	MIME_DEFAULT=$(xdg-mime query default text/plain)
	E=$(sed -nE '/^Exec=/{s/Exec=//;s/\s+.*//;p;q}' 2>&- {/home/$USER/.local,/usr{/local,}}/share/applications/${MIME_DEFAULT}) 
    echo $E
}

EDITOR=$(command -v "$E") || exit
echo $EDITOR

##launch editor

su-to-root -X -c "$EDITOR $@" 2>/dev/null

exit
