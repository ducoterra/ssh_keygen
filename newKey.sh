if [ ! -d /home/$USER/.ssh/priv_keys ]
then
    mkdir /home/$USER/.ssh/priv_keys
fi
echo $'\r'$'\r' >> /home/$USER/.ssh/authorized_keys
if [ $# -eq 1 ]
then
    ssh-keygen -t rsa -C $1 -N "" -f /home/$USER/.ssh/$1-$HOSTNAME
else
    ssh-keygen -t rsa -C $1 -N $2 -f /home/$USER/.ssh/$1-$HOSTNAME
fi
cat /home/$USER/.ssh/$1-$HOSTNAME.pub >> /home/$USER/.ssh/authorized_keys
rm /home/$USER/.ssh/$1-$HOSTNAME.pub
mv /home/$USER/.ssh/$1-$HOSTNAME /home/$USER/.ssh/priv_keys
