    FROM ubuntu:rolling
    ADD ./setup.sh /usr/src/setup.sh
    RUN chmod +x /usr/src/setup.sh
    CMD ["/usr/src/setup.sh"]
