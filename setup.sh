#!/usr/bin/bash

DRV_VERSION=0.0.1
DRV_IMX=imx585

echo "Uninstalling any previous ${DRV_IMX} module"

latest_version=$(dkms status | grep ${DRV_IMX} | sort -V | tail -n1 | awk -F', ' '{print $1}' | sed 's/.*\///')
sudo dkms remove -m ${DRV_IMX} -v ${latest_version} --all

sudo mkdir -p /usr/src/${DRV_IMX}-${DRV_VERSION}

sudo cp -r $(pwd)/* /usr/src/${DRV_IMX}-${DRV_VERSION}

sudo dkms add -m ${DRV_IMX} -v ${DRV_VERSION} 
sudo dkms build -m ${DRV_IMX} -v ${DRV_VERSION} 
sudo dkms install -m ${DRV_IMX} -v ${DRV_VERSION} 
