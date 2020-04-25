## Search & Displace

## :cyclone: About

Search and Displace is developing a workflow and toolchain which intends to address 
the problem of mass search and displacement for document content where the original 
documents are in a range of forms, including a wide variety of digital document formats,
both binary and more modern compressed XML forms, but also encompassing older documents
where the only surviving form is printed or even handwritten.

## :rocket: Installation

First install nix following the instructions on their website at https://nixos.org/nix/manual/#chap-installation

The add search-and-displace channel to your nix environment and update it:
```bash
nix-channel --add https://github.com/searchanddisplace/searchanddisplace/raw/master/pkgs/nixexprs.tar.xz
nix-channel --update
```

You can now install search-and-displace:
```bash
nix-env -i search-and-displace
```
## :roller_coaster: Usage

