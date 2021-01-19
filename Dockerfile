FROM golang:1.15

RUN groupadd -g 1000 appuser && \
    useradd -m -r -u 1000 -g appuser appuser

USER appuser
WORKDIR /home/appuser

RUN mkdir "/home/appuser/bin"
ENV PATH="${PATH}:/home/appuser/bin"

COPY --chown=appuser:appuser LICENSE README.md /
COPY --chown=appuser:appuser src/ ./
RUN "/home/appuser/install.sh"

ENTRYPOINT ["/home/appuser/entrypoint.sh"]
