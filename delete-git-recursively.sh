# Source https://gist.github.com/facelordgists/80e868ff5e315878ecd6
find . \( -name ".git" -o -name ".gitignore" -o -name ".gitmodules" -o -name ".gitattributes" \) -exec rm -rf -- {} +
