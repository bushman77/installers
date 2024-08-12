#!/bin/bash
sudo su
sudo sfdisk -d /dev/sda > sda.sfdisk
sfdisk -d /dev/sda > sda.sfdisk
