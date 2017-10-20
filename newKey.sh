# USAGE
# newKey.sh keyname password
#
# EXAMPLES
# newKey.sh laptop
# newKey.sh laptop supersecret

# if there is not already a .ssh/priv_keys directory, create one
if [ ! -d /home/$USER/.ssh/priv_keys ]
then
    mkdir /home/$USER/.ssh/priv_keys
fi

# append two returns to authorized_keys
echo $'\r'$'\r' >> /home/$USER/.ssh/authorized_keys

# check if we need to generate the key with a password
if [ $# -eq 1 ]
then
    ssh-keygen -t rsa -C $1 -N "" -f /home/$USER/.ssh/$1-$HOSTNAME
else
    ssh-keygen -t rsa -C $1 -N $2 -f /home/$USER/.ssh/$1-$HOSTNAME
fi
# append the new key to authorized_keys
cat /home/$USER/.ssh/$1-$HOSTNAME.pub >> /home/$USER/.ssh/authorized_keys
# deletes the public key
rm /home/$USER/.ssh/$1-$HOSTNAME.pub
# moves the private key to the priv_keys dir
mv /home/$USER/.ssh/$1-$HOSTNAME /home/$USER/.ssh/priv_keys
