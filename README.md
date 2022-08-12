# strikingloo.github.io
Personal site, made with GitHub pages. Using Jekyll for the first time.

Mostly used as my personal wiki, with notes from MOOCs, books and youtube videos.

## Emoji Code

🌿 : closed thread (spawned a note)

🌱 : open thread (invites further reading and goes into eternal backlog)

For LaTeX enclose markdown in `{% raw %} \\\(  \\\) {% endraw %} `.

Colors were selected from [Penumbra](https://github.com/nealmckee/penumbra)

## Forking this repo

If you want to build your own personal wiki / personal site using mine as a template, all you have to do is:

- Fork this repo.
- Empty the folder `wiki-articles`. In it you can put your own markdown notes, as long as they have title, description, and layout: post in their metadata. (Or you can keep a copy of one of the originals to have a template).
- Empty the `_posts` folder. Markdowns in it follow the same format but their names must start with a date in format YYYY-MM-DD.
- Go to `_layouts` to see the HTML templates for each page kind. You can fiddle around with them, but please remember to change the google analytics code on default.html to yours so your traffic and mine don't get mixed up.
- Customize `wiki/index.html`, the index.html on base directory (homepage) and the social networking links on `_layouts/default.html`'s footer.
- To change up the style, just edit `css/main.css` and run `minify_css.sh` to minify (or change the default layout to import the unminified css instead).
