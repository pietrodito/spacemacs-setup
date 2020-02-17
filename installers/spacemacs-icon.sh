source ./installers/source-to-set-repo-dir-var.sh

APPLI_DIR=~/.local/share/applications
mkdir --parents $APPLI_DIR
ln --symbolic --force $REPO_DIR/helpers/emacs.desktop $APPLI_DIR/
