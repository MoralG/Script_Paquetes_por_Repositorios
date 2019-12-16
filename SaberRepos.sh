#! bin/sh

#seleccionamos los paquetes instalados y se lo pasamos al siguiente bucle
for paquete in $(dpkg -l | grep '^ii' | cut -d " " -f 3)
do
#nos muestra que repositorio ha sido instalado el paquete 
    inforepos=$(apt policy $paquete 2>/dev/null | sed -n /*/,/100/p | egrep "http*" | cut -d " " -f 10)
    for repo in $inforepos
    do
#igualamos si el repositorio/s es igual al del parametro, muestra dicho paquete
        if [ $repo = $1 ]
        then
            echo "$paquete"
        fi
    done
done
