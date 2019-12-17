![Script](image/Script.jpg)

## Enunciado

Realiza un script que introduciéndolo como parámetro el nombre de un repositorio, muestre como salida los paquetes de ese repositorio que están instalados en la máquina.

Se tendrá en cuenta:
* La simpleza del código
* La legibilidad
* La rapidez de ejecución
* La portabilidad

## Programa

``` bash
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
```

## Funcionamiento

1. Ejecutamos el scrip con el lanzador que prefiramos (sh, bash, ./, source)
2. Seguido del fichero .sh
3. Seguido del parámetro que es la dirección repositorio

###### Ejemplo:
~~~
bash SaberRepos.sh "http://ftp.es.debian.org/debian"
~~~

