
# PostgreSQL Notes for STM

## Wednesday 11/16/2022

* Upgrad to 14.6 via brew 

```
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
