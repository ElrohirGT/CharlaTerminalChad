---
title: ¿Cómo ser un CHAD en Terminal?
sub_title: ¿Qué es Linux y por qué es importante la terminal?
author: Flavio Galán
---

# ¿Qué es una Shell?

![](./imgs/bashIcon.png)

<!-- pause -->

Conceptualmente es una interfaz textual en la cual ingresamos comandos dentro de la computadora y nos devuelve un resultado.

<!-- column_layout: [1,1] -->

<!-- column: 0 -->
```bash +exec
# Single line command
echo "Hello World!"
```

<!-- column: 1 -->
```bash +exec
echo "Hello" \
    "World!"
```
<!-- reset_layout -->


<!-- end_slide -->

# ¿Qué es un alias?

A veces algunos comandos los ejecutamos demasiado seguido...

```bash
# Obtener el status actual del repo
git status
# Obtener el status actual del repo
ls -la
```

Podemos crear un alias para escribir menos proceso, por ejemplo:
```bash {1|2|3} +line_numbers
alias gs="git status"
alias ll="ls -la"
alias myip='curl ipinfo.io/ip'
```

<!-- end_slide -->

## ¿Cómo hago mis alias permanentes?

Si usamos este comando por sí mismo la próxima vez que utilizemos la terminal tendremos que volver a escribirlo.

Las opciones son:

* `~/.bashrc`: Configuración del usuario.
* `~/bash_profile`: Configuración del usuario al momento de iniciar sesión.
* `/etc/bashrc`: Configuración del sistema en general.
* `/etc/profile`: Configuración del `root` al momento de iniciar sesión.

```bash
# Dentro del ~/.bashrc
alias gs="git status"
alias ll="ls -la"
alias myip='curl ipinfo.io/ip'
```

<!-- end_slide -->

# Composición de comandos

Para correr un comando solamente si el anterior es satisfactorio:
<!-- pause -->

```bash
git push && exit
```
<!-- pause -->

Ejecutar un comando solamente si anterior falla:
<!-- pause -->
```bash
git push || echo "Pushing has failed!"
```
<!-- pause -->

Ejecutar un comando cuando termine el anterior (independientemente del estatus):
<!-- pause -->
```bash
git push; echo "Pushing has failed!"
```

<!-- end_slide -->

# ¿Qué es un archivo .sh?

Puedes agrupar comandos en un archivo para automatizar acciones! Por ejemplo:

```bash
#!/bin/bash

# Build `Rust` project 1
cd Projecto1
cargo build

# Build `Go` project 2
cd ../Projecto2
go build
```

<!-- end_slide -->
## ¿Qué es el shebang?

El shebang es lo que le dice a bash qué debe ejecutar! `/bin/bash` es simplemente un intérprete. Realmente podría ser también `/bin/nodejs`:

<!-- column_layout: [1,1] -->
<!-- column: 0 -->
`.sh` script en javascript
```bash
#!/usr/bin/env node

console.log("Hello from JS!")
```

<!-- column: 1 -->
`.sh` script en python
```bash
#!/usr/bin/env python3

print("Hello from python!")
```

<!-- reset_layout -->

<!-- end_slide -->
## Ejecutando mi script
Para ejecutar el script simplemente escribe la dirección al archivo:
```bash
./file.sh

# Cuidado con usar rutas relativas!
./scripts/example1.sh
```

<!-- pause -->

Los scripts se ejecutan en tu directorio actual así que cuidado con crear archivos o realizar comandos en directorios donde no deberías!

<!-- end_slide -->


## ¿Por qué no puedo correr mi .sh?

Si tienes un error en la forma de:
```
-bash: ./file.sh: Permission denied
```
<!-- pause -->

Recuerda la sección de permisos! Puedes aplicarlos de la siguiente forma:
```bash
chmod +x file.sh
```
<!-- end_slide -->

# Atajos de teclado importantes

* \<UP ARROW\>: Comando anterior en el historial.
* \<DOWN ARROW\>: Comando posterior en el historial.
* \<CTRL\>+l: Limpia la pantalla.
* \<CTRL\>+c: Terminar la ejecución del programa actual.
* \<CTRL\>+r: Buscar dentro del historial de comandos.
