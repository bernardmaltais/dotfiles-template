set_hostname () {
  if sudo grep -qF "hostname" /etc/wsl.conf;then
    echo "Hostname already set in /etc/wsl.conf. Please manually edit the file to set the desired hostname!"
  else
    read -p "Hostname: " hostname
    sudo bash -c "echo '[network]' |  tee -a /etc/wsl.conf"
    sudo bash -c "echo 'hostname = ${hostname}' |  tee -a /etc/wsl.conf"
  fi
}

# Install curl if missing
sudo apt-get update
sudo apt install -y curl

# Install AZ CLI
sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

# Install terragrunt
sudo wget -O /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.29.4/terragrunt_linux_amd64
sudo chmod 755 /usr/local/bin/terragrunt

# Specify hostname
echo "Do you wish to set a hostname for your WSL2 environment?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) set_hostname; break;;
    No ) exit;;
  esac
done
