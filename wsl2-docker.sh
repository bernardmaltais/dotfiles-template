# Source: https://nvd.codes/post/set-up-docker-from-scratch-on-wsl2/

sudo apt update
sudo apt install -yyq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -yyq docker-ce docker-ce-cli containerd.io
sudo service docker start
sudo usermod -aG docker $USER

if grep -qF "service docker status > /dev/null || sudo service docker start" ${HOME}/.bashrc;then
   echo ""
else
   echo "service docker status > /dev/null || sudo service docker start" >> ${HOME}/.bashrc
fi

if sudo grep -qF "ALL=NOPASSWD:/usr/sbin/service docker start" /etc/sudoers;then
   echo ""
else
   sudo bash -c "echo '${USER} ALL=NOPASSWD:/usr/sbin/service docker start' | (EDITOR='tee -a' visudo)"
   # sudo bash -c "echo '${USER} ALL=(ALL:ALL) NOPASSWD: ALL' | (EDITOR='tee -a' visudo)"
fi

echo "Before you can use docker in WSL2 you will need to restart your instance of wsl2 with: wsl --terminate name-of-wsl-distro or wsl --shutdown (caution this last one will shut down all your WSL instances)."
