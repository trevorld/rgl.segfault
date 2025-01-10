## Emacs, make this -*- mode: sh; -*-
# docker build -t rgl.segfault .
# docker run --rm -ti rgl.segfault

## start with the Docker 'base R' Debian-based image
FROM r-base:latest

## Remain current
RUN apt-get update -qq \
	&& apt-get dist-upgrade -y

RUN apt-get update -qq
RUN apt-get install -y texlive-full # `pdflatex` for R CMD check

# Install {rgl} and all its Imports/Suggests
RUN apt-get install -y git
RUN apt-get install -y libcurl4-openssl-dev # {curl}
RUN apt-get update -qq
RUN apt-get install -y libmagick++-dev # {magick}
RUN apt-get install -y libssl-dev # {openssl}
RUN apt-get install -y libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev # {ragg}
RUN apt-get install -y libgl1-mesa-dev libglu1-mesa-dev # {rgl}
RUN apt-get install -y libfontconfig1-dev # {systemfonts}
RUN apt-get install -y libharfbuzz-dev libfribidi-dev # {textshaping}
RUN apt-get install -y libv8-dev # {V8}
RUN apt-get install -y libxml2-dev # {xml2}
RUN Rscript -e "install.packages('rgl', dependencies = TRUE)"

# Install development version of {rgl}
# RUN git clone https://github.com/dmurdoch/rgl.git
# RUN R CMD build rgl # segfaults
# RUN R CMD INSTALL rgl*.tar.gz

# Run {rgl.segfault} reprex
RUN git clone https://github.com/trevorld/rgl.segfault.git
RUN R CMD build rgl.segfault
# RUN R CMD check rgl.segfault*.tar.gz # reproduces error

CMD ["bash"]
