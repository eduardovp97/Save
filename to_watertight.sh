# Archivo que permitira transformar todos los archivos
# del dataset de 3D Pottery a watertight manifold

# Esta funcion auxiliar permitira cortar la ejecucion de manifold
# con una cierta pieza en caso haya demorado 1 minuto y no haya terminado
doalarm () { perl -e 'alarm shift; exec @ARGV' "$@"; }

shopt -s globstar

for file in ../../**/*.obj; do
	infile=$file
	outfile=${file//.obj/watertight.obj}
	echo "$infile"
	echo "$outfile"
	doalarm 60 ./manifold $infile $outfile 2048
done