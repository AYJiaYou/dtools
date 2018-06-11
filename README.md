# dtools
Miscellaneous tools for a programmer's  daily use.  

# Note
All of these tools are come from daily work circumstances which I thought would likely to be encountered in the future. So I keep them down with the DRY rule in mind. They merely fulfill my needs at the specific time and may not mature and suitable for common use cases. Some of them are not even complete or have bugs.  

I'll revise them whenever I need to use them again or have new thoughts on them or bugs found. Any RPs are highly welcomed if you like to share your insights and experiences. :) 

# Install
1. Clone this repo.
2. Open a console window and cd to this projects's root folder.
3. Execute setup.sh script.

# Platform
Most of the tools are tested within **bash** & **zsh** on **openSUSE Leap 42.3** linux distro.

# Tool List
| Tool | Summary | Usage |
|------|---------|-------|
| dt-docker-rmi-none | Remove all the docker images with 'none' tag and 'none' repository. ||
| dt-git-migrate | Migrate a git repo from one server to another. | 1 cd to the git repo root <br> 2 run `dt-git-migrate` |
| dt-mysql-dump | Fully dump specific mysql database to <YYYY-MM-DD_HH:mm_full.sql>, auto_increment number eliminated. | 1 cd to some folder <br> 2 `dt-mysql-dump` |
| dt-pdate | Print out current date at 'YYYY-MM-DD HH:MM:SS' format. ||
| dt-proxy-off | Turn off the http&https proxy of the console. ||
| dt-proxy-on | Turn on the http&https proxy to the one set before calling dt-proxy-off or nothing happens if it already set. ||

# License
[Apache Licence, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).
