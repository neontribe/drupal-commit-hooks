#!/bin/sh

composer global require squizlabs/php_codesniffer
composer global require drupal/coder
composer global require graphp/graphviz

export PATH=$PATH:$HOME/.composer/vendor/bin/
phpcs --config-set installed_paths $HOME/.composer/vendor/drupal/coder/coder_sniffer

path=`php -r "echo realpath(getcwd());"`
ln -sf $path/contrib/pre-commit $path/.git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

which doxygen > /dev/null

if [ "$?" != 0 ]; then
    echo
    echo "Skipping document generation, doxygen not installed"
    echo "  sudo apt-get install doxygen"
else
    echo doxygen contrib/doxygen.conf
fi


