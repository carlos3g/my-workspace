# my-linux-workspace
scripts para baixar, instalar e configurar algumas coisas do meu ambiente Linux. Caso você queira usar o script, siga os passos abaixo

## Instalação
1. Clone o repositório e entre na pasta do clone
   * `git clone https://github.com/carlos3g/my-linux-workspace.git && cd my-linux-workspace`

2. abra a pasta que corresponde a qual distro a sua foi baseada

3. execute o arquivo `./workspace.sh`, veja aqui os parâmetros necessários
   * Ex. `./workspace.sh pt_br`

4. os seguintes comandos devem ser executados manualmente, após a finalização do script:  
   * `~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y`  
   * `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`  
   * `sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"`  
   * `sudo ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"`  

## :warning: Atenção :warning:
* Caso for usar o arquivo `apperance.sh`, rode ele por último.
* Todos os arquivos foram feitos para serem usados com gnome.
