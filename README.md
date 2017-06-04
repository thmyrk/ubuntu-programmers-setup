# Ubuntu Uprogrammers Setup
Configures Ubuntu as a best working environment for the programmer.

One of the pillars of [DevOps](https://martinfowler.com/bliki/DevOpsCulture.html) is Configuration as a Code.
Here we take this approach for the configuration of the Ubuntu desktop environment. In subfolders you can find the scripts
which configure Ubuntu OS, desktop environment, common tools and various applications in a way suitable
for a typical programmer.

Every developer is a distinct person with different habbits and so such a configuration must be very opinionated by its nature.
That said I think there are some common grounds on which typical programmer configuration can be built upon:
* programmers use console a lot, make it more powerfull,
* programmers use shortcuts - enable standardized shortcut keys, hide menus,
* don't be afraid to enable newest features (think of ViM default configuration),
* ensure discoverability - programmers are lazy, enable features in a way that minimizes effort to read manual,
* automation - make sure everything is easy and as much automated as possible.

I've separated the confiuration scripts into three categories: installation only, non-controversial and opinionated. 

## Installation only - no configuration
* [Google Chrome](google_chrome/) - installs Google Chrome
* [Git](git/) - installs Git
* [Maven](maven/) - installs latest Maven
* [timg](timg/) - install console image viewer which uses 24-bit terminal colors to display image

## Standard - non-controversial configuration, suitable for most developers
* [Nerd Fonts](nerd_fonts/) - configures [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## Very opinionated - configures a lot in a custom specific ways, probably needs to be reviewed and adjusted before applying
* [ViM](vim/) - custom vim configuration, colorfull theme, Git support, airline status
* [Fish shell](fish_shell/) - installs fish shell, use 24-bit color, notify when long running commands finish
* [Gnome Shell](gnome_shell/) - Gnome Shell configuration with static workspaces
* [Gnome Terminal](gnome_terminal/) - Gnome Terminal configuration with Hack fonts
* [Konsole](konsole/) - KDE terminal configuration with Hack fonts
* [Yakuake](yakuake/) - Yakuake terminal configuration with Hack fonts
