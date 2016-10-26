FROM amirshams/centos7:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>

##############################################################
# Software:             python2
# Software Version:     2.7.11
# Software Website:     www.python.org
# Description:          python2
##############################################################

ENV APP_NAME=python2
ENV VERSION=2.7.11
ENV DEST=/software/applications/$APP_NAME/
ENV PATH=$DEST/$VERSION/bin:$PATH
ENV PYTHONPATH=$DEST/$VERSION/lib/python2.7
ENV MANPATH=$DEST/$VERSION/share/man:$MANPATH

RUN curl -L -o Python-$VERSION.tgz https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz ; \
    tar xvf Python-$VERSION.tgz ; \
    cd Python-$VERSION ; \
    ./configure --prefix=$DEST/$VERSION ; \
    make -j ; \
    make install ; \
    cd ../ ;  \
    rm -rf Python-$VERSION* ; \
    python -m ensurepip --upgrade ; \
    pip install --upgrade pip
CMD ["/bin/bash"]
