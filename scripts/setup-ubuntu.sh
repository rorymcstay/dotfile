sudo apt-get update \
    && sudo apt-get install -y \
        build-essential \
        gcc \
        g++\
        gdb \
        clang \
        cmake \
        python \
        python3-dev \
        python3-pip \
        libcpprest-dev \
        libgtest-dev \
        libboost-all-dev \
        docker.io \
        vim \
        git \
        ssh \
        rpm \
        curl \
        rsync \
        tar \
        zip \
        unzip \
    && sudo apt-get clean

sudo git clone https://github.com/google/benchmark.git /usr/src/benchmark
sudo mkdir /usr/src/benchmark/build \
    && sudo cmake \
        -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on \
        -DCMAKE_BUILD_TYPE=Release \
        -S /usr/src/benchmark \
        -B /usr/src/benchmark/build
    && (cd /usr/src/benchmark/build && sudo make install -j3)

sudo apt-get install --only-upgrade \
    bash \
    less

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -r aws awscliv2.zip

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s $HOME/.dotfile/vimrc /$HOME/.vimrc
ln -s $HOME/.dotfile/profile $HOME/.profile

vim +PluginInstall +qall

~/.vim/bundle/YouCompleteMe/install.py --clangd-completer --clang-tidy
