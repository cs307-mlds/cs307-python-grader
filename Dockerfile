# borrow the legwork done by the PrairieLearn project
FROM prairielearn/grader-python:latest
ARG CACHEBUST=2025-08-15-14-16-03

# set a new label for the image
LABEL org.label-schema.license="AGPL-3.0" \
      org.label-schema.vcs-url="daviddalpiaz/cs307-python-grader" \
      org.label-schema.vendor="PrairieLearn Autograder for Python in CS 307 @ UIUC" \
      maintainer="David Dalpiaz <dalpiaz2@illinois.edu>"

# add layer with updated Python and packages
COPY requirements.txt /

# install and configure python environment
RUN mamba install -c conda-forge python=3.13 --yes && \
    python -m pip install --upgrade pip && \
    python -m pip install --no-cache-dir -r /requirements.txt && \
    mamba clean --all --yes --quiet
