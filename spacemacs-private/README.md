# Spacemacs private layer

This folder contains a portable `my-settings` Spacemacs layer and the patched
Centaur Tabs source it uses. It is kept separate from the repository's other
Emacs configuration so it can be tested locally before syncing or publishing.

## Install

1. Clone this repository, or update your existing clone:

   ```powershell
   git clone https://github.com/piyushkapadia/emacs.git
   ```

2. Copy `spacemacs-private/my-settings` into your Spacemacs private directory.
   The resulting structure must be:

   ```text
   ~/.emacs.d/private/my-settings/
     packages.el
     config.el
     funcs.el
     keybindings.el
     layers.el
     local/centaur-tabs/
       centaur-tabs.el
       centaur-tabs-elements.el
       centaur-tabs-functions.el
       centaur-tabs-interactive.el
       LICENSE
   ```

   On Windows, `~/.emacs.d` is normally `%HOME%\.emacs.d`.

3. Add `my-settings` to `dotspacemacs-configuration-layers` in `.spacemacs`.

4. Ensure the following packages are installed:
   - `all-the-icons` for tab icons. Keep its ownership in the Spacemacs layer
     that already provides it; do not add a second `my-settings/init-all-the-icons`
     function. If no enabled layer provides it, add it to
     `dotspacemacs-additional-packages`.
   - `powerline`, required by Centaur Tabs. Add it to
     `dotspacemacs-additional-packages` if it is not already provided.

5. Install icon fonts by running `M-x all-the-icons-install-fonts` in graphical
   Emacs.

6. Run `SPC f e R` to synchronize the configuration, then restart Spacemacs.

The layer declares Centaur Tabs as a local package with `:location local`, which
resolves to `my-settings/local/centaur-tabs`. Its source patch retains any
non-empty icon string returned by `all-the-icons`; the original displayability
guard rejected private-use icon characters before their font properties could
render them.

## Verify

In a file-visiting buffer, evaluate this with `M-:` to insert an icon selected
from the current file name:

```elisp
(insert (all-the-icons-icon-for-file
         (or buffer-file-name (read-file-name "File: "))))
```

Check the active Centaur Tabs setup with:

```elisp
(list centaur-tabs-height
      centaur-tabs-icon-type
      centaur-tabs-set-icons
      (bound-and-true-p centaur-tabs-mode))
```

Expected icon settings are `all-the-icons`, `t`, and an enabled mode. See
[`my-settings/ICON-TROUBLESHOOTING.org`](my-settings/ICON-TROUBLESHOOTING.org)
for the full investigation and diagnostics.

## Upstream package

Centaur Tabs is based on <https://github.com/ema2159/centaur-tabs>. The included
source is distributed under GPL-3.0-or-later; its upstream `LICENSE` file is
included in `my-settings/local/centaur-tabs/`.
