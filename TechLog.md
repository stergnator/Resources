---
title: "Tech Notes for STM"
output: pdf_document
---

<style type="text/css">
   ol {list-style-type: upper-alpha;}
   ol ol { list-style-type: decimal;}
   ol ol ol { list-style-type: lower-roman;}
   ol ol ol ol { list-style-type: lower-alpha;}
   ol ol ol ol ol { list-style-type: decimal;}
   ol ol ol ol ol ol { list-style-type: upper-roman;}
</style>

# Tech Notes for STM

---

## Monday 4/5/2023

### Tools to stream video to youtube and it's ilk.

- What are some tools I can use to stream video to twitch and youtube at the same time?
View other drafts

There are a number of tools you can use to stream video to Twitch and YouTube at the same time. Here are a few popular options:

- [`Restream`](https://restream.io/) is a popular multistreaming service that allows you to stream to multiple platforms at once, including Twitch, YouTube, Facebook, and more. It's free to use for up to three concurrent streams, and there are paid plans available for more advanced features.
- [`OBS Studio`](https://obsproject.com/) is a free, open-source, and cross-platform screencasting and streaming app that supports multistreaming. It's a bit more complex to set up than `Restream`, but it gives you more control over your stream settings.
- [`Streamlabs Desktop (formerly Streamlabs OBS)`](https://streamlabs.com) is based on OBS Studio. It offers streaming to multiple platforms, built-in chat widget and the ability to schedule your streams.  It is based on a fork of OBS Studio. Electron is used as the software framework for the user interface.
- [`XSplit`](https://www.xsplit.com/) is a paid live streaming and video-mixing application developed and maintained by SplitmediaLabs. It is mostly used for capturing gameplay for live streaming or video recording purposes and offers a number of features for professional streamers, including multistreaming, overlays, and scene transitions.
- [`StreamYard`](https://streamyard.com/) is a live streaming studio in your browser. Stream directly to Facebook, YouTube, LinkedIn, and other platforms. StreamYard makes it easy to broadcast your live show to all audiences on multiple platforms at once.

---

## Saturday 2/11/2023

- Install `pygame` on `Windows 11`

I tried many of the standard variations for installing `pygame` on `Windows 11`, but none of them worked.  Here is the one incantation that did work (it is the latest pre-release development version `2.1.3.dev8 > 2.1.2`):

```powershell
 # This is the only variation that worked for me.
C:\Python311\Scripts\pip3.11.exe install pygame --pre
Collecting pygame
  Downloading pygame-2.1.3.dev8-cp311-cp311-win_amd64.whl (10.6 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 10.6/10.6 MB 9.3 MB/s eta 0:00:00
Installing collected packages: pygame
Successfully installed pygame-2.1.3.dev8
```

The following variations did not work for me in a `regular` powershell terminal:

```powershell
C:\Python311\Scripts\pip3.11.exe search pygame
C:\Python311\Scripts\pip3.11.exe install pygame
C:\Python311\python.exe -m pip install --upgrade pip
C:\Python311\python.exe -m pip install -U pygame --user
C:\Python311\python.exe -m pip --default-timeout=1200 install -U pygame --user
```

My failed attempts from a powershell terminal with Administrator privileges follow:

```powershell
C:\Python311\python.exe -m pip install --upgrade pip
C:\Python311\python.exe -m ensurepip
C:\Python311\Scripts\pip3.11.exe install pygame
python.exe -m pip install --upgrade pip
```

### Where are my python `site-specific` folders on Windows 11?

- You can find the location of the user install folder for python with `python -m site --user-base`.

```powershell
python -m site --user-base
C:\Users\sterg\AppData\Roaming\Python
```

## Monday 2/6/2023

Investigate [Swagger](https://swagger.io/specification/)
The OpenAPI Specification (OAS) defines a standard, language-agnostic interface to HTTP APIs which allows both humans and computers to discover and understand the capabilities of the service without access to source code, documentation, or through network traffic inspection. When properly defined, a consumer can understand and interact with the remote service with a minimal amount of implementation logic.

An OpenAPI definition can then be used by documentation generation tools to display the API, code generation tools to generate servers and clients in various programming languages, testing tools, and many other use cases.


[Running the image from DockerHub](https://github.com/swagger-api/swagger-editor)

There is a docker image published in DockerHub.  To use this, run the following:

```bash
docker pull swaggerapi/swagger-editor
docker run -d -p 80:8080 swaggerapi/swagger-editor
```

This will run Swagger Editor (in detached mode) on port 80 on your machine, so you can open it by navigating to http://localhost in your browser.

## Thursday 2/2/2023

* Room requirments:
  * Main room perimeter is 27ft x 32ft = 118ft
  * Island ceiling perimeter is 9ft x 4ft = 26ft

* Modern LED Strip Standards:
  * WS2812B (5v) Max 16ft?
  * WS2811 (24v) Max 65ft?

[Interesing LED Supplier](https://www.superlightingled.com/ws2811-ip68-waterproof-led-strip-lights-24v-dream-color-1m50m-p-4484.html)

* (NightDriverStrip](https://github.com/PlummersSoftwareLLC/NightDriverStrip) is
a source code package for building a flash program that you upload to the ESP32
microcontroller. It can drive up to 8 channels of WS2812B style LEDs connected
to the chip pins and display fancy colors and patterns and designs on them.




## Wednesday 11/30/2022

* Use ffmpeg to Convert From MKV to MP4

```
ffmpeg -i  2021-03-11_LudicrousMode01-ClusterAnalysis.mkv  -c copy 2021-03-11_LudicrousMode01-ClusterAnalysis.mp4
ffmpeg -i  2021-03-11_LudicrousMode02-PAIReport.mkv        -c copy 2021-03-11_LudicrousMode02-PAIReport.mp4
```

## Thursday 10/27/2022

* Add Text Subtitle to Video 

Use ffmpeg to add text subtitles. This solution "burns the subtitles" into the
video, so that every viewer of the video will be forced to see them.

```
ffmpeg -i source_video.mp4 -vf subtitles=MySubTitles.srt output_video.mp4
```

Info taken from [this site](https://stackoverflow.com/questions/8672809/use-ffmpeg-to-add-text-subtitles#17584272)

## Tuesday 10/18/22

* How to Merge PDF Files on the Command Line

  * There are a plethera of seemingly viable answers on this [Stack
Exchange Page](https://apple.stackexchange.com/questions/230437/how-can-i-combine-multiple-pdfs-using-the-command-line)

  * Here's the solution I used:
```
 gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite  -sOutputFile=merged.pdf file01.pdf file02.pdf file03.pdf
```
 Info taken from [this site](https://personalinterests.lipingyang.org/2018/01/12/two-ways-to-merge-pdf-files-on-mac-gui-and-command-line/)

## Monday 9/19/2022

* Fixed PostgreSQL@14 update from homebrew

When I ran `brew upgrade` recently I noticed that `homebrew` had changed naming
conventions for `PostgreSQL`. The old name was `postgres` and the new names
include the version number, for example:  `postgresql@13` and `postgresql@14`

Even now after I ran `brew uninstall postgresql` it managed to delete `postgesql` as
well as `postgresql@14`.  Yikes!


Let's back up a bit.

When I ran `brew upgrade` today it updated postgresql to version 14.5.  However this caused a conflict
with what the brew services plist files were expecting as far as data directory locations.

I found the following versions of 5 different postgresql plist files one service file.
```
  1 /Library/LaunchDaemons/homebrew.mxcl.postgresql.plist
  2 ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  3 ~/Library/LaunchAgents/homebrew.mxcl.postgresql@13.plist
  4 ~/Library/LaunchAgents/homebrew.mxcl.postgresql@14.plist
  5 /usr/local/Cellar/postgresql@14/14.5_4/homebrew.mxcl.postgresql@14.plist
  6 /usr/local/Cellar/postgresql@14/14.5_4/homebrew.ostgresql@14.service
```

`#1` was from an older install, was wrong, was trying to start anyway, and
always starts trying to run as soon as the computer is booted. ( This was
causing duplicate error logging messages about postgres not being able to run.
The files found in `~/Library/LaunchAgents`  control/begin execution as soon
as the user logs in.

`#5` is the `Master` and keeps writing over what ever is in `
~/Library/LaunchAgents/`.

`#6` is where whoever/whatever creates `#5` get's it's data from.

`#2` and `#3` were old and I deleted them


## Friday 5/6/2022

 - [ ] What do the following argments `as` abd `rel` do for the html `link` statement?

```
<link as="script" rel="preload" href="/webpack-runtime-b623371871d7c250936e.js">
<link as="fetch" rel="preload" href="/page-data/index/page-data.json" crossorigin="anonymous">
<link rel="prefetch" href="/page-data/design/page-data.json" crossorigin="anonymous" as="fetch">
```


## Friday 2/11/2022

* Updating MacOSX via Command Line

I was trying to install a nonstandard package via brew, and the process printed out 
the following gemL

```
Error: Your Command Line Tools are too outdated.
Update them from Software Update in System Preferences or run:
  softwareupdate --all --install --force

If that doesn't show you any updates, run:
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install

Alternatively, manually download them from:
  https://developer.apple.com/download/all/.
You should download the Command Line Tools for Xcode 13.2.1.
```


## Monday 11/22/2021

* Install `lighttpd` on lastX86
  * Copy files to `/usr/local/var/www`

```
==> Pouring lighttpd--1.4.61.big_sur.bottle.tar.gz

Docroot is: /usr/local/var/www

The default port has been set in /usr/local/etc/lighttpd/lighttpd.conf to 8080 so that
lighttpd can run without sudo.

To start lighttpd now and restart at login:
  brew services start lighttpd
Or, if you don't want/need a background service you can just run:
  lighttpd -f /usr/local/etc/lighttpd/lighttpd.conf
==> Summary
🍺  /usr/local/Cellar/lighttpd/1.4.61: 75 files, 2.8MB

```

## Monday 11/15/2021

* Network tools

  * Mac OSX: pre Montery
    `netstat -rn -f inet | grep default | head -n 1 | awk '{ print $2 }'`
    `scutil --dns`
  Source take from [HN](https://news.ycombinator.com/item?id=29225308)

  * Montery: `networkQuality`

## Friday 10/29/2021

* SSH ProxyCommand example. Going through one host to reach another server


How do I use and jump through one server to reach another using ssh on a Linux
or Unix-like systems?

Yes. Use the SSH ProxyCommand and ProxyJump example.

We must use the `-W` flag: `-W host:port`

The `-W` flag requests that standard input and output on the client be
forwarded to host on port over the secure channel.  Implies -N, -T,
ExitOnForwardFailure and ClearAllForwardings, though these can be overridden in
the configuration file or using -o command line options.

```bash

Host iqmvjh
    HostName iq-dvaidata19.iqdca.local
    User stergios.marinopoulos
    IdentityFile /Users/stergios/.ssh/faq4096-iqm
    Port 22
    ProxyCommand ssh -q -W %h:%p c8
```



## Wednesday 10/20/2021

* Install `iterm2` shell integration

```
stergios@lastX86 ~/Pictures> curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5128  100  5128    0     0  33960      0 --:--:-- --:--:-- --:--:-- 33960
Downloading script from https://iterm2.com/shell_integration/zsh and saving it to /Users/stergios/.iterm2_shell_integration.zsh...
Checking if /Users/stergios/.zshrc contains iterm2_shell_integration...
Appending source command to /Users/stergios/.zshrc...
Downloading imgcat...
Downloading imgls...
Downloading it2api...
Downloading it2attention...
Downloading it2check...
Downloading it2copy...
Downloading it2dl...
Downloading it2getvar...
Downloading it2git...
Downloading it2setcolor...
Downloading it2setkeylabel...
Downloading it2ul...
Downloading it2universion...
Adding aliases...

--------------------------------------------------------------------------------

Done.
iTerm2 shell integration was installed!

A script was installed to /Users/stergios/.iterm2_shell_integration.zsh
Utilities were installed to /Users/stergios/.iterm2. You don't need to modify your PATH because /Users/stergios/.iterm2_shell_integration.zsh includes aliases for them.

To make it work right now, do:
  source /Users/stergios/.iterm2_shell_integration.zsh

This line was also added to /Users/stergios/.zshrc, so the next time you log in it will be loaded automatically.

--------------------------------------------------------------------------------

You will also have these commands:
imgcat filename
  Displays the image inline.
imgls
  Shows a directory listing with image thumbnails.
it2api
  Command-line utility to manipulate iTerm2.
it2attention start|stop|fireworks
  Gets your attention.
it2check
  Checks if the terminal is iTerm2.
it2copy [filename]
  Copies to the pasteboard.
it2dl filename
  Downloads the specified file, saving it in your Downloads folder.
it2setcolor ...
  Changes individual color settings or loads a color preset.
it2setkeylabel ...
  Changes Touch Bar function key labels.
it2ul
  Uploads a file.
it2universion
  Sets the current unicode version.

```

## Wednesday 10/6/2021

* Handle refresh page event with javascript

You need to use the
[beforeunload](https://developer.mozilla.org/en-US/docs/Web/API/WindowEventHandlers/onbeforeunload)
event.

The onbeforeunload property of the WindowEventHandlers mixin is the event
handler for processing beforeunload events. These events fire when a window is
about to unload its resources. At this point, the document is still visible and
the event is still cancelable.


## Monday 9/20/2021

* Managing python projects on the Mac

```
brew install python
python -m venv .venv
source .venv/bin/activate
pip install ...
```


## Thursday 9/2/2021



* Postgresql To Return 0 when Null

Use `max(coalesce(logincount, 0))` to avoid NULLs

The above will still return NULL if the no rows match the WHERE clause. If that is
not wanted, use `coalesce(max(logincount),0)` instead

According to Postgres docs (9.6):

    The COALESCE function returns the first of its arguments that is not null.
    Null is returned only if all arguments are null. It is often used to
    substitute a default value for null values when data is retrieved for
    display, for example:

[Info taken from here](https://dba.stackexchange.com/questions/162903/postgresql-to-return-0-when-null#162907)

* How to use multiple `WITH` statements in one PostgreSQL query

[Info take from here]
(https://stackoverflow.com/questions/38136854/how-to-use-multiple-with-statements-in-one-postgresql-query)

The second `Common Table Expression` [CTE] is preceded by a comma not a WITH
statement so:

```
WITH cte1 AS (SELECT...)
, cte2 AS (SELECT...)
SELECT *
FROM
    cte1 c1
    INNER JOIN cte2 c2
    ON ........
```

You can also chain your results using WITH statement.

```
WITH tab1 as (Your SQL statement),
tab2 as ( SELECT ... FROM tab1 WHERE your filter),
tab3 as ( SELECT ... FROM tab2 WHERE your filter)
SELECT * FROM tab3;
```

## Wednesday 8/18/2021

* Setting up a new Droplet at OD Digital Ocean
		* Choose the 'Docker' image from the Marketplace image tab/list.
			* `docker -d` will already be running as a service and the docker command
			  line tool is included in the PATH, so it’s ready to use.
			* Note: The default firewall for the Docker One-Click is UFW, which is a
			  front end to iptables. However, Docker modifies iptables directly to
			  set up communication to and from containers. This means that UFW won’t
			  give you a full picture of the firewall settings. You can override this
			  behavior in Docker by adding --iptables=false to the Docker daemon.

```

ufw allow OpenSSH
ufw enable
reboot now

apt-get update
apt-get install -y procps
apt-get install curl



```

### Digital Ocean Community Tutorials

*Links I want to read about DO Digital Ocean

[How To Remove Docker Images, Containers, and Volumes]
(https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)

[Docker containers combines software and related dependencies into a
standardized unit for software development that includes everything it needs to
run: code, runtime, system tools and libraries. This guarantees that your
application will always run the same and makes collaboration as simple as
sharing a container image.]
(https://marketplace.digitalocean.com/apps/docker)

[Docker on DigitalOcean Community - Docker Tutorials, Questions, and Resources][
(https://www.digitalocean.com/community/tags/docker?utm_source=digitalocean_marketplace_app_listing_page)

[Initial Server Setup with Ubuntu 20.04]
(https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)


[How To Install and Use Docker on Ubuntu 20.04]
(https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)



## Monday 8/16/2021

* SSL Server Test 
This free online service performs a deep analysis of the configuration of any
SSL web server on the public Internet. Please note that the information you
submit here is used only to provide you the service. We don't use the domain
names or the test results, and we never will.  [SSL Server
Test](https://www.ssllabs.com/ssltest/)

* Upgrading PostgreSQL on mac using brew:

```
==> postgresql
To migrate existing data from a previous major version of PostgreSQL run:
  brew postgresql-upgrade-database

This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /usr/local/var/postgres
For more details, read:
  https://www.postgresql.org/docs/13/app-initdb.html

To restart postgresql after an upgrade:
  brew services restart postgresql
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres

==> Summary
🍺  /usr/local/Cellar/postgresql/13.4: 3,230 files, 42.7MB
Removing: /usr/local/Cellar/postgresql/13.3... (3,225 files, 42.7MB)
Removing: /Users/stergios/Library/Caches/Homebrew/postgresql--13.3... (10.9MB)
```

## Tuesday 8/3/2021

* Force firefox to clear dns cache
  Go to this URL: about:networking#dns, then click the Clear DNS Cache button.


## Monday 8/2/2021

* Commands I used at Digital Ocean to debug the firewall situation:

```sh
# see if the DNS entry is correct
nslookup basingpoints.com

# test if we can connect to a port
nc -v basingpoints.com 80

# look for firewall rejections:
tail -f /var/log/syslog

# We thought docker might be interfering, but it was not.
service docker stop

service --status-all

# This was the key to fixing the problem.
sudo ufw reload
sudo ufw status
sudo ufw allow http
sudo ufw allow https

# Also, firefox was caching a redirect from basingpoints.com to marinopoulos.net

```

* If you need to add headers to responses is echo:

```go
func main() {
	e := echo.New()

	// this middleware will add these headers to every handler
	e.Use(func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c echo.Context) error {
			c.Response().Header().Add("Pragma", "no-cache")
			// ..
			// ..
			return next(c)
		}
	})

	e.GET("/", func(c echo.Context) error {
		// or in handler function
		c.Response().Header().Add("Pragma", "no-cache")
		return c.JSON(http.StatusOK, "{}")
	})

	// ... start server
}
```

## Tuesday 6/29/2021

* `JSONPlaceholder` - a fake REST API.
```
fetch("https://jsonplaceholder.typicode.com/users/1")

//

fetch("https://jsonplaceholder.typicode.com/users/1") //1
  .then((response) => response.json()) //2
  .then((user) => {
    console.log(user.address); //3
  });

// we can access the returned value of a Promise object in another .then() callback:

const address = fetch("https://jsonplaceholder.typicode.com/users/1")
  .then((response) => response.json())
  .then((user) => {
    return user.address;
  });

const printAddress = () => {
  address.then((a) => {
    console.log(a);
  });
};

printAddress();


//  OR using async / await syntax:

const address = fetch("https://jsonplaceholder.typicode.com/users/1")
  .then((response) => response.json())
  .then((user) => {
    return user.address;
  });

const printAddress = async () => {
  const a = await address;
  console.log(a);
};

printAddress();



```

## Thursday 6/17/21

PostgreSQL Plan Evaluator
http://tatiyants.com/pev/#/plans/plan_1623975860244

psql -qAt -f explain02.sql python > analyze02.json




## Tuesday 6/15/2021

* Controlling PostgreSQL on Ubuntu 20.04
Use systemctl command to manage postgresql service:

  * stop service:
`    systemctl stop postgresql`
  * start service:
`    systemctl start postgresql`
  * show status of service:
`    systemctl status postgresql`
  * disable service(not auto-start any more)
`    systemctl disable postgresql`
  * enable service postgresql(auto-start)
`    systemctl enable postgresql`


## Wednesday 6/9/2021

### Investigate Container Linking

Containers can be linked[^202106091] to another container’s ports directly using --link
remote_name:local_alias in the client’s docker run. This sets a number of
environment variables that can then be used to connect:
[^202106091]:[use-container-linking](https://docs.docker.com/samples/postgresql_service/#use-container-linking)

```sh
docker run --rm -t -i --link pg_test:pg eg_postgresql bash

postgres@7ef98b1b7243:/$ psql -h $PG_PORT_5432_TCP_ADDR -p $PG_PORT_5432_TCP_PORT -d docker -U docker --password
```

### Debugging Docker Containers

* Debugging a Docker Container that will not start
Start the container where `STDOUT/STDERR` are attached to the console
and hopefully error messages are printed to the console.

```sh
sudo docker start -a ecb10ceec32d
```

Here is the documentation on `docker start`:

```sh
sudo docker help start

Usage:	docker start [OPTIONS] CONTAINER [CONTAINER...]

Start one or more stopped containers

Options:
  -a, --attach                  Attach STDOUT/STDERR and forward signals
      --checkpoint string       Restore from this checkpoint
      --checkpoint-dir string   Use a custom checkpoint storage directory
      --detach-keys string      Override the key sequence for detaching a container
  -i, --interactive             Attach container's STDIN
```

## Tuesday 6/8/2021

* Set Title of iTerm2 Window/Tab

```sh
echo -e "\033];MY_NEW_TITLE\007"
```

* Edit PList file or Fix iTerm3 Plist file
  * I recently imported far too many color presets into iTerm (by accident)
  and it's painful to delete them one at a time through the UI. Is there a
  file somewhere that I can edit by hand to remove them en masse?

  * You can convert your plist file to xml and hand edit it. Kind of painful.

```sh
cd /tmp
cp ~/Library/Preferences/com.googlecode.iterm2.plist .
plutil -convert xml1 com.googlecode.iterm2.plist
vi com.googlecode.iterm2.plist
# quit iterm2
cp com.googlecode.iterm2.plist ~/Library/Preferences
# restart iterm2
```


  * The least painful method I've found is to use the Xcode Editor (free
download from the Mac App Store) to reset iTerm 2's color-schemes to
factory defaults as follows:


  - Quit iTerm
  - Open ~/Library/Preferences/com.googlecode.iterm2.plist with Xcode Editor
    (if it's not your default .plist editor, right click on the file in finder
    and choose "open with">"Xcode"
 - Delete the "Custom Color Presets" key
 - Re-import the color-schemes you want.

  * BEST ANSWER:  Using `brew` Install `PlistEdit Pro`

    `/Applications/PlistEdit Pro.app/`

## Friday 5/28/2021

* Upgrade all `brew` `casks`

```sh
brew upgrade --cask
```

The above will not update casks that do not have versioning information (version
:latest) or applications that have a built-in upgrade mechanism (auto_updates
true). To reinstall these casks (and consequently upgrade them if upgrades are
available), run the upgrade command with the `--greedy` flag like this:

```sh
brew upgrade --cask --greedy
```

## Tuesday 5/18/2021


### How to only extract PostgreSQL Stored Procedures
[Tech Source](https://stackoverflow.com/questions/13758003/how-to-take-backup-of-functions-only-in-postgres)

```bash
# Extract just the Schema from the DB
pg_dump -U stergios --format=c --schema-only -f python-schema-20210518.ddl python

# Create the list of functions (--list prints summarized TOC of the archive)
pg_restore --list python-schema-20210518.ddl | grep FUNCTION > function_list

# Create the list of VIEWs (--list prints summarized TOC of the archive)
pg_restore --list python-schema-20210518.ddl | grep VIEW > function_list
```

* Move the Stored Procedures to another Database
```bash
# For Stored Procedures
# You must delete manually first
# And finally restore them (--use-list specifies the list file created above):
# --use-list=FILENAME uses TOC from this file for selecting/ordering output
pg_restore -U stergios -d money -L function_list python-schema-20210518.ddl
pg_restore -U stergios -d nginx -L function_list python-schema-20210518.ddl
pg_restore -U stergios -d 3dprinting -L function_list python-schema-20210518.ddl

# For Views
# You must delte manually first
# And finally restore them (--use-list specifies the list file created above):
# --use-list=FILENAME uses TOC from this file for selecting/ordering output
pg_restore -U stergios -d money -L      view_list python-schema-20210518.ddl
pg_restore -U stergios -d nginx -L      view_list python-schema-20210518.ddl
pg_restore -U stergios -d 3dprinting -L view_list python-schema-20210518.ddl
```


### 3 Ways to export from PostgreSQL to CSV on the Client Side

```sql
\copy (Select * From foo) To '/tmp/test.csv' With CSV
```

```
>psql dbname
psql>\f ','
psql>\a
psql>\o '/tmp/output.csv'
psql>SELECT * FROM users;
psql>\q
```

```bash
psql -d dbname -t -A -F"," -c "SELECT * FROM users" > output.csv
```

### 1 Way to export from PostgreSQL to CSV on the Server Side

```sql
Copy (Select * From foo) To '/tmp/test.csv' With CSV DELIMITER ',' HEADER;

```

## Monday 5/17/2021

* Docker Cheat Sheet  

[Docker Command
Line](https://docs.docker.com/engine/reference/commandline/docker/)

```bash
docker ps                    # List every container
docker system df             # Show docker disk usage
docker system prune –volumes # Prune images, containers, networks & volumes
docker system info           # Display system-wide information
```

* Check the size of a docker image

```bash
docker image inspect <imgName> --format='{{.Size}}' | numfmt --to=iec-I
```

* Transfer a Docker Image onto a Different Computer

  * PART 1 - Extract & Compress the Docker Image

```sh
NOW=$(/bin/date "+%Y%m%d_%H%M%S")
DESTCOMPUTER=dostm
TARFILE="paiapps-${NOW}.tar"
BZFILE="paiapps-${NOW}.tar.bz2"
echo $TARFILE
sudo docker save paiapps > ${TARFILE}
ls -lh ${TARFILE}
echo "Compressing ${TARFILE}"
bzip2 --best ${TARFILE} 
ls -lh ${BZFILE}
```

  * PART 2 - Transfer the Docker Image to Different Computer

```sh
ls -lh ${BZFILE}
echo "TRANSFERING ${BZFILE} to  ${DESTCOMPUTER}"
rsync -av --progress "${BZFILE}" ${DESTCOMPUTER}:

```

  * PART 3 - ssh to Different Computer & Load Image

```sh
ssh ${DESTCOMPUTER}
bunzip –c "${OUTFILE}.tar.bz2" | sudo docker load
```



* Start & Stop Docker Service in Linux
```
systemctl start docker
systemctl stop docker
```

* Save Docker Image to Tar File
```bash
docker save -o image.tar <sha256_image_id>
```

* Load an image from a tar archive or STDIN
```bash
docker load --input image.tar
```

* Start Docker Container
```bash
docker start <container_name>
```

* Stop Docker Container
```bash
docker stop <container_name>
```

* Start Bash in Docker Container
```bash
docker exec -it <container> /bin/bash
```
* Exit Docker Interactive Terminal (Return to Host System)
```bash
ctrl-p ctrl-q
```

* Various
```bash
# Show Disk Usage
sudo docker system df

# Remove Unused Data
sudo docker system prune -volumes

# Show System Wide Info
sudo docker system info

# Print Huge JSOB Blob about container 
sudo docker inspect <container id>

# Print IP Address of container
sudo docker inspect -f \
  '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
  <container id>

# See all processes runing in a container.
docker top <container id>

# Method A to find the IP address
sudo docker inspect --format {{.State.Pid}} ecb10ceec32di

# Method B to find the IP address
sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 89446b83faac

# How to copy files FROM host TO Docker container?

docker cp foo.txt containerID:/foo.txt

# How to copy files TO host FROM Docker container?

docker cp containerID:/foo.txt foo.txt

# How to copy files FROM IMAGE to host?
# To copy a file from an image, create a temporary container, copy the file
# from it and then delete it:

id=$(docker create image-name)
docker cp $id:path - > local-tar-file
docker rm -v $id

```

### Add an entry to /etc/hosts when starting a new docker container.
Docker has a built in solution that will allow you to have your docker host
automatically insert lines into the hosts file of a docker container when the
image is initially starting up. All you need to do is include the following
flag within your docker run command. This will allow you to add a host entry to
a docker container.

```sh
--add-host yourdomain.com:127.0.0.1
```

So basically it looks like this:

```sh
docker run -d \
--name wordpress \
-p 8080:80 \
--add-host yourdomain.com:127.0.0.1 \
wordpress
```

### Install VIM inside a docker container

```sh
docker exec -it <container> /bin/bash
apt-get update
apt-get -y install vim
```

### Install `ps` inside a docker container

```sh
docker exec -it <container> /bin/bash
apt-get update
apt-get install -y procps
```

## Friday 5/7/2021

###  How to [Calculate Cumulative Sum-Running Total in PostgreSQL](https://popsql.com/learn-sql/postgresql/how-to-calculate-cumulative-sum-running-total-in-postgresql)


Using a PostgreSQL Common Table Expression (CTE) and a window function we can
compute a cumulative sum/running total of any column.

```sql
WITH data AS (
  SELECT _faqid, _faqcount, _faqtitle FROM clustermonthfaqcount(2, '2015-04', 14)
)
SELECT _faqid, _faqcount, _faqtitle, sum(_faqcount) OVER (ORDER BY _faqcount DESC)
FROM data ;
```

```sql
WITH data AS (
SELECT MIN(cqt.faqid) AS thefaqid, TO_CHAR(p.creationdate, 'YYYY-MM') AS yearmonth,
  COUNT(cqt.qtextid) AS thecount, MIN(f.faqtext) AS thetitle
  FROM cluster_qtexts cqt
  JOIN faqs f
    ON cqt.faqid = f.faqid AND cqt.clusterrunid = f.clusterrunid and f.autoclusterid = cqt.clusterid
  JOIN posts p
    ON cqt.qtextid = p.id
  WHERE cqt.clusterrunid = 2
    AND cqt.clusterid=4
    AND cqt.faqid = 304
    AND p.creationdate BETWEEN '2014-04-01' and '2015-04-30'
  GROUP BY to_char(p.creationdate, 'YYYY-MM')
  ORDER BY to_char(p.creationdate, 'YYYY-MM')
)
SELECT thefaqid, yearmonth, thecount, thetitle,
        sum(thecount) OVER (ORDER BY yearmonth rows between unbounded preceding and current row) AS total
FROM data
ORDER BY yearmonth ;
```



## Monday 5/3/2021 - Things to Invetigate

- [ ] Javascript Futures/promises
    They could be useful for chaining AJAX success callbacks calling other AJAX functions ad infinitum.

- [ ] ReLearn Raspberry Pi Motor Hat Board.
    Keep my progress detailed in [Raspberry Pi Stepper Motor Notes](../stepper/Notes.md)

* Decimal Number Formatting in Javascript

```javascript
let formatters = {
    default: new Intl.NumberFormat(),
    currency: new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 0, maximumFractionDigits: 0 }),
    whole: new Intl.NumberFormat('en-US', { style: 'decimal', minimumFractionDigits: 0, maximumFractionDigits: 0 }),
    oneDecimal: new Intl.NumberFormat('en-US', { style: 'decimal', minimumFractionDigits: 1, maximumFractionDigits: 1 }),
    twoDecimal: new Intl.NumberFormat('en-US', { style: 'decimal', minimumFractionDigits: 2, maximumFractionDigits: 2 })
};

formatters.twoDecimal.format(1234.5678);  // result: "1,234.57"
formatters.currency.format(28761232.291); // result: "$28,761,232"
```
### Kill a process in golang:

`.Output()` runs a command, waits for it to finish, and collects its output.

```sh
// `echo "sudo_password" | sudo -S [command]`
// is used in order to run the command with `sudo`

_, err := exec.Command("sh", "-c", "echo '"+ sudopassword +"' | sudo -S pkill -SIGINT my_app_name").Output()

if err != nil {
    // ...
} else {
    // ...
}
```

Same as above but without `sudo`

```bash
// `pkill -SIGINT -x -f "/usr/local/bin/postgrest PConfig_python"`

_, err := exec.Command("/usr/bin/pkill -SIGTERM -x -f '/usr/local/bin/postgrest PConfig_python'").Output()

if err != nil {
    // ...
} else {
    // ...
}
```

## Friday 3/19/2021

### Important `brew` Gnu packages

Make sure to install these utilities on any new mac.  A good resource on mapping
Gnu names to brew names is
[here](https://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities)

```sh
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep diffutils
```

## Thursday 3/18/2021

### PostgreSQL Docker Official Images

[List of Postgresql Images at Docker Hub](https://hub.docker.com/_/postgres)

### PostgreSQL Docker Info

There is a lot of information on `DockerHub` covering the [Automated Build of the PostgreSQL Docker Image](
https://registry.hub.docker.com/r/sameersbn/postgresql)

### PostgreSQL Trusting Local Connections

By default connections to the PostgreSQL server need to authenticated using a
password. If desired you can trust connections from the local network using the
`PG_TRUST_LOCALNET` variable.

```bash
docker run --name postgresql -itd --restart always \
  --env 'PG_TRUST_LOCALNET=true' \
  sameersbn/postgresql:12-20200524
```

__Note:__ *The local network here is the network to which the container is attached. This has
different meanings depending on the --net parameter specified while starting the
container. In the default configuration, this parameter would trust connections
from other containers on the docker0 bridge.*

 ## Tuesday 3/2/2021

 #### Dictionary-like cursor for psycopg2

 Information taken from [Miscellaneous goodies for Psycopg2](https://www.psycopg.org/docs/extras.html)

 ```python
 >>> dict_cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
 >>> dict_cur.execute("INSERT INTO test (num, data) VALUES(%s, %s)",
 ...                  (100, "abc'def"))
 >>> dict_cur.execute("SELECT * FROM test")
 >>> rec = dict_cur.fetchone()
 >>> rec['id']
 1
 >>> rec['num']
 100
 >>> rec['data']
 "abc'def"
 ```

## Saturday 2/27/2021

### Learning the Finance Tech Stack in Python

* `matplotlib/mpl-finance` is deprecated in favor of the current
[`matplotlib/mplfinance`](https://github.com/matplotlib/mplfinance) .


* [Tips on Working with Datetime Index in
pandas](http://sergilehkyi.com/tips-on-working-with-datetime-index-in-pandas/)

* How to create Candlestick charts within Matplotlib.
https://pythonprogramming.net/candlestick-ohlc-graph-matplotlib-tutorial/

* Learn know more about matplotlib & subplot2grid at [subplots with Matplotlib
tutorial](https://pythonprogramming.net/subplot2grid-add_subplot-matplotlib-tutorial/).

[`pandas_datareader`](https://github.com/pydata/pandas-datareader) is a python
library for retireving remote data.  Pandas data reader was removed from
pandas. It is now a separate repo and a separate install.  Up to date remote
data access for pandas, works for multiple versions of pandas.

Starting in 0.19.0, pandas no longer supports pandas.io.data or pandas.io.wb, so you must replace your imports from pandas.io with those from pandas_datareader:

```bash
pip3 install pandas-datareader


pip3 install --upgrade mplfinance # not sure I am using this one yet.
    # https://github.com/matplotlib/mplfinance  # Looks really good.
```

```python
from pandas_datareader import data, wb
import matplotlib.ticker as mticker
import mplfinance as mpf

```

### Next Steps

1. Read [Adding Your Own Technical Studies to Plots](
https://github.com/matplotlib/mplfinance/blob/master/examples/addplot.ipynb)

2. Read [mplfinance subplots using the "Panels
Method"](https://github.com/matplotlib/mplfinance/blob/master/examples/panels.ipynb)

3. Read more examples of using mplfinance in the [examples directory.](https://github.com/matplotlib/mplfinance)



## Friday 2/26/2021

### TA-Lib

```bash
% brew install ta-lib  # Let Brew install the compiled libs
==> Downloading https://homebrew.bintray.com/bottles/ta-lib-0.4.0.big_sur.bottle.1.tar.gz
==> Pouring ta-lib-0.4.0.big_sur.bottle.1.tar.gz
🍺  /usr/local/Cellar/ta-lib/0.4.0: 15 files, 2.4MB

% pip3 install TA-Lib  # now install the python3 package for TA-Lib
Collecting TA-Lib
  Downloading TA-Lib-0.4.19.tar.gz (267 kB)
     |████████████████████████████████| 267 kB 2.4 MB/s
Requirement already satisfied: numpy in ./.asdf/installs/python/3.9.1/lib/python3.9/site-packages (from TA-Lib) (1.20.1)
Using legacy 'setup.py install' for TA-Lib, since package 'wheel' is not installed.
Installing collected packages: TA-Lib
    Running setup.py install for TA-Lib ... done
Successfully installed TA-Lib-0.4.19

% pip3 install TA-Lib  # Install again to see where it was installed at
Requirement already satisfied: TA-Lib in ./.asdf/installs/python/3.9.1/lib/python3.9/site-packages (0.4.19)
Requirement already satisfied: numpy in ./.asdf/installs/python/3.9.1/lib/python3.9/site-packages (from TA-Lib) (1.20.1)
```


### Sending Email in go

[Go Simple Mail](https://github.com/xhit/go-simple-mail) is a simple and
efficient package to send emails. It is well tested and documented.

###  What is [Viper](https://github.com/spf13/viper)?

Viper is a complete configuration solution for Go applications including
12-Factor apps. It is designed to work within an application, and can handle all
types of configuration needs and formats. It supports:

- setting defaults
- reading from JSON, TOML, YAML, HCL, envfile and Java properties config files
- live watching and re-reading of config files (optional)
- reading from environment variables
- reading from remote config systems (etcd or Consul), and watching changes
- reading from command line flags
- reading from buffer
- setting explicit values

Viper can be thought of as a registry for all of your applications configuration
needs.

## Monday 2/22/2021

* I had a few python3 packages installed using `brew`.  Occasionally this causes
  headaches. The latest example is as follows:

```bash
% ./scripts/startProgram.sh --summarize
    ValueError: numpy.ndarray size changed, may indicate binary incompatibility. Expected 88 from C header, got 80 from PyObject
```

So I removed the packages installed by `brew`, and installed them
using `pip3`.

```bash
% brew rm scipy numpy
% pip3 uninstall scipy numpy  # In case there were ancient versions lingering.
% pip3 install numpy scipy
```

## Sunday 2/21/2021

I started using linters on `server.go`.  They are
[staticcheck](https://staticcheck.io/), and
[golangci-lint](https://golangci-lint.run/), which is a Go linters aggregator.

## Friday 2/19/2021

### Steps to Create a Go Module

I'm using this resource [Using Go Modules](https://blog.golang.org/using-go-modules) in the following guide.

1. Make sure there is a package name at the top of the go file:

```bash
% cd ~src/go/pg/hello
% pwd
    /Users/stergios/src/go/pg/hello
% head -n 1 ../mydb/mydb.go
    package mydb
```

2. Switch to the `mydb` directory where my DB access library resides and make it
   the root of a module by using `go mod init`.

```bash
% cd ../mydb
% code mydb_test.go
```

Let's add a test for the code before we actually create the module.

```go
package mydb

import "testing"

func TestMyDB(t *testing.T) {
    want := "Sure, that worked."
    if got := DoFakeTest(); got != want {
        t.Errorf("DoFakeTest() = %q, want %q", got, want)
    }
}
```

3. Ok, now let's initialize the module:

```bash
% go mod init marinopoulos.net/mydb
    go: creating new go.mod: module marinopoulos.net/mydb
% cat go.mod
    module marinopoulos.net/mydb

    go 1.15
```

4. Run the test

```bash
% go test
go: finding module for package github.com/lib/pq
go: found github.com/lib/pq in github.com/lib/pq v1.9.0
PASS
ok  	marinopoulos.net/mydb	0.202s

```

5. Looking at the above output The `go` command resolves imports by using the
   specific dependency module versions listed in `go.mod`. When it encounters an
   `import` of a package not provided by any module in `go.mod`, the `go`
   command automatically looks up the module containing that package and adds it
   to `go.mod`, using the latest version.   In our example, `go test` resolved the new
   `import "github.com/lib/pq"` to the module `github.com/lib/pq v1.9.0` .

6. Let's see what happened to `go.mod` and look for dependencies that the `go` command
   automatically added.

```bash
cat go.mod
module marinopoulos.net/mydb

go 1.15

require github.com/lib/pq v1.9.0
```

7. A second `go test` command will not repeat this work, since the `go.mod` is now
   up-to-date and the downloaded modules are cached locally (in
   `$GOPATH/pkg/mod`)

```bash
% go test
    PASS
    ok  	marinopoulos.net/mydb	0.329s
```

8. As an aside and for future use, you can use the command `go list -m all`
   lists the current module and all its dependencies:

```bash
% go list -m all
    marinopoulos.net/mydb
    github.com/lib/pq v1.9.0
```

9. As another point of reference, let's list the available tagged versions of
   the `github.com/lib/pq` module:

```bash
go list -m -versions github.com/lib/pq
    github.com/lib/pq v1.0.0 v1.1.0 v1.1.1 v1.2.0 v1.3.0 v1.4.0 v1.5.0 v1.5.1 v1.5.2 v1.6.0 v1.7.0 v1.7.1 v1.8.0 v1.9.0
```

### Steps to Use a Go Module

1. Let's use our `mydb` module from our main program:

```bash
% cd ~/src/go/pg/hello
% cat hello.go
    package main

    import (
      "fmt"

      "marinopoulos.net/mydb"
    )

    func main() {
        // Get a greeting message and print it.
        mydb.DoEverything()
        fmt.Println("All Done in Hello.go")
    }
```

2. Initialize our module:

```bash
% go mod init hello
    go: creating new go.mod: module hello
% cat go.mod
    module hello

    go 1.15
```

+ Changes for go 1.16

```bash
% go mod init server.go
    go: creating new go.mod: module server.go
    go: to add module requirements and sums:
      go mod tidy

# Ok, let's follow the advice of using `go mod tidy`

% go mod tidy
    go: finding module for package github.com/lib/pq
    go: finding module for package github.com/labstack/echo
    go: finding module for package github.com/gorilla/websocket
    go: finding module for package github.com/davecgh/go-spew/spew
    go: found github.com/davecgh/go-spew/spew in github.com/davecgh/go-spew v1.1.1
    go: found github.com/gorilla/websocket in github.com/gorilla/websocket v1.4.2
    go: found github.com/labstack/echo in github.com/labstack/echo v3.3.10+incompatible
    go: found github.com/lib/pq in github.com/lib/pq v1.9.0
    go: finding module for package github.com/stretchr/testify/assert
    go: finding module for package github.com/labstack/gommon/color
    go: finding module for package golang.org/x/crypto/acme/autocert
    go: finding module for package github.com/labstack/gommon/log
    go: downloading github.com/stretchr/testify v1.7.0
    go: found github.com/labstack/gommon/color in github.com/labstack/gommon v0.3.0
    go: found github.com/labstack/gommon/log in github.com/labstack/gommon v0.3.0
    go: found golang.org/x/crypto/acme/autocert in golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
    go: found github.com/stretchr/testify/assert in github.com/stretchr/testify v1.7.0
    go: downloading gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c
```


3. Let's try to build our program:

```bash
% go build hello.go
    go: finding module for package marinopoulos.net/mydb
    hello.go:6:2: cannot find module providing package marinopoulos.net/mydb: unrecognized import path "marinopoulos.net/mydb": https fetch: Get "https://marinopoulos.net/mydb?go-get=1": EOF
```

Opps, we got an error!

4. Building failed because it could not locate our module since our module is a
   local one.  Let's fix that. We need to point to the local version of our
   `mydb` dependency rather than the one over the web.  To do that use `replace`
   in `go.mod` to point to your local module.

```bash
% cat go.mod
    module hello

    go 1.15

    replace marinopoulos.net/mydb => ../mydb
```

And now when you compile this module, it will use your local code rather than
the other dependency.

5. Let's try building again:

```bash
% go build hello.go
    go: found marinopoulos.net/mydb in marinopoulos.net/mydb v0.0.0-00010101000000-000000000000
```

Great!  That worked.  What does the `go.mod` file look like now:

```bash
cat go.mod
    module hello

    go 1.15

    replace marinopoulos.net/mydb => ../mydb

    require marinopoulos.net/mydb v0.0.0-00010101000000-000000000000 // indirect
```

6. And that's it for now.  We are ready to `go!` with our new `mydb` module.

You do need to make sure that the `replace` code you’re pointing to also has a
`go.mod` file.  Which is why I went to the trouble of covering [Steps to Create
a Go Module](#steps-to-create-a-go-module) above.

## Saturday 2/13/2021

### ITerm2 Tricks

* When SSHed into a server and you want another terminal window in to that server, try

>% tmux -CC

A new native window pops up on the desktop that is tunneled over SSH.

## Friday 2/12/2021

* Install `python` via `asdf` on `lastX86`

Switch all python development over to the use of the `asdf` installed version.  `brew` keeps
blowing away versions without asking.  `asdf` will never do that.

### Use [Python 3.9.1](https://www.python.org/downloads/release/python-391/)

Release Date: Dec. 7, 2020

This is the first maintenance release of Python 3.9

Python 3.9.1 is the newest major release of the Python programming language, and
it contains many new features and optimizations. We've made 282 changes since
3.9.0 which is a significant amount. To compare, 3.8.1 only saw 192 commits
since 3.8.0.


```bash

% asdf plugin-add python

% asdf list-all python  # WOW! There are a lot of python versions.  457 to be exact.

% asdf list-all python | wc
    457     457    5989

% asdf install python 3.9.1

    python-build 3.9.1 /Users/stergios/.asdf/installs/python/3.9.1
    python-build: use openssl@1.1 from homebrew
    python-build: use readline from homebrew
    Downloading Python-3.9.1.tar.xz...
    -> https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tar.xz
    Installing Python-3.9.1...
    python-build: use readline from homebrew
    python-build: use zlib from xcode sdk
    Installed Python-3.9.1 to /Users/stergios/.asdf/installs/python/3.9.1

% rehash

% which python
    /Users/stergios/.asdf/shims/python


# Using `asdf global` creates a file under your HOME directory called .tool-versions

% asdf global python 3.9.1 # This sets python 3.8.4 as our default python version

# But I did it the hard way:

% echo "python 3.9.1" >>  /Users/stergios/.tool-versions

% cat .tool-versions
    perl 5.32.1
    python 3.9.1


# Install necessary python modules.

pip3 install -r ~/src/faq.git/src/python/requirements_noversions.txt

# psycopg2 had compilation errors.  It could not find the library -lssl

# So I searched what brew had installed

% brew search ssl
    ==> Formulae
    cfssl                libressl             osslsigncode         sslh                 sslmate              sslsplit             testssl
    glib-openssl         openssl@1.1 ✔        ssldump              ssllabs-scan         sslscan              sslyze               wolfssl

# Then I got specific information about openssl@1.1 that I had installed already

% brew info openssl@1.1

    openssl@1.1 is keg-only, which means it was not symlinked into /usr/local,
    because macOS provides LibreSSL.

    If you need to have openssl@1.1 first in your PATH, run:
      echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.zshrc

    For compilers to find openssl@1.1 you may need to set:
      export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
      export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"


# Ahah!  # openssl@1.1 is KEG-ONLY!  So follow it's advice:

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# And try again:

pip3 install -r ~/src/faq.git/src/python/requirements_noversions.txt

# Yay me!

```

### Setting up `PostgreSQL` on `lastX86`

* Create `PostgreSQL` new user

```sql
-- Creating PostgreSQL user.
CREATE USER stergios WITH ENCRYPTED PASSWORD '__STRONG_PASSWORD_HERE__';

-- Change PostgreSQL password
ALTER ROLE stergios  WITH ENCRYPTED PASSWORD '__STRONG_PASSWORD_HERE__';

-- Create one database so that user can login to the database. 
CREATE DATABASE money ;

-- Grant database access to the new user.
GRANT ALL PRIVILEGES ON DATABASE money to stergios;
```

### Edit `PostgreSQL` configuration file `postgresql.conf`

* We want to allow all computers to access this database server.  In
`/usr/local/var/postgres/postgresql.conf` add the line **62** in the listing
below under the `Connections Settings` section. 

```bash
53 #------------------------------------------------------------ 
54 # CONNECTIONS AND AUTHENTICATION 
55 #------------------------------------------------------------ \
56
57 # - Connection Settings -

62 listen_addresses = '*'    # ADD THIS LINE.
```

### Edit `PostgreSQL` configuration file `pg_hba.conf`

We want to require passwords for all databases connections, edit
`/usr/local/var/postgres/pg_hba.conf` as follows.


```bash
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     md5
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
host    all             all             192.168.86.0/24         md5
# IPv6 local connections:
host    all             all             ::1/128                 md5

```

### Restart `PostgreSQL`

After most of the above alterations you need to restart `PostgreSQL` for the
changes to take affect.

```bash
brew services restart postgresql
```

## Monday 2/8/2021

### CSS Selector [Combinators](https://www.w3.org/TR/selectors/#combinators)

* What does the `>` (greater-than sign) CSS selector mean?

`White Space` is the [Descendant
combinator](https://www.w3.org/TR/selectors/#descendant-combinator) which
separates two compound selectors. A selector of the form `A B` represents an
`element B` that is an arbitrary descendant of some ancestor `element A`.

    h1 em

`>` is the [child combinator](https://www.w3.org/TR/selectors/#child-combinators).

The following selector represents a `p` element that is a immediate child of `div`: 

    div > p

That means the selector `div > p.some_class` only selects paragraphs of
`.some_class` that are nested directly inside a `div`, and not any paragraphs
that are nested further within.

`+` is the [Next-sibling combinator](https://www.w3.org/TR/selectors/#adjacent-sibling-combinators).

The elements represented by the two sequences share the same parent in the
document tree and the element represented by the first sequence **immediately
precedes** the element represented by the second one. Non-element nodes (e.g. text
between elements) are ignored when considering the adjacency of elements.

    math + p

A `p` element immediately following a `math` element

`~` is the [Subsequent-sibling combinator](https://www.w3.org/TR/selectors/#general-sibling-combinators).

The elements represented by the two compound selectors share the same parent in
the document tree and the element represented by the first compound selector
precedes (**not necessarily immediately**) the element represented by the second
one.

    h1 ~ pre

Represents a pre element following an h1. It is a correct and valid, but partial, description of:

```html
<h1>Definition of the function a</h1>
<p>Function a(x) has to be applied to all figures in the table.</p>
<pre>function a(x) = 12x/13.5</pre>
```


## Friday 2/5/2021

* VSCode installed `go` tooling

```bash
Tools environment: GOPATH=/Users/stergios/go
Installing 9 tools at /Users/stergios/go/bin in module mode.
  gopkgs
  go-outline
  gotests
  gomodifytags
  impl
  goplay
  dlv
  golint
  gopls

Installing github.com/uudashr/gopkgs/v2/cmd/gopkgs (/Users/stergios/go/bin/gopkgs) SUCCEEDED
Installing github.com/ramya-rao-a/go-outline (/Users/stergios/go/bin/go-outline) SUCCEEDED
Installing github.com/cweill/gotests/... (/Users/stergios/go/bin/gotests) SUCCEEDED
Installing github.com/fatih/gomodifytags (/Users/stergios/go/bin/gomodifytags) SUCCEEDED
Installing github.com/josharian/impl (/Users/stergios/go/bin/impl) SUCCEEDED
Installing github.com/haya14busa/goplay/cmd/goplay (/Users/stergios/go/bin/goplay) SUCCEEDED
Installing github.com/go-delve/delve/cmd/dlv (/Users/stergios/go/bin/dlv) SUCCEEDED
Installing golang.org/x/lint/golint (/Users/stergios/go/bin/golint) SUCCEEDED
Installing golang.org/x/tools/gopls (/Users/stergios/go/bin/gopls) SUCCEEDED

All tools successfully installed. You are ready to Go :).
```

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
2. Fold Recursively (⌘K ⌘[) folds the innermost uncollapsed region at the cursor and all regions inside that region.
3. Unfold Recursively (⌘K ⌘]) unfolds the region at the cursor and all regions inside that region.
4. Fold (⌥⌘[) folds the innermost uncollapsed region at the cursor.
5. Unfold (⌥⌘]) unfolds the collapsed region at the cursor.
6. Fold All (⌘K ⌘0) folds all regions in the editor.
7. Unfold All (⌘K ⌘J) unfolds all regions in the editor.
8. Fold Level X (⌘K ⌘2 for level 2) folds all regions of level X, except the region at the current cursor position.
9. Fold All Block Comments (⌘K ⌘/) folds all regions that start with a block comment token.

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

​```sql
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
