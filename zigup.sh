#!/bin/sh

zig_path=$HOME/zig
download_path=$zig_path/zig-master.tar.xz

mkdir $zig_path

fetch $(fetch -qo - https://ziglang.org/download/index.json | grep 'tarball.*https://ziglang.org/builds/zig-freebsd-x86_64' | cut -f4 -d'"') -o $download_path
cd $zig_path
tar xfv $download_path

rm $download_path
rm -rf $zig_path/zig
mv $(ls | grep zig) zig

rm $HOME/bin/zig
ln -s $zig_path/zig/zig $HOME/bin/zig
