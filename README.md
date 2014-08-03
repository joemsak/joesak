## The Developer's Portfolio

A simple, fast portfolio cms geared toward developers

Dependencies:
* Ruby version 2.1.2
* Rails ~>4.1.4
* Bundler rubygem
* Development environment: Qt

## Features

* Profile photo and summary
* Create or attach and display gists
* Attach resume PDF and/or build a dynamic resume page
* Attach github repositories
* Link third party profiles, such as LinkedIn, Stack Overflow, Twitter
* Link to your blogs and articles
* (hopefully) Register your own domain name
* (hopefully) Choose from well designed themes
* (hopefully) Capture screenshots of web pages
* (maybe) Host a blog

## Setup

```
git clone git@github.com:joemsak/joesak.git
cd joesak
git checkout portfolio
bundle
rake db:create db:migrate db:test:prepare
```

## Run tests

```
rake
```
