. ./installers/source-to-set-repo-dir-var.sh

APPLI_DIR=~/.local/share/applications
mkdir -p $APPLI_DIR
ln -sf $REPO_DIR/helpers/emacs.desktop $APPLI_DIR/
