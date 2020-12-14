---
title: New Year, New Look!
author: ~
date: "2021-01-01"
slug: []
categories: []
tags: [website, github, R stats]
subtitle: ''
summary: ''
authors: []
lastmod: ''
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
publishDate: "2020-12-13"
---

# Welcome to my revamped website!

After banging my head against `blogdown` and Hugo on and off for several months (years), I think I understand enough about it to refresh my site. This has been my weekend coding hobby. It's taken so long that the under-workings of Hugo and the Academic theme used here have changed in the meantime.  

Setting up a site is simple enough if you follow the instructions online. The template builds a skeleton of the website and all you need to do is replace the placeholder text with your information. Simple right?  

Not quite. The underlying file structure takes some getting used to and you'll have to trust the magic as your site gets compiled. But once you pass that hurdle, the system is quite powerful and the results are neat. 

There are many features to take advantage of. My interest was in having one site for code documentation and blogging as I was not satisfied with having a "regular" website (wordpress) with a blog and my code documentation separately on GitHub Pages. 

My code documentation was also messing up my GitHub. I'm not a big fan of having documentation (e.g. a static website) lumped together with package files. I also didn't like having an orphan branch for my documentation (no winners here). I can take advantage of the features of Hugo to move my static sites off their respective repositories and into one central one. It's better this way as some of the static pages weren't even relevant to the rest of the repo.

For example, I used the "Courses" feature to turn my lecture notes into a "tutorial" style page.

There are some features that are missing/not easily implemented compared to Wordpress that I will miss. You can't comment or "follow" people. You also can't track views unless you set up Google Analytics or similar.

I will keep the [wordpress site](https://jacintakongresearch.wordpress.com) up for now but will likely continue to update this one. 

There are some peculiarities that require things to be done a certain way:

## Things I noted

* Sometimes it's a challenge to troubleshoot why things aren't working they way you want. E.g. I couldn't work out why the country wouldn't show up in the document when including an address in YAML
* A header image/thumbnail can be included in the same folder as the content *but* it must be called "featured" or it won't be recognised
* You can have as many folders as you want called whatever but the (r)markdown file of the page must be called "index"
    * In the "Courses" feature the parent page must be called "_index" or it won't work. :shrug:
* Rmd and the "Courses" feature don't play nicely. Defining a table of contents via `bookdown` outputs in the YAML doesn't work and calling `toc: true` directly in the YAML (follow the guide) doesn't work either.
* `bookdown` and `blogdown` don't play nicely together in the same project either. `blogdown` will try to render the `bookdown` pages as a site rather than letting `bookdown` do it's thing and make a nice gitbook
