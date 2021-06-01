# A rule - this rule will only run if file0.txt doesn't exist.
file0.txt:
	echo "foo" > file0.txt
	# Even comments in these 'recipe' sections get passed to the shell.
	# Try `make file0.txt` or simply `make` - first rule is the default.

# This rule will only run if file0.txt is newer than file1.txt.
file1.txt: file0.txt
	cat file0.txt > file1.txt
	# use the same quoting rules as in the shell.
	@cat file0.txt >> file1.txt
	# @ stops the command from being echoed to stdout.
	-@echo 'hello'
	# - means that make will keep going in the case of an error.
	# Try `make file1.txt` on the commandline.

# A rule can have multiple targets and multiple prerequisites
file2.txt file3.txt: file0.txt file1.txt
	touch file2.txt
	touch file3.txt

# A phony target. Any target that isn't a file.
# It will never be up to date so make will always try to run it.
clean:
	rm file*.txt