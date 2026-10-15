# mTiny Retos (versión sin carpetas)

Todos los archivos van sueltos en la raíz del repositorio. No hace falta ninguna carpeta, salvo una que se crea a mano (paso 2).

## Pasos
1. En GitHub: New repository (nombre: mtiny-retos). Pulsa **Add file > Upload files**, arrastra TODOS los archivos de esta carpeta y pulsa Commit.
2. Pulsa **Add file > Create new file**. En el nombre escribe exactamente `.github/workflows/build-apk.yml` (al escribir cada "/" se crea una carpeta). Pega dentro el contenido de `build-apk.yml` y pulsa Commit.
3. Pestaña **Actions > Build APK**. Se ejecuta sola al hacer el commit; si no, **Run workflow**.
4. A los ~5 minutos, entra en la ejecución y descarga `mtiny-retos-apk` (Artifacts). Dentro está `app-debug.apk`.

Para editar la app: cambia `app-body.html`.
