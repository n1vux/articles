# Oopsie Fixed

## Careful with rsync direction or else

In the rush before Thanksgiving, I `rsync`'d my desktop to laptop backwards. Which deleted all files on my desktop's personal directory that were new since the last sync. (using `rsync -d` delete, so that renames aren't duplicated; but finger error, i was pushing not pulling, using wrong alias command, oops argh).

I did manage to grab the whole scrollback in laptop terminal listing all the deleted files, good.

(Looked to have a lot of things that were previously merged with hardlink(8) to save space! Unexpected as the push `rsync` did have `-H` to preserve hardlinks?.)

Desktop `/home` is formatted **`ext4`**, a journalling filesystem, so  this should be easy, right ?  It's not quite as sparkly-shiny as btrfs but good enough?

## Googling found two alternatves for undeleting ext4 using journal

A quick Google from the laptop found two choices 

### ext4magic

* [Recovering deleted files in Ubuntu with ext4 filesystem](https://gist.github.com/ebautistabar/cca12863e6335d08a019f015f53fac4a)
   - recommends `ext4magic`
   - first step ASAP: save copy of device journal   
     ```sudo debugfs -R "dump <8> /opt/sda1.journal" /dev/sda1```
   - only then do apt install if needed
   - options control automation, doesn't work with explicit list

### extundelete

* [undelete files on ext4 (ask ubuntu)](https://askubuntu.com/questions/217606/undelete-files-on-ext4)
   - recommends `extundelete` 
   - has multiple options, including ability to use a list of files to un-delete
   - but lacks a `--dry-run` mode?

### compare/contrast

* both :
  - require rebooting to recovery mode menu, `start network`, `root shell`, `umount /home` (or whatever) to work
  - require a working directory on another device e.g. `/opt` (not `/tmp` as it is likely cleaned on boot)

## My solution

* save the device journal to `/opt` as instructed (by `ext4magic` page)
* and `mkdir /opt/me` and transfer the list of missing files captured on laptop there too
* Install: `sudo apt-get install ext4magic extundelete`
* Reboot to singleuser recovery ("advanced options", `umount /home` to dismount (or whereever was hurt!)
* Need a place to recover to, off the device being recovered - `mkdir /opt/me/recovery` 
* since I had a list of files, I tried to edit the list to match the format needed for `extundelete --restore-files listfile` but either it needed different --flags than I guessed or my choice of path prefix to match was wrong; it didn't work for me. I think I tried the `--restore-directory` version in the webpage also. Nope.
* then I tried `ext4magic` with the journal cache as recommended, first in list mode (like a dry run) and then do-it; worked like a charm. (Example has hardcoded date time_t in second command, but repeating the `$(date... +%s)` by history editing -l to -r etc is fine.)
* Ownership  : `chown -r me:me ./recovery` (there's a stronger form `ext4magic -R` instead of `-r` that might have recovered this, but i didn't feel like trying the stronger form ,  on without understanding the rest of implications.)
* Put them back in the right placeP `cd ./recovery; cp -ar * /home/me/there/.` 

