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

Nos permite 
