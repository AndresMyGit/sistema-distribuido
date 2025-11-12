# Usa Nginx versión específica con alpine (más seguro y ligero)
FROM nginx:1.27-alpine

# Crear usuario no-root
RUN addgroup -g 101 -S nginx && \
    adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologin -G nginx -g nginx nginx || true

# Copia archivo de configuración seguro
COPY nginx.conf /etc/nginx/nginx.conf

# Copia los archivos al directorio público de Nginx con permisos restrictivos
COPY index.html /usr/share/nginx/html/
COPY estilos.css /usr/share/nginx/html/
COPY AplicacionJava.jar /usr/share/nginx/html/

# Cambiar permisos
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod 755 /usr/share/nginx/html && \
    chmod 644 /usr/share/nginx/html/*.html /usr/share/nginx/html/*.css /usr/share/nginx/html/*.jar

# Expone solo HTTP (Render agrega HTTPS automáticamente)
EXPOSE 80

# Ejecutar como usuario nginx (no-root)
USER nginx

