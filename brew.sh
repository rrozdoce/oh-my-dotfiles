#!/usr/bin/env bash

echo "---------------- 🍺 All-in-One Script with homebrew ----------------"

# Verify if homebrew is already installed
if ! command -v brew &> /dev/null; then 
    echo "Instalando o Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configure homebrew on PATH(for ubuntu)
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    source ~/.bashrc
else
    echo "Homebrew is already installed. Updating..."
fi

# TODO: config homebrew 

# Update Homebrew and installed packages
brew update
brew upgrade

echo "⚒️  Installing essential tools"
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

if ! brew install git; then
    echo "❌ installing git Failed!" > &2
    exit 1

brew install \
    git-lfs \      # for big files
    gh \           # official CLI of Github
    # [...] (other packages)

echo -e "\nconfiguring Git..."
git config --global user.name "rrozdoce"
git config --global user.email "felipefelipevilhalva@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global core.editor "nvim"  # default editor

echo "✅ essential tools installed"

echo "🔒 Installing security tools"
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

echo "✅ security tools installed"

echo "📌 installing extras useful tools"
# Extras useful tools
brew install \
    neovim \        # Modern Editor
    ripgrep \       # speed grep
    bat \           # cat with syntax highlight
    exa \           # modern ls
    zoxide \        # smart cd
    gh \            # CLI of Github
    kubectl         # Kubernetes

echo "✅ Extras useful tools installed"

echo "🖥️ installing compilers, programming languages and some dev tools"
# Install compilers and basics tools
brew install \
    gcc \           # GCC (with g++)
    cmake \         # build tools
    make \          # compiler manager
    pkg-config      # help libs

# Configure autocomplete and oh-my-zsh in zsg/.zshrc
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

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
echo 'export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk"' >> ~/.bashrc
echo "✅ sucess..."

echo "=== installed versions ==="

gcc --version | head -n1
g++ --version
rustc --version
nvm --version
node --version
java -version
python3 --version
pip3 --version
git --version

echo "=== git configs ==="
git config --list 

echo "✅ Stack dev and useful things installed with Homebrew!"

echo "=== Homebrew version ==="
brew --version

# clean old packages
brew cleanup
