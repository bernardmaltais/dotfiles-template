alias tf='terraform'
alias tfp='terraform plan'
alias tfc='terraform console'
alias tfa='terraform apply -auto-approve'
alias tfi='terraform init'
alias tfd='terraform destroy'
# Terragrunt
alias tg='terragrunt'
alias tga='terragrunt apply -auto-approve'
alias tgc='terragrunt console'
alias tgd='terragrunt destroy'
alias tgi='terragrunt init'
alias tgo='terragrunt output -json'
alias tgp='terragrunt plan'
alias gitclean='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias graph='terragrunt graph-dependencies | dot -Tsvg > graph.svg'
alias stv='export AZ_PIPELINE_CONFIG_PATH=$(pwd)'
alias aksdev='export KUBECONFIG=~/.kube/aks-dev-full ; kubens drupal-wxt-dev'
alias aksdevuser='export KUBECONFIG=~/.kube/aks-dev-user ; kubens drupal-wxt-dev'
alias akstest='export KUBECONFIG=~/.kube/aks-dev-full ; kubens drupal-wxt-test'
alias akstestuser='export KUBECONFIG=~/.kube/aks-dev-user ; kubens drupal-wxt-test'
alias aksprod='export KUBECONFIG=~/.kube/aks-prod-full ; kubens drupal-wxt-prod'
alias aksproduser='export KUBECONFIG=~/.kube/aks-prod-user ; kubens drupal-wxt-prod'
alias drupal="docker exec -it myssc-drupalwxt_php bash"
# kubectl autocomplete and alias
source <(kubectl completion bash)
alias k='kubectl'
complete -F __start_kubectl k