SERVICE_COMMAND="npm start"
SVC_BACKGROUND=y
SVC_WRITE_PID=y
SVC_CWD="/usr/local/lib/node_modules/node-red/"

service_postinst ()
{
        echo "<center>Installation completed<br><br></center>"
        echo "Please run the below command in the DSM task scheduler under root user in order to finalize the Node-RED installation:<br><br>"
        echo "<pre>npm install -g --unsafe-perm node-red<pre>"
}

service_postuninst ()
{
        echo "<br>Uninstall information<br><br>"
        echo "Please run the below command in the DSM task scheduler under root user<br>in order to finalize the Node-RED uninstall:<br><br>"
        echo "<pre>npm -g remove node-red<pre>"
        echo "<pre>npm -g remove node-red-admin</pre>"
        sleep 5
}

