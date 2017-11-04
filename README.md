# Custom Gentoo Overlay

## Usage

Requires Layman built with the `git` use flag.

In the 'overlays' section in `/etc/layman/layman.cfg`, add:

```
https://raw.githubusercontent.com/varingst/varingst-overlay/master/overlay.xml
```

Then fetch and add the overlay
```
# layman -f -a varingst
```

To sync:

```
# layman -s varingst
```

Or simply to sync all overlays:
```
# layman -S
```
