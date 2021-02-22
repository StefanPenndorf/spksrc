MQ_BIN=${SYNOPKG_PKGDEST}/lib/rabbitmq_server-3.8.12/sbin
SERVICE_COMMAND="${MQ_BIN}/rabbitmq-server"
SVC_CWD="${SYNOPKG_PKGDEST}"
SVC_BACKGROUND=y
SVC_WRITE_PID=y

# HOME to place the erlang cookie into
export HOME=${SYNOPKG_PKGDEST}

service_postinst ()
{
    sed -i 's/SYS_PREFIX\=/SYS_PREFIX\=\/var\/packages\/rabbitmq\/target\//g' ${MQ_BIN}/rabbitmq-defaults
}



