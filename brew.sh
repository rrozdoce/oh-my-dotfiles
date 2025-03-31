#!/usr/bin/env bash

echo "---------------- 🍺 All-in-One Script with homebrew ----------------"

# Verify if homebrew is already installed
if ! command -v brew &>/dev/null; then 
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configure homebrew on PATH (for both Linux and macOS)
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
        source ~/.bashrc
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        source ~/.zshrc
    fi
else
    echo "Homebrew is already installed. Updating..."
fi

# Update Homebrew and installed packages
if ! brew update; then
    echo "❌ Failed to update Homebrew!" >&2
    exit 1
fi

if ! brew upgrade; then
    echo "❌ Failed to upgrade packages!" >&2
    exit 1
fi

echo "⚒️ Installing essential tools"
# Install useful extra tools
if ! brew install \
    coreutils \
    moreutils \
    findutils \
    gnu-sed \
    wget \
    curl \
    gnupg \
    vim \
    git \
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
    neofetch; then
    echo "❌ Failed to install essential tools!" >&2
    exit 1
fi

if ! brew install git-lfs; then
    echo "❌ Failed to install git-lfs!" >&2
    exit 1
fi

echo -e "\nConfiguring Git..."
git config --global user.name "rrozdoce"
git config --global user.email "felipefelipevilhalva@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global core.editor "nvim"

echo "✅ Essential tools installed"

echo "🔒 Installing security tools"
# Security Tools and CTF (Optional)
if ! brew install \
    exiftool \
    steghide \
    foremost \
    fcrackzip \
    pdfcrack \
    wireshark \
    tshark \
    hexedit; then
    echo "❌ Failed to install security tools!" >&2
    exit 1
fi

echo "✅ Security tools installed"

echo "📌 Installing extras useful tools"
# Extras useful tools
if ! brew install \
    neovim \
    ripgrep \
    bat \
    exa \
    zoxide \
    gh \
    kubectl; then
    echo "❌ Failed to install extra tools!" >&2
    exit 1
fi

echo "✅ Extras useful tools installed"

echo "🖥️ Installing compilers, programming languages and some dev tools"
# Install compilers and basics tools
if ! brew install \
    gcc \
    cmake \
    make \
    pkg-config; then
    echo "❌ Failed to install compilers!" >&2
    exit 1
fi

# Install and configure zsh
if brew install zsh; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "❌ Failed to install zsh!" >&2
    exit 1
fi

# Install Rust
if brew install rustup-init; then
    rustup-init -y --no-modify-path
    source "$HOME/.cargo/env"
else
    echo "❌ Failed to install rustup!" >&2
    exit 1
fi

# Install Node.js via NVM
if brew install nvm; then
    mkdir -p ~/.nvm
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
    echo '[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"' >> ~/.bashrc
    source ~/.bashrc
    nvm install --lts
    nvm use --lts
else
    echo "❌ Failed to install nvm!" >&2
    exit 1
fi

# Install Java
if brew install openjdk; then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo ln -sfn /home/linuxbrew/.linuxbrew/opt/openjdk/libexec/openjdk.jdk /usr/lib/jvm/openjdk
    fi
    echo 'export JAVA_HOME="$(brew --prefix openjdk)"' >> ~/.bashrc
else
    echo "❌ Failed to install Java!" >&2
    exit 1
fi

echo "✅ Stack dev and useful things installed with Homebrew!"

echo "=== Installed versions ==="
gcc --version | head -n1
g++ --version | head -n1
rustc --version
nvm --version
node --version
java -version
python3 --version
pip3 --version
git --version

echo "=== Git configs ==="
git config --list 

echo "=== Homebrew version ==="
brew --version

# Clean old packages
brew cleanup
