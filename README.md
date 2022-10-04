# [strikingloo.github.io](https://strikingloo.github.io)
This is my personal site, made with GitHub pages and Jekyll.

It includes my blog, where I write about programming, machine learning and productivity, and my Digital Garden or wiki where I post my notes on books, courses, papers and such. 

The wiki aims at being made of heavily interlinked, in-depth evergreen notes and is mostly for my own use and consumption. The blog is public-facing and carries the mission of helping people see the beauty of algorithms.

## Wiki Emoji Code

🌿 : closed thread (spawned a note)

🌱 : open thread (invites further reading and goes into eternal backlog)

For LaTeX enclose markdown in `{% raw %} \\\(  \\\) {% endraw %} `.

## Forking this repo

If you want to build your own personal wiki / personal site using mine as a template, I recommend you fork my [Personal Wiki Github Project](https://github.com/StrikingLoo/Personal-Wiki-Site-Setup). You can follow the [Personal Wiki setup tutorial I wrote here](https://strikingloo.github.io/personal-wiki-set-up).

To run the site locally, run

```
export PATH="/usr/local/opt/ruby/bin:$PATH"
sudo gem install rails
sudo gem install jekyll
sudo gem install jekyll bundler
cd ~/this_project

bundle init
bundle install
bundle add jekyll
bundle exec jekyll serve
```

⭐🤖
