# borrow the legwork done by the PrairieLearn project
FROM prairielearn/grader-python:latest

# set a new label for the image
LABEL org.label-schema.license="AGPL-3.0" \
      org.label-schema.vcs-url="daviddalpiaz/cs307-python-grader" \
      org.label-schema.vendor="PrairieLearn Autograder for Python in CS 307 @ UIUC" \
      maintainer="David Dalpiaz <dalpiaz2@illinois.edu>"

# add layer with updated Python and packages
COPY install.sh requirements.txt /

# run install
RUN /bin/bash /install.sh
