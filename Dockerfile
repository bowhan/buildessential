FROM ubuntu:16.04

MAINTAINER Bo Han i@bowhan.me

RUN apt-get update -qq \
    && apt-get install software-properties-common -qq -y \
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu $(lsb_release -cs)/" \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 \
    && sudo add-apt-repository -y ppa:marutter/c2d4u  \
    && apt-get autoremove -qq \
    && apt-get update -qq \
    && apt-get install -y -qq \
        g++-6 \
        gfortran-6 \
        autoconf \
        automake \
        cmake-data \
        cmake \
        zlib1g-dev \
        libcurl4-openssl-dev \
        libtool \
        libboost-all-dev \
        libtbb-dev \
        libffi-dev libssl-dev \
        git \
        default-jdk scala \
        python3-dev python3-pip \
        pandoc pandoc-citeproc \
    && apt-get install -y -qq --no-install-recommends r-base-dev r-recommended \
    && update-alternatives --install /usr/bin/g++  g++  /usr/bin/g++-6  90 \
    && update-alternatives --install /usr/bin/gcc  gcc  /usr/bin/gcc-6  90 \
    && update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-6 90 

RUN pip3 install awscli jinja2 numpy pandas matplotlib cython biopython scikit-learn 

RUN Rscript -e 'install.packages(c("pacman", "readr", "dplyr", "tidyr", "ggplot2", "ggthemes", "viridis", "shiny", "plotly", "rmarkdown", "htmlwidgets", "cowplot", "caret", "e1071", "imputeMissings", "RANN", "corrplot", "nnet"),repos="http://cran.rstudio.com/")'