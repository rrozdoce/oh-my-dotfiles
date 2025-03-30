# Oh my Dotfiles

🔧my settings on mostly linux(ubuntu) and window

## 📂 Recommended Repository Structure

```sh
dotfiles/
├── .config/          # Configs modernas (Neovim, TMUX, etc.)
│   ├── nvim/         # Sua config do Neovim (já tem um repo separado!)
│   └── tmux/         # Arquivos do TMUX
├── zsh/              # Configs do Zsh (ou bash/)
│   ├── .zshrc        # Aliases, funções
│   └── plugins/      # Plugins customizados
├── git/              # Configurações do Git
│   ├── .gitconfig    # Nome, email padrão
│   └── .gitignore_global  # Ignore global
├── scripts/          # Scripts de instalação/setup
│   └── bootstrap.sh  # Script para symlink automático
├── README.md         # Instruções claras
└── LICENSE           # Licença (MIT é popular)
```
## ✨ Key Features to Implement
- Crie um script (bootstrap.sh ou install.sh) que:

    - Cria symlinks das configs para ~/.config ou ~/.

    - Instala dependências (ex.: zsh, tmux, neovim).

- Exemplo simplificado:

```sh
#!/bin/bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
```

## Suporte Multi-OS
- Adicione verificações no script para diferenciar Linux/macOS:

```sh
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install zsh tmux
else
  sudo apt install zsh tmux
fi
```

## Gestão de Secrets
- Use um arquivo `.secrets` (adicionado ao `.gitignore`) para variáveis sensíveis:

```sh
# .gitignore
.secrets
```

## Plugins e Temas
- Inclua submodules Git para gerenciar plugins (ex.: Oh My Zsh, TMUX Plugin Manager).

## 💡 Dicas Extras
- Use GNU Stow, Ferramenta para gerenciar symlinks automaticamente:

```sh
stow -v zsh git   # Cria links para configs de zsh e git
```

- Versionamento Seletivo
Não versione tudo (ex.: evite histórico de plugins baixados).

- Backup de Fontes e Cores
Inclua seu tema de terminal (.itermcolors, .Xresources).
