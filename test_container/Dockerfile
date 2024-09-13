FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd

RUN echo 'root:rootpass' | chpasswd

RUN useradd -m -s /bin/bash user && \
    echo 'user:userpass' | chpasswd && \
    usermod -aG sudo user

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
RUN mkdir -p /home/user/.ssh && chmod 700 /home/user/.ssh

COPY ./id_rsa.pub /root/.ssh/authorized_keys
COPY ./id_rsa.pub /home/user/.ssh/authorized_keys

RUN chmod 600 /root/.ssh/authorized_keys && \
    chmod 600 /home/user/.ssh/authorized_keys && \
    chown -R user:user /home/user/.ssh

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

RUN echo "AllowUsers user" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
