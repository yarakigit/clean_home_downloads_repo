# clean browser downloads home repo
---
## install
~~~zsh
$ git clone git@github.com:yarakigit/clean_home_downloads_repo.git $HOME/.clean_home_downloads_repo
~~~

## settings
- `$HOME/.clean_home_downloads_repo/settings_clean_script.json`
~~~json
{
  "Chrome":
  [
    "usr1",
    "usr2"
  ],
  "Firefox":
  [
    "usr1",
    "usr2"
  ]
}
~~~
- `alias`
~~~bash
alias clean_downloads='zsh $HOME/.clean_home_downloads_repo/clean_script.sh'
~~~