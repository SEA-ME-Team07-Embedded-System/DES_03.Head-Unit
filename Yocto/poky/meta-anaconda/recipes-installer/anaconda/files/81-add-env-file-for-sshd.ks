%post
sed -i '/^ExecStart=/iEnvironmentFile=-/etc/default/sshd-permitrootlogin' /lib/systemd/system/sshd@.service
%end
