[ -f "/sys/devices/virtual/dmi/id/product_family" ] && HOST="$(cat /sys/devices/virtual/dmi/id/product_family)" || HOST="$(awk '/Model/ {print $3,$4,$5,$6,$7,$8}' /proc/cpuinfo)"

OS="$(awk '/PRETTY_NAME/ {print $1,$2,$4}' /etc/os-release | cut -c 14-)"
ARCH="$(uname -m)"
CHAR_N="$(echo -n "$USER@$HOSTNAME" | wc -c)"
BAR="$(for ((i = 1 ; i <= $CHAR_N ; i++)); do echo -n "-" ; done)"
KERNEL="$(uname -r)"
PACKAGES="$(dpkg-query -l | wc -l)"
BASH_V="$(bash --version | awk '/GNU bash/ {print $4}')"

echo " "
echo "           ___           $USER@$HOSTNAME "
echo "        ,'    .',        $BAR"
echo "       /       \ \       OS: $OS $ARCH"
echo "      (,.,.,.,.,.,)      Host: $HOST"
echo "   ,   ) ) ) ( ( (   ,   Kernel: $KERNEL"
echo "    '-'-'-'   '-'-'-'    Packages: $PACKAGES"
echo "                         Bash: $BASH_V"
echo " "
