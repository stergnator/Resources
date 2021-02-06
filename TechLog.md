---
title: "Tech Notes for STM"
output: pdf_document
---

# Tech Notes for STM

## Friday 2/5/2021

* Installed `go` on `lastX86`

```bash
cd ~/src/update-golang
git pull
sudo ./update-golang.sh

# Add /usr/local/go/bin:/Users/stergios/go/bin to PATH
```


* Installing `perl` using `asdf` on `lastX86`
Following instructions found [here](https://blog.psantos.dev/installing-and-start-using-asdf-on-macos-high-sierra/)

```bash
asdf plugin-add perl
asdf list-all perl | tail
asdf install perl 5.32.1

# Much waiting while perl compiles

$ asdf list-all perl
    No version set for command perl
    Consider adding one of the following versions in your config file at
    perl 5.32.1

$ asdf global perl 5.32.1
$ which perl
    /Users/stergios/.asdf/shims/perl

$ perl -v
    This is perl 5, version 32, subversion 1 (v5.32.1) built for darwin-thread-multi-2level
    (with 1 registered patch, see perl -V for more detail)
```

```bash
# Let’s check the installed plugins running the following command:

$ asdf plugin-list

# This command should give us a list of installed plugins. But at this point, it will return a warning saying “Oohe nooes ~! No plugins installed“. The message is clear, we did not install any plugin yet. So, let’s install our first plugin. The Ruby plugin:

$ asdf plugin-add ruby

# Now it’s time to install one or more Ruby versions. But first, let’s see what versions are available:

$ asdf list-all ruby

# As you can see, a list of all available versions was returned, even the latest preview (2.6.0-preview1). I want to install the version 2.5.1, the latest stable one, so I run:

$ asdf install ruby 2.5.1

```


## Thursday 2/4/2021

* Full Text Search Ranking in PostgreSQL

[Controlling Text Search](https://www.postgresql.org/docs/current/textsearch-controls.html#TEXTSEARCH-RANKING) in PostgreSQL.

## Wednesday 2/3/2021

### PostgreSQL / GoLang `sql.NullString` and `sql.NullInt64`

`SQL` has different null values than `Golang`. 

So how do you [work with `SQL NULL` values and `JSON`](https://stackoverflow.com/questions/33072172/how-can-i-work-with-sql-null-values-and-json-in-a-good-way)?

`sql.NullInt64` and `sql.NullString` do not implement marshaling or
unmarshaling.  When there is no marshaling the default rules apply. Accordingly,
they get marshaled as an object with their fields as attributes.

The `sql.Null`[`String`, `Int64`, `Float64`, `Bool`] types have two fields: one
is a typed value and the other is a boolean value. You can use the typed value
to get either the value that's been set, or the type's "zero value" if it hasn't
been set.

    tags = tags4Scan.String

The definition of `sql.NullString` :

```go
    type NullString struct {
        String string
        Valid  bool // Valid is true if String is not NULL
    }
```

`sql.NullString` is a way to represent null string coming from SQL (which
correspond to "NULL").

**Note**:  If SQL NULL's become more of a problem, then switch to the `null.v3`
package so you won't need to implement any of the marshaling or unmarshaling
methods. It's a superset of the sql.Null structs. [See this for more information](https://stackoverflow.com/questions/33072172/how-can-i-work-with-sql-null-values-and-json-in-golang-in-a-good-way#answer-50807801)

### Homebrew Python Is Not For You

[Lobste.rs Article](https://lobste.rs/s/vhfoga/homebrew_python_is_not_for_you)

[Source Article](https://justinmayer.com/posts/homebrew-python-is-not-for-you/)

At some point Homebrew made changes that adversely affect Python development.
While Homebrew’s Python formula has been the go-to choice for Python developers
for a long time, that time is past — there are now much better
options available.

What happened? For example you might see this error:

    The Python interpreter referenced by the virtual environment no longer exists.

But how can that be? You didn’t change anything! You didn’t change anything, but
Homebrew did.

Of the adverse changes Homebrew made recently, two stand out as root causes of
this problem.

  * First, Homebrew now upgrades dependent packages automatically. So if you
    upgrade any package that depends on the python formula2 (and there are
    nearly 400 of them), then your Python interpreter will be upgraded also —
    whether you like it or not. You have no control over this.

  * Second, Homebrew now automatically deletes previous versions every 30 days,
    including of course any Python interpreters you used to create
    virtual environments.

#### Best Tool For the Job

There are several solutions that put you back in control of when Python versions
are installed, upgraded, and removed. Personally, I use
[asdf](https://asdf-vm.com/) and its [Python
plugin](https://github.com/danhper/asdf-python) to do [just
that](https://hackercodex.com/guide/python-development-environment-on-mac-osx/).
I prefer asdf to similar tools such as Pyenv and Pythonz because not only can
you install multiple Python versions but also multiple Node.js versions, Ruby
versions, and [many more](https://asdf-vm.com/#/plugins-all?id=plugin-list).

After switching to this solution, would you like to guess how many times I’ve
had something break due to a Python upgrade? Right: Zero. Zero times. Because I
am now in control of when older Python versions are swept away, I can upgrade
virtual environments at my leisure, and then, once I’ve confirmed no other
environments rely on older versions, I can then uninstall those old Python
versions without worrying about something breaking.

* I am following the directions on this page: [core-manage-asdf](https://asdf-vm.com/#/core-manage-asdf)

* I installed `asdf` on RoadRunner, but I am hesitant to go any further for fear
  of messing up my development environment on RR.  Instead, I will instal it on
  `lastx86` and let it be the basis of my development environment on that
  machine.

## Monday 2/1/2021

* Finished adding removing the click handler from the cluster run table on the
  Cluster Viewer tab due to pagination.  Used some cool css selectors to achieve this.

* JQuery selector for table cells except first/last row/column
[source](https://stackoverflow.com/questions/4027855/jquery-selector-for-table-cells-except-first-last-row-column)

You can use `:not()` with the `:first-child` and `:last-child` selectors, like this

```javascript
$('table tbody tr td:not(:first-child, :last-child)')
```

To exclude first/last rows as well:

```javascript
$('table tr:not(:first-child, :last-child) td:not(:first-child, :last-child)')
```

## Thursday 1/28/2021

### Permanently remove files and folders from Git repo

Instructions taken from [https://dalibornasevic.com](https://dalibornasevic.com/posts/2-permanently-remove-files-and-folders-from-a-git-repository)

Also see [bfg](https://rtyley.github.io/bfg-repo-cleaner/) for faster and more
advanced options.  For example, remove very large files or remove only older
versions of files that may have secrets in them.

```bash
# How to delete a file from git:

git filter-branch --tree-filter 'rm -rf src/html2/assets/css/1' 26835e6b8cce638b94e6b394f38c424ab765047a..HEAD
git push origin master --force
git push ghorigin master --force

# No make sure you add the '-f' flag to 'filter-branch`
git filter-branch -f --tree-filter 'rm -rf src/html2/assets/tmp' 26835e6b8cce638b94e6b394f38c424ab765047a..HEAD
git push origin master --force
git push ghorigin master --force

```

## Wednesday 1/27/2021

* To place text in the center of the doughnut chart see this [resource](https://stackoverflow.com/questions/37384092/chart-js-doughnut-with-rounded-edges-and-text-centered)
using the Chart.pluginService.  

* However, that is a very advanced approach.  For a simpler approach see this [resource](https://jsfiddle.net/mgyp0jkk/)  which I lifted from this
[page](https://stackoverflow.com/questions/20966817/how-to-add-text-inside-the-doughnut-chart-using-chart-js)

## Tuesday 1/26/2021

* JQuery given a node, find an element inside of it.

```javascript
// get the text in the 3rd column in the table's first row.
$("table#myTable).closest('tr').find('td:eq(2)').text();
```

## Friday 1/22/2021

* One way to specify HTML Table Column Sizes

When all else failed trying to use DataTable column sizing, this method worked for me:
[source](https://stackoverflow.com/questions/928849/setting-table-column-width)

```html

<table style="width: 100%">
    <colgroup>
       <col span="1" style="width: 15%;">
       <col span="1" style="width: 70%;">
       <col span="1" style="width: 15%;">
    </colgroup>
    <!-- Put <thead>, <tbody>, and <tr>'s here! -->
    <tbody>
        <tr>
            <td style="background-color: #777">15%</td>
            <td style="background-color: #aaa">70%</td>
            <td style="background-color: #777">15%</td>
        </tr>
    </tbody>
</table>

```

* Prevent DataTables from ordering rows [source](https://stackoverflow.com/questions/16335928/how-to-remove-sorting-option-from-datatables)

```javascript
$('#example').DataTable({
    "ordering": false
});
```

As of 2018, the way to achieve this, per field, follows.  As you can see,
targets accepts an array of column indexes.

```javascript
$('#id-of-my-table').DataTable({
    "columnDefs": [
        { "orderable": false, "targets": [0, 4, 5, 6] },
        { "orderable": true, "targets": [1, 2, 3] }
    ]
});
```


* Can I see the sql query in Go database/sql after parameter expansion?

It doesn't look like it inserts parameters in the query itself. It sends the query, then waits for the response to send parameters.  [source](https://stackoverflow.com/questions/20913669/see-query-with-arguments-in-go-database-sql-package)

A solution is to have Postgres handle it by logging the statements executed against it.

* PostgreSQL How to see which queries have run.

You must turn on the server log to log every call to the database server.

```log
log_statement = all
```

Do not use `log_statement = all` on a production server. 

* PostgreSQL Logging Information

PostgreSQL is very advanced when related to logging techniques.  [See source](https://stackoverflow.com/questions/8208310/postgresql-how-to-see-which-queries-have-run) for the following tidbits.

Logs are stored in `Installationfolder/data/pg_log folder`. While log settings are placed in `postgresql.conf` file.

Log format is usually set as `stderr`. But CSV log format is recommended. In order to enable CSV format change in

```log
log_destination = 'stderr,csvlog'
logging_collector = on
```

In order to log all queries, very useful for new installations, set min. execution time for a query

```log
log_min_duration_statement = 0
```

In order to view active Queries on your database, use

```sql
SELECT * FROM pg_stat_activity
```

To log specific queries set query type

```log
log_statement = 'all'           # none, ddl, mod, all
```

# Thursday 1/21/2021

* Go Golang regex

```go
/**
 * Parses url with the given regular expression and returns the
 * group values defined in the expression.
 *
 */

// 'data[15_1][Name]' - find 3 values in this string:
params, err := getParams(`data\[(?P<ClusterRunId>\d+)_(?P<ClusterId>\d+)\]\[(?P<ColName>Name)\]`, key)
 
 func getParams(regEx, s string) (paramsMap map[string]string, err error) {

  err = errors.New("no matches")

  var compRegEx = regexp.MustCompile(regEx)
  match := compRegEx.FindStringSubmatch(s)

  paramsMap = make(map[string]string)
  for i, name := range compRegEx.SubexpNames() {
    if i > 0 && i <= len(match) {
      err = nil
      paramsMap[name] = match[i]
    }
  }
  return
}


```

* Javascript Scope

Be very careful of scope when creating DataTable's or Editor's in a loop.
"let", and "const" is block scope and must be used in this scenario, while "var"
is function scope.

* Go Golang `map`

```go
m := echo.Map{}  // Map defines a generic map of type `map[string]interface{}`.
if err := c.Bind(&m); err != nil {
  return err
}

// Iterating over a map entries
for key, value := range m {
  // We know the type of "key", it is a string
  // But what is thetype of "value".  For that we need "type assertion"
  valueStr, ok := value.(string)  // This is "type assertion" in golang.
  if ( ok ) {
    log.Printf("%s() key '%s', value: '%s'\n", fn, key, valueStr)
  }
}
```


# Friday 1/15/2021

## VSCode Folding

* [VSCode Folding Knowledge](https://code.visualstudio.com/docs/editor/codebasics#_folding)

Folding regions are by default evaluated based on the indentation of lines. A folding region starts when a line has a smaller indent than one or more following lines, and ends when there is a line with the same or smaller indent.

Since the 1.22 release, folding regions can also be computed based on syntax tokens of the editor's configured language. The following languages already provide syntax aware folding: Markdown, HTML, CSS, LESS, SCSS, and JSON.

1. Toggle Fold (⌘K ⌘L) folds or unfolds the region at the cursor.
1. Fold Recursively (⌘K ⌘[) folds the innermost uncollapsed region at the cursor and all regions inside that region.
1. Unfold Recursively (⌘K ⌘]) unfolds the region at the cursor and all regions inside that region.
1. Fold (⌥⌘[) folds the innermost uncollapsed region at the cursor.
1. Unfold (⌥⌘]) unfolds the collapsed region at the cursor.
1. Fold All (⌘K ⌘0) folds all regions in the editor.
1. Unfold All (⌘K ⌘J) unfolds all regions in the editor.
1. Fold Level X (⌘K ⌘2 for level 2) folds all regions of level X, except the region at the current cursor position.
1. Fold All Block Comments (⌘K ⌘/) folds all regions that start with a block comment token.

# Thursday 1/14/2021

## VSCode location of `settings.json` and `keybindings.json`

* Global Settings: `~/Library/Application Support/Code/User/settings.json`

* Global Keybindings: `~/Library/Application Support/Code/User/keybindings.json`

* There is a `settings` section in a workspace file.  You can place workspace specific settings in there.
For global settings place them in the global settings above.

# Tuesday 1/12/2021

* I learned about the PostgreSQL `rank()` and `lag()` functions.

### PostgreSQL LAG() 

* The `LAG()` function lets access a row which comes before the current row at a
specific physical offset.

[PostgreSQL LAG() Examples](https://www.postgresqltutorial.com/postgresql-lag-function/)

### PostgreSQL RANK()

[PostgreSQL RANK() Examples](https://www.postgresqltutorial.com/postgresql-rank-function/)


```sql
SELECT iq2.periodname, iq2.periodtype, iq2.therank, iq2.previousperiodname
FROM (
  SELECT iq1.periodname, iq1.periodtype, iq1.therank,
    LAG (iq1.periodname, -1) OVER (
        ORDER BY iq1.periodtype DESC, iq1.periodname DESC
    ) AS previousperiodname
  FROM (
    SELECT periodname, periodtype,
    rank() over (
        partition by periodtype
        order by periodtype DESC, periodname DESC
    ) AS therank
    FROM leaderboard
    WHERE clusterrunid = $1::INT    -- 15
    GROUP BY periodtype, periodname
    ORDER BY periodtype DESC, periodname DESC
    ) AS iq1
  ) AS iq2
WHERE 
  (iq2.periodtype = 'y' AND iq2.therank <= 4) OR
  (iq2.periodtype = 'q' AND iq2.therank <= 12) OR
  (iq2.periodtype = 'm' AND iq2.therank <= 24) OR
  (iq2.periodtype = 'w' AND iq2.therank <= 52) ;
```

## Thursday 1/7/2021

* Updated `go` to version 1.15.6

```sh
cd ~/src/go/update-golang
sudo ./update-golang.sh
``

* Go notes on modules becoming the default in early 2021

"We suggest using modules, as they are the new standard and become default 
from go 1.16 (to be released in early 2021)."

Read about [Go code organization](https://golang.org/doc/code.html) to learn 
how to configure your environment. This extension works in both 
[GOPATH](https://github.com/golang/vscode-go/blob/master/docs/gopath.md) and 
module [modes](https://github.com/golang/vscode-go/blob/master/docs/modules.md). 



## Wednesday 1/6/2021

* DBeaver location of SQL scripts

DBeaver let's you save sql statements in files, and those files are stored in
`~/src/DBeaverData/workspace6/General/Scripts`.  I have this location included in
`RoadRunner`'s `BackUp.sh` script.

* Postman location of stored Requests

Postman let's you save http requests and save them in configurable
'collections'.  The location of these saved requests is `/Library/Application
Support/Postman/IndexedDB/file__0.indexeddb.leveldb`, and they are saved in
`LevelDB` format.  `LevelDB` is a key value store developed by Google and used
in Chrome and sometimes in Chromium/Electron based apps, one of which is
Postman.  This format is accessible via the tool `leveldbutil` on OSX, but only
in a 'dump' format, and not easily interpretable.

## Tuesday 1/5/2021


* PostgreSQL Log File

On a mac (roadrunner) `PostgreSQL` store's it's log file at '/usr/local/var/log/postgres.log'

* PostgreSQL Calculate "running total" for each row with Postgres

```sql
SELECT
  faqId, faqText, SUM(PercentOfTotal) OVER (ORDER BY theRank) AS SumOfTotal
FROM LeaderBoard ;
```

* PostgreSQL Calculate "percentage of total" for each row with Postgres

```sql
SELECT
  *,  ROUND((value / SUM(value) OVER ()), 2) AS "PercentOfTotal"
FROM
  transactions
WHERE
  quarter = '2015-03-31' and company_id = 1;
```

We’re using “OVER ()”, which means the sum over all rows returned by the where clause.

[source](https://snippets.aktagon.com/snippets/741-calculating-percentage-of-total-for-each-row-with-postgres)

* DataTables Modify Rows as data is loaded

The `createdRow` callback is executed when a TR element is created (and all TD
child elements have been inserted), or registered if using a DOM source,
allowing manipulation of the TR element.

This is particularly useful when using deferred rendering (deferRender) or
server-side processing (serverSide) so you can add events, class name
information or otherwise format the row when it is created.

[DataTable.createdRow](https://datatables.net/reference/option/createdRow)

* DataTables Modify Cells as data is loaded

This is a callback function that is executed whenever a cell is created (Ajax
source, etc) or read from a DOM source. It can be used as a complement to
'columns.render' allowing modification of the cell's DOM element (add background
color for example) when the element is created (cells may not be immediately
created on table initialization if deferRender is enabled, or if rows are
dynamically added using the API (rows.add()).

[DataTable.createdCell](https://datatables.net/reference/option/columns.createdCell)

## Wednesday 12/23/2020

* PostgreSQL `IN` lookup using Placeholder Parameters

Replace the `IN` with `ANY` and use `pq.Array()` to pass the parameters.
[source](https://stackoverflow.com/questions/20271123/how-to-execute-an-in-lookup-in-sql-using-golang)

```sql
stmt, err := db.Prepare("SELECT * FROM awesome_table WHERE id= $1 AND other_field = ANY($2)")
rows, err := stmt.Query(10, pq.Array([]string{'this','that'})
```

* PostgreSQL Rank Partition

Need to select the top two items, grouped by color, and sorted by when they were created?
Then use window functions.

Window functions are similar to aggregate functions, but instead of operating on
groups of records to produce a single output record, they operate on records
related to the current row. We can use that to add a column to our result set
that represents the rank of each item in its respective group.

[Source](https://spin.atomicobject.com/2016/03/12/select-top-n-per-group-postgresql/)

* PostgreSQL ARRAY_AGG() function.  Collects all the input values into an array.  It is used with
the `GROUP BY` clause similarly to `sum()`, `avg()`, `min()`, `last()`, etc.

* Learned about jQuery $.ajax() chaining methods ".done()", ".fail()",
  ".always()".  They replace the "success" and "error".  It decoupling success
  callback function from the ajax function so later you can add your own
  handlers without modifying the original code (observer pattern). [Source](https://stackoverflow.com/questions/8847829/what-is-difference-between-success-and-done-method-of-ajax)

## Thursday 12/3/2020

### Zendesk Info

* Possible Alternative for logging in

```python
# https://develop.zendesk.com/hc/en-us/articles/360001068667-Getting-large-data-sets-with-the-Zendesk-API-and-Python#basic

credentials = 'my_email' + '/token', 'my_api_token'
session = requests.Session()
session.auth = credentials

credentials = 'example@outlook.com' + '/token', 'qPbD6eTsXNC4aBIDs4UkHYD3fss6fdfalnZDjmSN'
```

Did you check if token access is enabled in your Zendesk? In the agent
interface, click Admin (gear icon) in the lower-left, then API in the Channels
category. On the Channels/API page, verify that Token Access is enabled (the
blue checkbox). If not, make sure to click the Save button after selecting the
checkbox.

Basic reporting might be limited, but you can try "Insights", it's definitely a whole different thing; the only thing is that it depends on the plan you have.

## Tuesday 12/1/2020

### Upgraded Go Lang

I use the upgrade script made available by [http://github/udhos/update-golang](https://github.com/udhos/update-golang)

```bash
go version
    go version go1.14.3 darwin/amd64

cd ~/src/go/update-golang
git pull
less README.md
sudo ./update-golang.sh

go version
    go version go1.15.5 darwin/amd64
```

## Tuesday 11/24/2020

### Run *find* and *grep* Only on Text Files

```bash
find . -type f -exec grep -Iq Atomic \{\} \; -print
```

The -I option to grep tells it to immediately ignore binary files and the .
option along with the -q will make it immediately match text files so it goes
very fast. You can change the -print to a -print0 for piping into an xargs -0
or something if you are concerned about space.

Info taken from [http://stackoverflow.com](https://stackoverflow.com/questions/4767396/linux-command-how-to-find-only-text-files#13659891)

## Monday 11/23/2020

* Python3.* Changes

python@3.9 was installed and python@3.8 became keg-only without my intentions.

So many *brew* packages depend on the latest version of python. It is
inevitable that one of these will require the next version of python before I
am ready for it.  If I am going to continue developing on the mac I must start
using python env's again.

### Show all the packages that depend on python or any *brew* package

```bash
brew uses --installed python@3.9
  dbcli/tap/litecli        glib                     libass                   openssh                  sip
  ddgr                     gobject-introspection    librsvg                  pango                    sphinx-doc
  ffmpeg                   gstreamer                macvim                   pgcli                    youtube-dl
  gdb                      imagemagick              mdbtools                 pyqt
  gdk-pixbuf               ldns                     numpy                    scipy
```

### Update / Install all necessary python packages

```bash
cd ~/src/faq.git/src/python && pip3 install -r requirements_noversions.txt
```

## Thursday 10/29/2020

### Setting up `GOPATH` directory for development

I am changing how/where the go source code resides and where it executes.  In
doing so, we need to make sure the go packages/libraries reside in the new
GOPATH location.

```bash
export GOPATH=/usr/local/far/go
go get github.com/davecgh/go-spew/spew
go get github.com/gorilla/websocket
go get github.com/labstack/echo
go get github.com/lib/pq  
```

## Tuesday 10/27/2020

### Install Problems with Homebrew Again

I keep getting caught off guard or surprised by the decisions homebrew makes
when I ask it to `upgrade` a package.  Seemingly safe packages to upgrade (e.g.
`stunnel`) which have no obvious relevance to major packages my development
projects depend on cause the major packages to get upgraded.  The aforementioned
`stunnel` caused and upgrade from `PostgreSQL-12_4` to `PostgresSQL-13`.  

Bottom line: I need to be more careful when using brew to upgrade seemingly simple programs,
and I need a better way to manage development environments.  For python it is simple, I should be
using virtual environments.  For PostgreSQL, perhaps I should run it via Docker?

### Upgraded to PostgreSQL 13

This was a MAJOR UPGRADE to 13.0 FROM 12.4. I was fooled into this by `homebrew`.  I
was upgrading `stunnel` and somehow `PostgreSQL13` was needed as a dependency!

* Automatic Database Migration Fails

In order to migrate existing data from a previous major version of PostgreSQL the following command must be run:

```bash
brew postgresql-upgrade-database
```

However, this fails because some lines in `/usr/local/var/postgres/pg_hba.conf`
have the access method of `md5`.  These lines must be temporarily set to `trust`
while the conversion is being performed.  Inexplicably, the normal PostgreSQL environment variables
are ignored during this process.

```bash
85 # TYPE  DATABASE        USER            ADDRESS                 METHOD
86
87 # "local" is for Unix domain socket connections only
88 local   all             all                                     md5
89 # IPv4 local connections:
90 host    all             all             127.0.0.1/32            md5
91 host    all             all             192.168.86.0/24         md5
92 # IPv6 local connections:
93 host    all             all             ::1/128                 md5
94 # Allow replication connections from localhost, by a user with the
95 # replication privilege.
96 local   replication     all                                     trust
97 host    replication     all             127.0.0.1/32            trust
98 host    replication     all             ::1/128                 trust
```

* Allow All IP-Addresses to Connect

You must edit `/usr/local/var/postgres/postgresql.conf` to allow this. Edit line
63 to be `listen_addresses = '*'` to allow all IP address to be listened on.

You could set it to just `192.168.86.21`, my current wifi IP-Address, but that
disallows listening on the hardwired Ethernet IP-Address, or perhaps the
IP-Address at a coffee shop / corporate office where this product is being
demonstrated.  This, it needs to be `'*'`.

* Finally, restart PostgreSQL to catch all the changes.

```bash
brew services stop postgresql
brew services start postgresql
```

## Monday 8/17/2020

* Common Table Expressions
Can be useful for self-referential table like the money.posts table.

Resource: [cybertec-postgresql.com]( https://www.cybertec-postgresql.com/en/recursive-queries-postgresql/ )

```sql
WITH RECURSIVE cteans AS (
  SELECT id, acceptedanswerid, posttypeid, parentid, body , 0 AS level
  FROM posts
  WHERE id = 2
UNION ALL
  SELECT posts.id, posts.acceptedanswerid, posts.posttypeid, posts.parentid, posts.body , cteans.level + 1
  FROM posts
    JOIN cteans ON posts.parentid = cteans.id
)
SELECT * FROM cteans ;

-- OR --

WITH RECURSIVE cteans AS (
  SELECT id, acceptedanswerid, posttypeid, parentid, body,id::text as path
  FROM posts
  WHERE id = 2
UNION ALL
  SELECT posts.id, posts.acceptedanswerid, posts.posttypeid, posts.parentid, posts.body, cteans.path || ' -> ' || posts.id::text
  FROM posts
    JOIN cteans ON posts.parentid = cteans.id
)
SELECT * FROM cteans ;

```



## Monday 8/3/2020

* To find out which packages a file belongs to, one simple approach is:

```bash
function brew_find_pkg {

    cmds_to_search="$@"
    brew_bin=$( brew --prefix )/bin

    for cmd in $cmd_to_search ; do

        if [ -L $brew_bin/$cmd ] ; then
            \ls -l $brew_bin/$cmd |cut -f 2 -d '>'
        else
            echo "$cmd is not a brew command"
        fi
    done
}
```

--or--

```bash
find $(brew --prefix)/Cellar/ | grep somefilename
```

More accurately, 

```bash
find $(brew --cellar) -name somefilename 
```

## Thursday 7/30/2020


* [https://plotly.com/javascript/] 
Built on top of d3.js and stack.gl, Plotly.js is a high-level, declarative
charting library. plotly.js ships with over 40 chart types, including 3D
charts, statistical graphs, and SVG maps.  plotly.js is free and open source
and you can view the source, report issues or contribute on GitHub.

* Use webpack [ https://webpack.js.org ] to bundle javascript files together into one javascript file.

## Wednesday 7/29/2020

* Rule of thumb for me is that every DELETE or UPDATE query should start life as a SELECT query.
  * The eight stages of DELETE:
1. SELECT what you're deleting;
1. fix the mistake in the query (there's always one);
1. SELECT again;
1. BEGIN TRANSACTION;
1. DELETE;
1. SELECT to confirm the right deletion -- twice for good measure, and maybe ROLLBACK once or twice if you're feeling twitchy;
1. Hover finger anxiously over the un-entered COMMIT command for several seconds while resisting Dunning–Kruger effect;
1. COMMIT. :)





* Working with Arrays in PostgreSQL

Info taken from [https://hakibenita.com/sql-tricks-application-dba]

```sql

select ARRAY[9,8,7,6, 1,2,3,4,5] ;
        array
        ---------------------
         {9,8,7,6,1,2,3,4,5}

money=# select ARRAY[9,8,7,6, 1,2,3,4,5] where 3 = ANY( ARRAY[9,8,7,6, 1,2,3,4,5] ) ;
    array
---------------------
{9,8,7,6,1,2,3,4,5}
(1 row)

money=# select ARRAY[9,8,7,6, 1,2,3,4,5] where -3 = ANY( ARRAY[9,8,7,6, 1,2,3,4,5] ) ;
 array
-------
(0 rows)

-- Very neat use of arrays to help find duplicate values (normlaized_email in this case)
SELECT
    lower(email) AS normalized_email,
    min(id) AS convert_to_user,
    array_remove(ARRAY_AGG(id), min(id)) as convert_from_users
FROM
    users
GROUP BY
    normalized_email
HAVING
    count(*) > 1;


```

## Tuesday 7/28/2020

* Insert a serialized pkl object into postgreSQL

Requires a table with column of "bytea" type to store the pickled sklearn model in binary format.


```python

CREATE TABLE modelTable (
  id SERIAL PRIMARY KEY,
  model BYTEA NOT NULL
);

import psycopg2

query = "INSERT INTO modelTable (modelField) VALUES (%s)"
cur = connection.cursor()
cur.execute(query, (pickle.dumps(model)))
cur.execute(sql, (psycopg2.Binary(pickle.dumps(model))))
connection.commit()


-- now read it back in

cur.execute("SELECT id, model FROM modelTable WHERE id=42")
blob = cur.fetchone()
id = blob[0]
model = pickle.loads(blob[1])

```



* VSCode Use the Interactive Window to develop Python Scripts
  - You can create cells on a Python file by typing "#%%"
  - Use "Shift + Enter " to run a cell, the output will be shown in the interactive window

* Produce the quarter from a timestamp field 

```sql
select creationdate, to_char(creationdate, 'FMYYYY-Q') from posts limit 5 ;
    creationdate       | to_char
    -------------------------+---------
    2009-10-06 03:02:46.713 | 2009-4
    2009-10-06 03:26:46.02  | 2009-4
    2009-10-06 11:54:20.533 | 2009-4
    2009-10-06 23:30:12.387 | 2009-4
    2009-10-07 02:41:12.607 | 2009-4
    (5 rows)
```


## Monday 7/27/2020

* PostgreSQL List all values of a non-aggregated field into 1 column.

```sql
SELECT a, array_agg(b), string_agg(c) 
FROM t 
GROUP BY a 
ORDER BY a;
```

## Friday 7/24/2020

* PostgreSQL save query to a CSV file

```sql
\pset format csv
\o 2018-2017-leaderboard.csv
RUN QUERY
\o -- turn off file capture
\pset format aligned -- return to normal output

```

* Looping in PostgreSQL PL/pgSQL using simple variables

```sql
DO $$
DECLARE
y int;  -- year
qs int;  -- quarter start
qe int;  -- quarter end
qst text; -- quarter start in text
qet text; -- quarter end in text
qname text;
DECLARE v_year TEXT;
BEGIN
  FOREACH y IN ARRAY ARRAY[[2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019]]
  LOOP
    FOREACH qs IN ARRAY ARRAY[[1, 4, 7, 10]]
    LOOP
        qe = qs + 2 ;
        qst = to_char(y, 'FM0000') || '-' || to_char(qs, 'FM00') ;
        qet = to_char(y, 'FM0000') || '-' || to_char(qe, 'FM00') ;
        qname = to_char(y, 'FM0000') || '-Q' || to_char(qe/3, 'FM0') ;
        RAISE NOTICE 'row = "%", "%", "%"', qst, qet, qname ;
    END LOOP;
  END LOOP;
END;
$$;
```


* Find the ordinal number of a row in a query 
  * The ROW_NUMBER() function is a window function that assigns a sequential integer to each row in a result set.
  * Make sure the both order by clauses have the same set of fileds to get the intended result

```sql
SELECT f.faqid, count(cqt.qtextid), row_number()  OVER (ORDER BY FIELD01 DESC , FIELD02 ASC) AS rank
FROM SOMETABLES
WHERE SOMECLAUSES
GROUP BY SOMEFIELDS
ORDER BY FIELD01 DESC , FIELD02 ASC
;
```

## Tuesday 7/21/2020

### OpenAI's GPT-3

(no action here, just a note to keep this in mind)

You probably saw some AI postings regarding GPT-3 the past couple of days.  Near the bottom of it's github introduction is this quote:

* "Finally, we find that GPT-3 can generate samples of news articles which human evaluators have difficulty distinguishing from articles written by humans." [github.com/openai/gpt-3]( https://github.com/openai/gpt-3 )

Here's a almost breathless review of it, which if only half true, makes me think we can take use gpt-3 later this year as they plan for a subscription service: [www.technologyreview.com](https://www.technologyreview.com/2020/07/20/1005454/openai-machine-learning-language-generator-gpt-3-nlp/)

### Try the ipdb Debugger (IPython pdf) in Python

I use `import ipdb; ipdb.set_trace()` in python almost pathologically. It’s 1 step
up from an exception cause it drops you to a REPL, which is super convenient.

With 3.7 we now have `breakpoint()` as a built-in.

## Monday 7/20/2020

### Postgresql Update Query with SubQuery

```bash
UPDATE dummy
SET customer=subquery.customer,
    address=subquery.address,
    partn=subquery.partn
FROM (SELECT address_id, customer, address, partn
      FROM  /* big hairy SQL */ ...) AS subquery
WHERE dummy.address_id=subquery.address_id;
```

## Friday 7/17/2020

### Do not use WSL with VirtualBox

I lost the unbuntu image "ub20" running under virtual box.

_MSFT Hyper-V caused VirtualBox to ruin the original ub20 image.  Something about a level 1 hypervisor will not all a level 2 hypervisor to work._

More details about Hyper-V causing VirtualBox to fail may be found are here: [r/virtualbox](https://www.reddit.com/r/virtualbox/comments/g71tb0/how_do_i_fix_error_when_installing_ubuntu_on/?utm_source=BD&utm_medium=Search&utm_name=Bing&utm_content=PSR1)

## Friday 7/10/2020

### Using the Python Extension in VSCode  

You can execute python code inside of a file using "Cells"

* Create a cell using `#%%` on column 0
* Press `Shift+Enter` to run a cell.
* Results appear in interactive window.

### Git Reports

```bash
git log --pretty=oneline --graph --decorate --name-status
git diff --stat GEAD~3 HEAD~2
git log --name-only
git log --name-status
git log --stat
git log --stat --pretty=short --graph
git lof --name-only --pretty=format:
```

Use `git blame` and `git show` to track a line in a file and find out who edited the line.

```bash
git show --oneline
git show--pretty
git show HEAD~3 HEAD~2
```

## Wednesday 7/1/2020

### DNS at Home

* I switched to NextDNS.io about a month ago ~ 6/6/2020
* [https://my.nextdns.io/account] - NextDNS can be used for free up to 300,000 queries each month, after which all features will be disabled temporarily until next month.
* As of 7/1/2020 I made 173,862 dns queries from my mac book.  I should be safely below the 300K threshold for a while.

### Microsoft/Azure Text Analytic Services

* Named Entity Recognition
* Entity Linking
* Key Phrase Extraction
* [https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/]

### Microsoft QnA Maker Service

* It can be used to find the most appropriate answer for any given natural language input, from your custom knowledge base (KB) of information.
* [https://docs.microsoft.com/en-us/azure/cognitive-services/qnamaker/overview/overview]

### Microsoft Langauge Understanding (LUIS)

* Language Understanding (LUIS) is a cloud-based API service that applies custom machine-learning intelligence to a user's conversational, natural language text to predict overall meaning, and pull out relevant, detailed information.
* A client application for LUIS is any conversational application that communicates with a user in natural language to complete a task. Examples of client applications include social media apps, chat bots, and speech-enabled desktop applications.
* [https://docs.microsoft.com/en-us/azure/cognitive-services/luis/what-is-luis]

## Friday 6/26/2020

### Docker Knowledge

* What does the `docker system` command do?

```bash
    docker system df             # Show docker disk usage
    docker system prune –volumes # Prune images, containers, networks & volumes
    docker system info           # Display system-wide information
```

* How to load a docker image onto a different system

```bash
    sudo docker save paiapps > paiapps_save.tar
    bzip2 --best paiapps_save.tar
    rsync -av --progress paiapps_save.tar.bz2 ${DESTCOMPUTER}
    ssh ${DESTCOMPUTER}
    bunzip –c paiapps_save.tar.bz2 | sudo docker load
```

## Tuesday 6/23/2020

### WebSocket Info

* Mozilla: [https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API/]

* Writing_WebSocket_client_applications

  * I might have to use SSL!!!  The constructor will throw a SecurityError if the destination doesn't allow access. This may happen if you attempt to use an insecure connection (most user agents now require a secure link for all WebSocket connections unless they're on the same device or possibly on the same network).

  * Not True?  I test this on ub20, and on azure-vm, and I did not get this error!  Phew!  I did not want to deal with this at the moment.

## Wednesday 6/17/2020

* Can always connect using the template1 role/DB on PostgreSQL

```bash
        psql –U postgres template1
```

## Friday 6/12/2020

### How can I check the syntax of Python script without executing it?

```bash
python -m py_compile script.py
```

### TLS Strategy

A general strategy is that you run a GoLang ap behind a reverse proxy, typically Nginx.  Basic work flow is configure Nginx to list on port 80 or 443 and pass calls to your local Go Lang app on port 8080 or 8000.  You run your Go app as a `systemd` service so that the application can keep running; so in the event that it crashes is starts back up automatically.

An advantage of Nginx is to let it serve statically-gzipped assets

### WSGI & Werkzeug

* There are many web servers: Apache, Nginx, Lighttpd, etc.

* There are many web frameworks written in Python, e.g. Django, Flask, Tornado, Pyramid, etc.

* Goal: Make all interoperable. That's where WSGI comes in.

There are two sides involved in responding to a client's HTTP request: the web server and the web application. The server handles the intricacies of the network connections, receiving the request, and sending the response. The application takes the request data, acts on it, and crafts the response for the server to send back.

If you want to write a Python web application, make sure it has a callable object (such as a function) that accepts certain parameters for HTTP headers, input form data, environment variables, etc.

If you want to write a web server that serves Python apps, make it call that callable object from the application every time an HTTP request comes in.

The WSGI specification (in PEP 3333) specifies exactly what the parameters for that callable must be and what the return value should be, so every server knows how to talk to every application and vice versa.

Every web application needs to provide this callable and be able to handle the specific parameters it receives. Every application needs to do this... That sounds like a good opportunity to use a library. Werkzeug is this library.

Werkzeug provides utilities for developing WSGI-compliant applications. These utilities include: parsing headers, sending and receiving cookies, providing access to form data, generating redirects, generating error pages when there's an exception, even providing an interactive debugger that runs in the browser. It's really quite comprehensive. Flask then builds upon this foundation (and Jinja, Click, etc.) to provide a complete web framework.

Taken from [https://stackoverflow.com/questions/37004983/what-exactly-is-werkzeug]

Werkzeug(WSGI library) is like a communicator between your python code and http nginx/apache server

WSGI has two sides: the "server" or "gateway" side (often a web server such as Apache or Nginx), and the "application" or "framework" side (the Python script itself). To process a WSGI request, the server side executes the application and provides environment information and a callback function to the application side. The application processes the request, returning the response to the server side using the callback function it was provided.

Between the server and the application, there may be a WSGI middleware, which implements both sides of the API. The server receives a request from a client and forwards it to the middleware. After processing, it sends a request to the application. The application's response is forwarded by the middleware to the server and ultimately to the client. There may be multiple middlewares forming a stack of WSGI-compliant applications.

## Thursday 6/11/2020

### Check the size of a docker image

```bash
docker image inspect <imgName> --format='{{.Size}}' | numfmt --to=iec-I
```

TTY interactive terminal shell for the Postgres container

* To see a list of every container that is running, use this command:

```bash
docker ps
```

* Connect to the Postgres container. You only have to use the first three figures of its ID. Use the command docker exec:

```bash
docker exec -it <CID> /bin/bash
```

NOTE: The code above shows two flags: the -i which stands for “interactive” mode, and the TTY teletype flag represented by -t. The flags can be passed together or by themselves; however, each flag must be passed to make a Python PostgreSQL Docker Postgres container connection.

## Thursday 4/23/2020

* Enabled postgresql on mac to accept remote connections

1 Edit /usr/local/var/postgres/postgresql.conf to include the line:

`listen_addresses = '*'`

1 Edit /usr/local/var/postgres/pg_hba.conf to include the line:

```bash
# TYPE  DATABASE  USER    ADDRESS            METHOD

host    all       all     192.168.86.0/24    md5
```

* Finally make sure the `postgres` user has a password assigned to it:

```bash
ALTER USER user_name WITH PASSWORD 'new_password';
```

* Use these environment variables for connection in the future

```bash
export PGDATABASE=money
export PGUSER=stergios
export PGHOST=localhost
export PGPASSWORD=A_GOOD_PASSWORD_HERE
```

## Wednesday 3/11/2020

### Free/cheap hosting for Go web applications?

[https://www.reddit.com/r/golang/comments/fgvk3z/is_there_freecheap_hosting_for_go_web_applications/]

## Tuesday 3/10/2020

### web-worker

* Web Workers are a simple means for web content to run scripts in background threads. The worker thread can perform tasks without interfering with the user interface. In addition, they can perform I/O using XMLHttpRequest (although the responseXML and channel attributes are always null). Once created, a worker can send messages to the JavaScript code that created it by posting messages to an event handler specified by that code (and vice versa). This article provides a detailed introduction to using web workers.

* Taken from [https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Using_web_workers]

## Friday 2/28/2020

[ ] Learn GoLang Test procedures

* Need it to support the testing of SQL and URL requests

[x] Learn WebSockets

* I need a solution that works in GoLang.  The server needs to communicate with the GUI for long running back ground jobs.

## Thursday 2/20/2020

### Golang & Docker

* Official golang Docker area: [https://hub.docker.com/_/golang]
* Video 1:
 
[![Golang Docker](http://img.youtube.com/vi/UtNeLfXaBJM/0.jpg)](http://www.youtube.com/watch?v=UtNeLfXaBJM "Golang Docker")

* Video 2:

(Good stuff in here on Python.  Need to take notes.)

[![Learn Docker in 12 Minutes](http://img.youtube.com/vi/YFl2mCHdv24/0.jpg)](http://www.youtube.com/watch?v=YFl2mCHdv24 "Learn Docker in 12 Minutes")

<iframe width="560" height="315" src="https://www.youtube.com/embed/YFl2mCHdv24" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Generate a requirements.txt file for a python program

Necessary when creating docker files/images/containers.

```bash
pip3 install pipreqs
mkdir tempdir
rsync –av code.py tempdir
cd tempdir
pipreqs .
```

```bash
cat requirements.txt
    lxml==4.4.1
    psycopg2==2.8.3
    matplotlib==3.1.1
    pandas==0.25.1
    numpy==1.17.2
    nltk==3.4.5
    scikit_learn==0.22.1
```
