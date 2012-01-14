Wiki Blossom
============

A cute little rack-based wiki

Features
--------
* **Simple**: Pages are stored in flat-files on the local file system. 
* **Loves TextMate**: Each page has a link at the bottom that says
  "Edit with TextMate". When you click it, it opens the file in TextMate, so you
  can modify it and reload the page after you're done.

Installation
------------

1. open etc/config.yml and modify the `wiki_dir` line to point somewhere that
   contains some textile (.textile) or markdown (.md) files.
2. `$ bundle install`
3. `$ thin start -R wiki.ru`
4. (optional) to start your wiki on each reboot, customize and add the content of
   etc/wiki_blossom.cron to you crontab.

License
-------

Wiki Blossom is released under the MIT License.

