#!/bin/bash

cd  /opt/shellinabox/shellinabox  && \
shellinaboxd --user-css Normal:+white-on-black.css -t -s /:SSH:${HOST}

