# st-vfork

## Introduction

This is a fork of st, see [https://st.suckless.org/](https://st.suckless.org/) for original project. Some patches from [https://st.suckless.org/patches/](https://st.suckless.org/patches/) are applied, among which:

* anysize
* scrollback
* w3m

## Personal changes

* Reorder all project files along with new Makefile ;
* `MODKEY` is set to `Mod4Mask` to avoid conflicts with my dwm setup ;
* miscellaneous key bidings to be more vim-friendly ;
* font and colors.

## Installation

```bash
sudo make clean install
```
