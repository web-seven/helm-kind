#!/bin/sh

cd $HELM_PLUGIN_DIR
version="$(cat plugin.yaml | grep "version" | cut -d '"' -f 2)"
echo "Installing helm-kind ${version} ..."

# Find correct archive name
unameOut="$(uname -s)"

case "${unameOut}" in
    Linux*)             os=Linux;;
    Darwin*)            os=Darwin;;
    CYGWIN*)            os=Cygwin;;
    MINGW*|MSYS_NT*)    os=windows;;
    *)                  os="UNKNOWN:${unameOut}"
esac

arch=`uname -m`

if echo "$os" | grep -qe '.*UNKNOWN.*'
then
    echo "Unsupported OS / architecture: ${os}_${arch}"
    exit 1
fi

url="https://github.com/web-seven/helm-kind/releases/download/${version}/helm-kind.tar.gz"

filename=`echo ${url} | sed -e "s/^.*\///g"`

# Download archive
if [ -n $(command -v curl) ]
then
    curl -sSL -O $url
elif [ -n $(command -v wget) ]
then
    wget -q $url
else
    echo "Need curl or wget"
    exit -1
fi

# Install bin
rm -rf bin && tar xvf $filename > /dev/null && rm -f $filename
chmod -R 755 ./bin

echo "helm-kind ${version} is correctly installed."
echo
