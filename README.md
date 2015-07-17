##Going under some big changes soon, these instructions are currently not working.

#dotfiles

For setting up a new dev box

You must give setup.sh and removeBackups.sh execute privileges in order to run them.

```shell
chmod a+x setup.sh removeBackups.sh
```

Inspiration taken from [zaqthefreshman/dotfiles](https://github.com/zaqthefreshman/dotfiles)

###TODO

- Add local things to sym linking script
- Flesh out the idea of having ~/.local/before and ~/.local/after and source these files at the start and end of each dotfile
	- For paths so that machines can have locally different paths
	- Make a good default path for each one, but these files will be copied
- Get my branches back in sync
