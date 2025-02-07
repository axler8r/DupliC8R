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

```bash
wget https://github.com/asdf-vm/asdf/releases/download/v0.16.1/asdf-v0.16.1-linux-amd64.tar.gz
tar -zxvf asdf-v0.16.1-linux-amd64.tar.gz
mv asdf .local/bin
chmod u+x .local/bin/asdf
rm asdf-v0.16.1-linux-amd64.tar.gz
export PATH=/home/duplic8r/.local/bin:$PATH
export PATH=/home/duplic8r/.asdf/shims:$PATH
asdf plugin add bat
asdf install bat latest
asdf set bat latest
asdf plugin add choose
asdf install choose latest
asdf set choose latest
```
