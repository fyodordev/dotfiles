#!/bin/bash

######################################################################
# #
# lnk2symlink by jesus.guerrero.botella at gmail dot com, #
# search for windows .lnk files on a given directory, and creates #
# symlinks according to the info contained on those files #
# #
# This script is provided without any kind of implicit or explicit #
# guarantee, and is licensed under the GNU General Public License v3 #
# or later if available. More about licenses on the following URL: #
# #
# http://www.gnu.org/licenses/licenses.html #
# #
# Source: https://systemsolver.com/StatlerBlog/index.php/2016/10/09/linux-convert-windows-links-to-linux-symbolic-links/
######################################################################

VERSION=20101220
PROGRAM_NAME=$(basename $0)

die() {
case $1 in
non_linkable_fs)
echo “The target filesystem doesn’t support symlinks.”
exit 11
;;
ln_error)
echo “Undefined error while symlinking.”
exit 10
;;
number_of_args)
echo
echo “[E] Incorrect number of arguments.”
echo “Usage: $0 origin_dir destination_dir dos_drive_basedir”
echo
echo ” origin_directory is the directory containing the .lnk”
echo ” files. It will be recursed.”
echo
echo ” destination_directory is the directory where you want”
echo ” the symlinks to be created.”
echo
echo ” dos_drive_basedir is the linux directory that will be”
echo ” used in place of \”C:\\\” (or whatever drive) when looking”
echo ” for the link destination.”
echo
echo “Typical usage case:”
echo ” “$(basename $0)” ~/Desktop/ ~/bin/ ~/.wine/drive_c/”
echo
exit 12
;;
could_not_create_dest)
echo “Couldn’t create destination directory.”
exit 13
;;
orig_not_found)
echo “Origin directory not found or not readable.”
exit 14
;;
could_not_create_symlink)
echo “Couldn’t create symlink.”
exit 15
;;
*)
echo “Undefined error.”
exit 20
;;
esac
}

case $# in
3)
ORIG=”$1″
DEST=”$2″
DOS_DRIVE=”$3″
;;
*)
die number_of_args
;;
esac

# Test for the existence of the required directories
[ ! -d “$DEST” ] && mkdir “$DEST”
[ ! -d “$DEST” ] && die could_not_create_dest
[ ! -d “$ORIG” ] && die orig_not_found

# Test the symlinking tool, if it fails then probably
# your FS doesn’t support soft links.
TESTLN=”$DEST/test-$RANDOM$RANDOM$RANDOM$RANDOM”
ln -s “$HOME” “$TESTLN” > /dev/null 2>&1 || die non_linkable_fs
rm -f “$TESTLN”

echo
echo “Where to look for .lnk files:”
echo ” \”$ORIG\””
echo “Where to look put symlinks:”
echo ” \”$DEST\””
echo “The DOS base drive is:”
echo ” \”$DOS_DRIVE\””
echo
echo “Finding files, this may take a while…”
echo

find “$ORIG” -iname ‘*.lnk’ | while read LNK_FILE
do
echo
echo “[*] Found: \”$LNK_FILE\””

CANDIDATE_STRING=$(strings “$LNK_FILE” | grep ‘:\\’)
LINUX_PATH_TO_EXE_FILE=$(echo “$CANDIDATE_STRING” | \
tail -n1 | \
sed -e ‘s#.*[a-zA-Z]:\\#'”$DOS_DRIVE”‘/#’ | \
sed -e ‘s#\\#/#g’ | \
sed -e ‘s#//#/#g’ )
LINUX_PATH_TO_EXE_FILE=$(realpath “$LINUX_PATH_TO_EXE_FILE”)
echo “[i] The candidate file string is:”
echo “[i] \”$LINUX_PATH_TO_EXE_FILE\””

SYMLINK_NAME=”$DEST”/$(basename “$LINUX_PATH_TO_EXE_FILE”)
if [ ! -L “$SYMLINK_NAME” ]; then
if [ -r “$SYMLINK_NAME” ]; then
echo “[i] File with the same name detected, but it’s not a symlink.”
echo “[i] I will add a RANDOM suffix to the symlink name.”
SYMLINK_NAME=”${SYMLINK_NAME}-${RANDOM}”
fi
fi
if [ -r “$LINUX_PATH_TO_EXE_FILE” ]; then
echo “[i] Running: ln -nfs \”$LINUX_PATH_TO_EXE_FILE\” \”$SYMLINK_NAME\””
ln -nfs “$LINUX_PATH_TO_EXE_FILE” “$SYMLINK_NAME” || die could_not_symlink
else
echo “[E] This .lnk file points to a file that doesn’t exist.”
echo “[E] Couldn’t create this symlink, sorry.”
fi
done
