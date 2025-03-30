#!/usr/bin/env bash



# Verify if homebrew is already installed
if ! command -v brew &> /dev/null; then
    echo "---------------- 🍺 All-in-One Script with homebrew ----------------"
    echo "Instalando o Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configure homebrew on PATH(for ubuntu)
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    source ~/.bashrc
else
    echo "Homebrew já está instalado. Atualizando..."
fi

# Update Homebrew and installed packages
brew update
brew upgrade

# Install useful extra tools
brew install \
    coreutils \
    moreutils \
    findutils \
    gnu-sed \
    wget \
    curl \
    gnupg \
    vim \
    git \
    git-lfs \
    openssh \
    screen \
    htop \
    tree \
    p7zip \
    unzip \
    rlwrap \
    lynx \
    imagemagick \
    ffmpeg \
    pv \
    pigz \
    rename \
    socat \
    nmap \
    tcpdump \
    hydra \
    aircrack-ng \
    sqlmap \
    john \
    binutils \
    binwalk \
    lua \
    php \
    python \
    neofetch

# Security Tools and CTF (Optional)
brew install \
    exiftool \
    steghide \
    foremost \
    fcrackzip \
    pdfcrack \
    wireshark \
    tshark \
    hexedit

# Extras useful tools
brew install \
    neovim \        # Modern Editor
    ripgrep \       # speed grep
    bat \           # cat with syntax highlight
    exa \           # modern ls
    zoxide \        # smart cd
    gh \            # CLI of Github
    kubectl         # Kubernetes

# Install compilers and basics tools
brew install \
    gcc \           # GCC (with g++)
    cmake \         # build tools
    make \          # compiler manager
    pkg-config      # help libs

# Configure autocomplete and oh-my-zsh in zsg/.zshrc
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Rust (with Homebrew + rustup)
brew install rustup-init
rustup-init -y --no-modify-path
source "$HOME/.cargo/env"

# Install NVM(Node version manager) and Node.js LTS (with Homebrew)
brew install nvm
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"' >> ~/.bashrc
source ~/.bashrc
nvm install --lts
nvm use --lts

# Install Java (OpenJDK)
brew install openjdk
sudo ln -sfn /home/linuxbrew/.linuxbrew/opt/openjdk/libexec/openjdk.jdk /usr/lib/jvm/openjdk

echo "=== Versões instaladas ==="

gcc --version
g++ --version
rustc --version
nvm --version
node --version
java -version
python3 --version
pip3 --version

echo "✅ Stack dev and useful things installed with Homebrew!"

# clean old packages
brew cleanup
