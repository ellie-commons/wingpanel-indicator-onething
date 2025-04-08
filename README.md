
<div align="center">
  <h1 align="center">Simple Things</h1>
  <h3 align="center">Simply display some text in the elementary OS top bar</h3>
</div>

<div align="center">
    <span align="center">
        <img class="center" src="data/screenshot.png" alt="Simple Things indicator">
    </span>
</div>


## 🛣️ Roadmap

Still working on this!
 - Repair translations
 - Im not sure it follows dark-light theme ?
 - Maybe center it or some shit
 - Figure out how to do a deb file

  
## 💝 Donations

Support is always welcome and shows us that people want this to continue.

Stella, current main dev:
<p align="left">
  <a href="https://ko-fi.com/teamcons">
    <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=2" width="150">
  </a>
</p>



## 🏗️ Building

You'll need the following dependencies:

- libglib2.0-dev
- libgranite-dev
- libwingpanel-dev
- valac
- meson (>= 0.58)

Install them with:

```bash
sudo apt install libglib2.0-dev libgranite-dev libwingpanel-dev valac meson
```

Run `meson` to configure the build environment and then `ninja` to build

    meson build --prefix=/usr
    cd build
    ninja

To install, use `ninja install`

    sudo ninja install
Reboot (`reboot`) or kill Wingpanel (`killall io.elementary.wingpanel`)


