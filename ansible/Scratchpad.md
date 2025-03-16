+ Set the timezone
    ```sh
    sudo -i
    echo "Pacific/Auckland" > /etc/timezone
    exit
    ```
+ Install Ansible
    ```sh
    sudo apt update
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y ansible
    ```

## Install `asdf`
```zsh
foreach app in bat eza fd fzf jq neovim ripgrep yq; do asdf plugin add $app; done
foreach app in bat eza fd fzf jq neovim ripgrep yq; do asdf install $app latest; done
foreach app in bat eza fd fzf jq neovim ripgrep yq; do asdf set --home $app latest; done
path+=/home/duplic8r/.asdf/shims
```
