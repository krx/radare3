#!/bin/sh

INSTALL_PATH=/usr/bin/r3


if [[ $(id -u) != '0' || ! -n "$SUDO_USER" ]]; then 
	echo "Script must be run as root!"
	exit 1
fi

USER_HOME="$(eval echo ~$SUDO_USER)"

# Check the single dependency for r3
if ! type wine > /dev/null 2>&1;  then
    echo "Could not find wine on this system"
    echo "What, were you expecting to use the Linux version of r3? Heh, maybe you should be using r2"
    exit 1
fi

# Let's see if you gave me the path
IDADIR="$1"
if [[ ! -d "$IDADIR" ]]; then
    # You had one job damn it!

    # fine
    # Poorly attempt to find IDA myself
    idirs=("$USER_HOME/ida" "$USER_HOME/IDA" "/opt/ida" "/opt/IDA" )
    for i in "${idirs[@]}"
    do
        if [[ -d "$i"  ]]; then
            IDADIR="$i"
            break
        fi
    done
fi

if [[ ! -d "$IDADIR" ]]; then
    echo "I tried to find IDA, but it seems you installed it somewhere nobody in their right might would, so you'll just have to pass me the path instead"
    exit 1
fi


# Those damn pirates
if [[ ! -f "$IDADIR/ida.key"  ]]; then
    echo "I noticed you don't have an IDA Pro license..."
    sleep 1.5
    echo "How dare you!!"
    sleep 1.5
    echo "I should wipe your disk for this piracy, since I'm root and all, but I'll let you off easy and just not install r3"
    exit 1
fi

FOUND=
if [[ -f "$IDADIR/idaq.exe"  ]]; then
    echo -e "#!/bin/sh\ncd $IDADIR\nwine idaq.exe" > $INSTALL_PATH
    chmod 755 $INSTALL_PATH
    echo "Successfuly installed r3!"
    FOUND=1
fi

INSTALL_PATH=$(printf "%s%s" $INSTALL_PATH "x64")
if [[ -f "$IDADIR/idaq64.exe"  ]]; then
    echo -e "#!/bin/sh\ncd $IDADIR\nwine idaq64.exe" > $INSTALL_PATH
    chmod 755 $INSTALL_PATH
    echo "Successfuly installed r3x64!"
    FOUND=1
fi

if [[ -z "$FOUND"  ]]; then
    echo "Wherever you claimed to have installed IDA, you lied. There was nothing there."
    exit 1
fi

