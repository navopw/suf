# Remove if exist :c
rm -rf /usr/bin/suf

# Write script into file
cat <<EOT >> /usr/bin/suf
if [ \$# -eq 1 ]; then
        if [ \$(getent passwd \$1) ]; then
                su "\$1" -c "script /dev/null"
        else
                echo '[suf] The user "'"\$1"'" does not exist!';
        fi
else
        echo "[suf] Please use for example -> suf username"
fi
EOT

# Give some rights
chmod 775 /usr/bin/suf

# Print some shit
echo " "
echo "[suf] Successfully installed! Now please use 'suf' to switch user!"
echo " "
