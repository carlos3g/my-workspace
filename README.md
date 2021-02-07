# my-linux-workspace
scripts para baixar, instalar e configurar algumas coisas do meu ambiente Linux. Caso você queira usar o script, siga os passos abaixo

## Instalação
1. descompacte o arquivo (caso tenha baixo compactado)

2. abra a pasta que corresponde a qual distro a sua foi baseada

3. execute o comando a seguir dentro do diretório(troque o 1º parâmetro de acordo com o idioma do SO): `./workspace.sh pt_br`

4. os seguintes comandos devem ser executados manualmente, após a finalização do script:  
   * `~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y`  
   * `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`  
   * `sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"`  
   * `sudo ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"`  

## :warning: Atenção :warning:
* Caso for usar o arquivo `apperance.sh`, rode ele por último.
* Todos os arquivos foram feitos para serem usados com gnome.

## Minhas extensões do VS Code
1. Better Comments
2. Bracket Pair Colorizer
3. C/C++
4. Color Highlight
5. Dracula Official
6. EditorConfig for VS Code
7. ESLint
8. GitLens
9. Import Cost
10. indent-rainbow
11. Live Server
12. Material Icon Theme
13. Night Owl
14. Omni
15. Path Intellisense
16. Portuguese (Brasil)
17. Prettier - Code formatter
18. Python
19. Python Docstring Generator
20. Rewrap
21. Rocketseat React Native
22. Rocketseat ReactJS
23. vscode-styled-components
