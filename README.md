== The Developer's Portfolio

A simple, fast portfolio cms geared toward developers

Dependencies:
* Ruby version 2.1.2
* Bundler rubygem
* Development environment: Qt

= Setup

```
git clone git@github.com:joemsak/joesak.git
cd joesak
git checkout portfolio
bundle
rake db:create db:migrate db:test:prepare
```

= Run tests

```
rake
```
