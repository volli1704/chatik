# include config folder to main config file for flexible configs
EXTEND_PATH="/etc/postgresql/conf.d"
CONF_PATH="/var/lib/postgresql/data/postgresql.conf"

grep -qxF "include_dir = '${EXTEND_PATH}'" $CONF_PATH || echo "include_dir = '${EXTEND_PATH}'" >> $CONF_PATH