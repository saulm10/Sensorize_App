# Sensorize

**Sensorize** es una aplicación diseñada para la **visualización y control de stock en silos** de forma accesible y eficiente. Esta herramienta ofrece a los ganaderos la posibilidad de monitorear y gestionar el nivel de llenado de sus silos sin necesidad de costosos sistemas alternativos, facilitando la supervisión y eliminando la necesidad de subirse físicamente a los silos para inspeccionarlos.

---

## Capturas de Pantalla

<div style="display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;"> <img src="https://github.com/user-attachments/assets/ad36d732-55db-451f-a3d0-7781de7640ce" alt="Screenshot 1" width="200" /> <img src="https://github.com/user-attachments/assets/2c0d7445-67db-4eeb-9ae5-e098744c22b8" alt="Screenshot 2" width="200" /> <img src="https://github.com/user-attachments/assets/1d03eac8-befa-4f04-97af-9aad57335e85" alt="Screenshot 3" width="200" /> <img src="https://github.com/user-attachments/assets/1b5a3399-c4f4-4e5a-b8e2-bfae786c6756" alt="Screenshot 4" width="200" /> </div>

---

## Funcionalidades Principales

- **Monitoreo en tiempo real** del nivel de llenado en los silos.
- **Alertas automáticas** al alcanzar niveles de stock bajos o críticos, facilitadas por Firebase.
- **Pedidos y seguimiento**: Próximamente, se integrará un sistema de gestión de pedidos y su seguimiento para simplificar la administración de inventarios.
- **Historial y análisis**: Acceso al historial de cambios en los niveles de stock para tener un registro detallado y analizar patrones de consumo.

## Arquitectura Técnica y Desarrollo

Sensorize está desarrollada en **Flutter**, lo que permite ofrecer soporte nativo tanto en Android como en iOS desde una única base de código. Utilizamos **Supabase** como base de datos y sistema de autenticación para garantizar la seguridad y escalabilidad de los datos, además de **Firebase** para gestionar las notificaciones automáticas.

### Tecnologías Utilizadas

- **Flutter**: Desarrollo multiplataforma para Android e iOS.
- **Supabase**: Autenticación y gestión de base de datos segura.
- **Firebase**: Notificaciones en tiempo real.

### Características Adicionales

- **Sensores Inteligentes**: La aplicación se complementa con un sistema de sensores que se instalan en la tapa de cada silo. Estos sensores tienen un coste inicial de instalación, pero no requieren mantenimiento adicional, lo que facilita una solución asequible y a largo plazo para los usuarios.
- **Mantenimiento y Soporte**: La app incluye un servicio de soporte técnico para resolver dudas y problemas, así como un mantenimiento periódico de los servicios para asegurar su correcto funcionamiento.

## Beneficios para el Usuario

Actualmente, muchos ganaderos enfrentan el problema de no poder monitorear sus silos de manera económica y sencilla, ya que los sistemas actuales suelen ser costosos. **Sensorize** proporciona una solución accesible que elimina la necesidad de inspección manual y permite una gestión centralizada del inventario.

## Próximas Funciones

Sensorize está en constante evolución y expansión. Además del sistema de gestión de pedidos, se está planificando la integración de:

- **Análisis de consumo predictivo** para anticiparse a las necesidades de reabastecimiento.
- **Reportes avanzados y personalizados** para ayudar a los usuarios a entender mejor sus patrones de consumo.

## Importancia del Feedback

Para asegurar que la aplicación siga resolviendo problemas relevantes, **el feedback de los usuarios será fundamental**. Sensorize se desarrollará en función de las necesidades y sugerencias de los usuarios, adaptándose para abarcar más funcionalidades y mejorar la experiencia de usuario.

---
