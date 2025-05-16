# Rebuilding the Pistons 🏀

**StoryTelling** – Un proyecto de análisis deportivo enfocado en la reconstrucción de los Detroit Pistons.

---

## 👥 Equipo

**StoryTelling Data Analytics** 

- David Rada  
- Iván Hernández  
- Manuel Sánchez

---

## 🎯 Objetivo del análisis

El propósito principal de este proyecto es entender las causas del bajo rendimiento de los Detroit Pistons en la última década, y proponer recomendaciones a través de un análisis integral de datos.  
Nos enfocamos en detectar oportunidades de mejora a partir del análisis de jugadores, salarios, picks del draft y eficiencia económica y deportiva.

---

## 🛠 Tecnologías utilizadas

- Google Cloud SQL (SQLserver)
- DBeaver
- Python  
  - Pandas  
  - NumPy   
- Jupyter Notebook  
- GitHub

---

## ⚙️ Metodología aplicada en Sprint 1

- Diseño de modelo entidad-relación  
- Creación de instancia en Google Cloud  
- Desarrollo de scripts SQL para la creación de tablas  
- Análisis exploratorio inicial con Pandas  
- Automatización de scraping para datos de salarios y MVPs  
- Configuración del entorno colaborativo en GitHub

---

## 📊 Datos utilizados

**Fuentes de datos:**

- Kaggle (NBA Dataset)
- HoopsHype (Salarios – scraping personalizado)
- Basketball Reference (MVPs – scraping personalizado)

**Contenido:**

- Estadísticas individuales
- Información de drafts
- Salarios históricos
- Premios MVP
- Métricas colectivas por equipo

---

## 🧩 Modelo entidad-relación

**Tablas diseñadas:**

- `players`  
- `salaries`  
- `draft`  
- `mvps`  
- `teams`  

Incluye claves primarias y foráneas, tipos de datos definidos y relaciones 1:N entre jugadores y equipos.

---

## 📁 Estructura del repositorio

```
EDA/     → notebooks de análisis exploratorio  
ETL/     → scripts de limpieza y scraping  
SQL/     → scripts de creación de base y tablas  
DOCS/    → presentaciones y documentación adicional
```

---

## ✅ Estado actual - Cierre del Sprint 1

- Repositorio configurado y compartido  
- Datos recopilados y limpiados  
- Base de datos en la nube funcional  
- Conexión verificada desde Python 
- Proceso de scraping automatizable validado  
- Estructura de trabajo colaborativa establecida
