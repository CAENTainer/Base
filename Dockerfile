FROM almalinux:8

LABEL org.opencontainers.image.authors="CAENTainer Maintainers <caentainer-ops@umich.edu>"
LABEL org.opencontainers.image.source="https://github.com/CAENTainer/Base"

RUN dnf update -y \
  	&& dnf install -y git \
   	vim \
   	wget \
    curl \
	zsh \
	python3 \
	&& dnf clean all

RUN mkdir -p /root/.caentainer_persisted/ \
  && sh -c "$(curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended \
  && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

COPY assets/.p10k.zsh assets/.zshrc /root/

CMD ["/usr/bin/zsh"]
