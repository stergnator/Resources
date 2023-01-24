
# PostgreSQL Notes for STM

---

## Tuesday 01/24/2023

### On RoadRunner I upgraded both versions of PostgreSQL (13 & 14)

```sh
postgresql@14 14.6 -> 14.6_1
postgresql@13 13.9 -> 13.9_1
```

#### Upgrading postgresql@13

```sh
==> Upgrading postgresql@13
  13.9 -> 13.9_1

==> Pouring postgresql@13--13.9_1.big_sur.bottle.tar.gz
==> Caveats
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 $(brew --prefix)/var/postgresql@13
For more details, read:
  https://www.postgresql.org/docs/13/app-initdb.html

postgresql@13 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have postgresql@13 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/postgresql@13/bin:$PATH"' >> ~/.zshrc

For compilers to find postgresql@13 you may need to set:
  export LDFLAGS="-L/usr/local/opt/postgresql@13/lib"
  export CPPFLAGS="-I/usr/local/opt/postgresql@13/include"

For pkg-config to find postgresql@13 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/postgresql@13/lib/pkgconfig"


To start postgresql@13 now and restart at login:
  brew services start postgresql@13
==> Summary
🍺  /usr/local/Cellar/postgresql@13/13.9_1: 3,240 files, 43.3MB
==> Running `brew cleanup postgresql@13`...
```




#### Upgrading postgresql@14

```sh
==> Upgrading postgresql@14
  14.6 -> 14.6_1

==> Pouring postgresql@14--14.6_1.big_sur.bottle.tar.gz

This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 $(brew --prefix)/var/postgresql@14
For more details, read:
  https://www.postgresql.org/docs/14/app-initdb.html

To start postgresql@14 now and restart at login:
  brew services start postgresql@14
```

--- 

## Monday 01/23/2023

### On Gokart, I Upgraded to postgresql@15.1_1.ventura.bottle.tar.gz  via brew 

```sh
brew upgrade postgresql@15

==> Installing postgresql@15
==> Pouring postgresql@15--15.1_1.ventura.bottle.tar.gz
==> Caveats
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /usr/local/var/postgresql@15
For more details, read:
  https://www.postgresql.org/docs/15/app-initdb.html

postgresql@15 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have postgresql@15 first in your PATH, run:
  fish_add_path /usr/local/opt/postgresql@15/bin

For compilers to find postgresql@15 you may need to set:
  set -gx LDFLAGS "-L/usr/local/opt/postgresql@15/lib"
  set -gx CPPFLAGS "-I/usr/local/opt/postgresql@15/include"

For pkg-config to find postgresql@15 you may need to set:
  set -gx PKG_CONFIG_PATH "/usr/local/opt/postgresql@15/lib/pkgconfig"


To restart postgresql@15 after an upgrade:
  brew services restart postgresql@15
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/postgresql@15/bin/postgres -D /usr/local/var/postgresql@15
==> Summary
🍺  /usr/local/Cellar/postgresql@15/15.1_1: 3,345 files, 44.9MB
==> Running `brew cleanup postgresql@15`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /usr/local/Cellar/postgresql@15/15.1... (3,345 files, 44.9MB)

```

---

## Wednesday 11/16/2022

* Upgrade to 14.6 via brew 

```sh
==> Upgrading postgresql@14
  14.5_5 -> 14.6

==> Pouring postgresql@14--14.6.big_sur.bottle.tar.gz
==> Caveats
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /usr/local/var/postgresql@14
For more details, read:
  https://www.postgresql.org/docs/14/app-initdb.html

To restart postgresql@14 after an upgrade:
  brew services restart postgresql@14
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/postgresql@14/bin/postgres -D /usr/local/var/postgresql@14
==> Summary
🍺  /usr/local/Cellar/postgresql@14/14.6: 3,312 files, 45.6MB
==> Running `brew cleanup postgresql@14`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /usr/local/Cellar/postgresql@14/14.5_5... (3,309 files, 45.5MB)
Removing: /Users/stergios/Library/Caches/Homebrew/postgresql@14--14.5_5... (11.6MB)
Removing: /Users/stergios/Library/Caches/Homebrew/postgresql@14--14.5_2... (11.6MB)
Removing: /Users/stergios/Library/Caches/Homebrew/postgresql@14--14.5_3... (11.6MB)
Removing: /Users/stergios/Library/Caches/Homebrew/postgresql@14--14.5_4... (11.6MB)
Removing: /Users/stergios/Library/Caches/Homebrew/postgresql@14--14.5_1... (11.6MB)
```
