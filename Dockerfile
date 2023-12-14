FROM ubuntu:latest
MAINTAINER vad9nk4

# Установка зависимостей
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y php7.4 sudo python3 netcat-traditional openssh-server apache2 apache2-utils vim htop net-tools wget vsftpd nodejs npm language-pack-ru

# Создание необходимых директорий
RUN mkdir -p /var/run/sshd /var/www/html/wanna_play /var/ftp/... /var/www/html/images /var/www/html/css /var/www/html/.j4v4_scr1pt /var/run/vsftpd /var/run/vsftpd/empty /var/www/html/wanna_play/brain_teaser /var/www/html/wanna_play/brick_breaker

# Установка setuid для Vim
RUN chmod a+s /usr/bin/vim

# Копирование файлов
COPY play.txt /var/ftp/.../.play.txt
COPY sense_of_life.html /var/www/html/sense_of_life.html
COPY play.jpg /var/www/html/sense.jpg
COPY mxr5_g4M3s_th4n_yxu_exp5cted.html /var/www/html/mxr5_g4M3s_th4n_yxu_exp5cted.html
COPY wasd.jpg /var/www/html/images/wasd.jpg
COPY justfive.jpg /var/www/html/images/justfive.jpg
COPY qwerty.css /var/www/html/css/qwerty.css
COPY zoeken.php /var/www/html/zoeken.php
COPY games.css /var/www/html/css/games.css
COPY start.jpg /var/www/html/images/start.jpg
COPY billy.jpg /var/www/html/images/billy.jpg
COPY games.html /var/www/html/g4m5$.html
COPY brain_teaser.css /var/www/html/css/brain_teaser.css
COPY brain_teaser.js /var/www/html/.j4v4_scr1pt/brain_teaser.js
COPY brain_teaser.html /var/www/html/wanna_play/brain_teaser/index.html
COPY brick_breaker.css /var/www/html/css/brick_breaker.css
COPY brick_breaker.js /var/www/html/.j4v4_scr1pt/brick_breaker.js
COPY brick_breaker.html /var/www/html/wanna_play/brick_breaker/index.html
COPY vsftpd.conf /usr/share/vsftpd.conf

# Настройка SSH и создание пользователей
ARG ROOT_PASSWORD="it-doesn't-make-any-sense"
ARG USERNAME="johny"
ARG USERNAME_PASSWORD="nx-w4y-tx-brut5-fxrs5-this"
RUN echo "root:${ROOT_PASSWORD}" | chpasswd --crypt-method SHA512 && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    useradd -m -s /bin/bash $USERNAME && \
    echo "${USERNAME}:${USERNAME_PASSWORD}" | chpasswd && \
    echo "$USERNAME ALL=(ALL) NOPASSWD: /usr/bin/cat" >> /etc/sudoers

# Копирование дополнительных файлов
COPY index.html /var/www/html/index.html
COPY user.txt /home/johny/user.txt
COPY root.txt /root/flag/root.txt

# Настройка VSFTPD
RUN mv /usr/share/vsftpd.conf /etc/vsftpd.conf

# Открытие портов
EXPOSE 80
EXPOSE 22
EXPOSE 20/tcp 21/tcp 40000-40009/tcp

# Запуск сервисов
CMD /usr/sbin/sshd -D & /usr/sbin/vsftpd -obackground=NO & apache2ctl -D FOREGROUND