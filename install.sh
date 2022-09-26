working_dir=$(pwd)
echo "finding working directory..."
chmod +x script.sh
echo "granting execute permission..."
cd ~
echo "changing directory to root sirectory..."
echo alias md=$working_dir/script.sh >>.bashrc
echo "adding alias and appending in .bashrc..."
. ~/.bashrc
echo "reloading .bashrc..."
cd $working_dir
echo "reverting back to previous working dir..."
echo "installed sucessfully"
echo "usage -> md file_name.md"
