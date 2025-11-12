# Usa Nginx para servir tu sitio web
FROM nginx:latest

# Copia los archivos al directorio público de Nginx
COPY index.html /usr/share/nginx/html/
COPY estilos.css /usr/share/nginx/html/
COPY AplicacionJava.jar /usr/share/nginx/html/

# Expone el puerto 80
EXPOSE 80
