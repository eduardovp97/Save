while IFS='' read -r -d '' fname ; do
   nname="${fname##*/}"
   mv -v -n "${fname}"  "${fname%/*}/${nname//[[:space:]]/_}"
done < <(find "$(pwd)"  -name "* *" -type f  -print0)
