# generalized extract function as suggested by Mendel Cooper in "Advanced Bash Scripting Guide"
extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

download () {
    http --download $1
}

# reimplementation of python plugin's function to use virtualenv instead of venv
mkv() {
  local name="${1:-venv}"
  local venvpath="${name:P}"

  virtualenv "${name}" || return
  echo >&2 "Created venv in '${venvpath}'"
  vrun "${name}"
}

space2csv() {
    # turns space seperated file into comma separated file
    awk '{$1=$1}1' OFS=, $1
}

ls-servers() {
    local file="$HOME/servers.txt"
    if [[ -f "$file" ]]; then
        cat "$file"
    else
        echo "The file $file does not exist and needs to be created."
    fi
}

pdb-tools() {
    ls /home/ws/.local/bin | grep pdb_ | cut -d" " -f1
}

today() {
    date "+%Y-%m-%d"
}

sm-dag() {
    snakemake --dag "${1:-all}" | dot -Tsvg
}
