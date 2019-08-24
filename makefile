build : vim.zip rcfiles.zip
	echo 'Done'

vim.zip : vim
	zip -r vim vim

rcfiles.zip : aliases bash_logout bashrc \
				gitconfig vimrc  profile zshrc
	zip rcfiles aliases bash_logout bashrc\
		gitconfig vimrc profile zshrc

clean : 
	rm vim.zip
	rm rcfiles.zip
