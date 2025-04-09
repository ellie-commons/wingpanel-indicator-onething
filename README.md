
<div align="center">
  <h1 align="center">One Thing</h1>
  <h3 align="center">Simply display some text in the elementary OS top bar</h3>
</div>

<div align="center">
    <span align="center">
        <img class="center" src="data/screenshot.png" alt="One Thing indicator">
    </span>
</div>
</br>

Pretty much the elementary OS pendant of 
Mac OS: https://sindresorhus.com/one-thing
Gnome-Shell: https://github.com/one-thing-gnome/one-thing

## 🛣️ Roadmap

Still working on this!
 - Figure out how to do a deb file
   

You can change text from commandline:

> gsettings set io.github.ellie_commons.indicator-onething text "whatever"
  
And align the text in the entry box to: 0: left, 1: center, 2: right

> gsettings set io.github.ellie_commons.indicator-onething position 1



## 💝 Donations

Support is always welcome and shows us that people want this to continue.

Stella, current main dev:
<p align="left">
  <a href="https://ko-fi.com/teamcons">
    <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=2" width="150">
  </a>
</p>



## 🏗️ Building

Install dependencies with:

```bash
sudo apt install libglib2.0-dev libgranite-dev libwingpanel-dev valac meson
```

Run `meson` to configure the build environment and then `ninja` to build

```bash
meson build --prefix=/usr
cd build
ninja
```

To install

```bash
sudo ninja install
```

To uninstall, same but "uninstall"
