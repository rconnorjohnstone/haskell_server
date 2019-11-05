# Haskell Backend for My Website

I made the joke on my last repository that I hadn't even finished redesigning my website before porting it all over to React. Then I realized I'm gonna need some real backend functionality that React can't provide... So here we are.

This is purely a Yesod app now, and coming along pretty nicely. This is mostly meant to be a learning experience for me, so I'm just trying to get my feet wet in Haskell in general and backend Haskell in particular. But I guess also backend programming in particular, and really, I'm still pretty new to web development in general, as everything else I've done so far has been a program intended for the command line. So go easy on me, I'm learning.

## Features

### Ported Over
The whole front page is done, as well as some stuff on the "about" page. There may be some tweaks here and there, but this stuff is mostly inline with the React Site.

### New Stuff
One of the "backend" type capabilities I needed was to get the email form to actually email me something. It works now.

### Not Yet Implemented
I still have to work on all of the pages that aren't the landing page (which isn't much), add some database capabilities, and start working on a good way to do blog posts. At that point, I'll be pretty satisfied with it.

## To Build
This is a Yesod app, so if you do want to build it (for whatever reason) it's:

```bash
stack exec -- yesod devel
```
