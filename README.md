# 🏀 Rebuilding the Pistons – Análisis del declive y oportunidades de mejora

El propósito principal de este proyecto es **entender las causas del bajo rendimiento de los Detroit Pistons** en la última década y proponer recomendaciones accionables a partir de un análisis integral de datos.  
A través de herramientas de análisis estadístico, visualización y modelado, se busca detectar patrones que justifiquen el presente deportivo y económico del equipo.

## 👥 Equipo de trabajo

**StoryTelling Data Analytics**

- David Rada  
- Iván Hernández  
- Manuel Sánchez
---

## 📚 Contexto y enfoque

La NBA es una liga con una gran disponibilidad de datos históricos y actuales, sin embargo, no todos los equipos han logrado convertir esa información en una ventaja competitiva. En este caso, nos centramos en los Pistons, una franquicia histórica que lleva años sin consolidarse como contendiente.

El análisis abarca:
- Desempeño colectivo anual
- Producción ofensiva y defensiva
- Eficiencia salarial y rendimiento del draft
- Construcción de plantel y rotaciones

---

## 🛠 Tecnologías utilizadas

- **Google Cloud SQL (SQL Server)** – Creación de base de datos en la nube  
- **DBeaver** – Herramienta de modelado y carga SQL  
- **Jupyter Notebook** – Desarrollo del análisis en Python  
- **Power BI** – Visualización avanzada e interacción  
- **GitHub** – Repositorio y control de versiones  

### 📦 Librerías de Python

- `pandas` – Limpieza y manipulación de datos  
- `numpy` – Cálculos estadísticos y normalización  
- `matplotlib.pyplot` – Visualizaciones  
- `seaborn` – Gráficos de correlación y análisis visual  
- `sqlalchemy` – Conexión entre Python y SQL Server  
- `sklearn.preprocessing.MinMaxScaler` – Normalización  
- `os`, `warnings`, `datetime`, `IPython.display`, `matplotlib.patches`

---

## 🧠 Metodología aplicada

### 🔗 Modelado y arquitectura de datos

- Modelo entidad-relación con 14 tablas (dimensiones y hechos)  
- Relaciones entre jugadores, partidos, salarios, draft y MVP  
- Uso de claves primarias y foráneas para garantizar integridad

### 🔄 ETL y normalización

- Automatización parcial del scraping (salarios y MVPs)  
- Limpieza profunda desde Python previa a carga en SQL  
- Revisión de claves foráneas, eliminación de duplicados y ajuste de tipos

---

## 📊 Datos y fuentes

- **Kaggle** – Estadísticas NBA (juegos, jugadores, equipos)  
- **HoopsHype** – Salarios históricos (scraping automatizado)  
- **Basketball Reference** – Datos de MVP y draft (scraping automatizado)

**Período analizado:** Temporadas 2013-2014 a 2022-2023

---

## 📈 Métricas clave del análisis (KPIs)

- Diferencial promedio de puntos por juego  
- Victorias y derrotas totales  
- Porcentaje de victorias por temporada  
- Variación de rendimiento año a año  
- Puntos por tipo de jugada (pintura, contragolpe, segunda oportunidad)  
- Eficiencia en tiros, rebotes, asistencias, pérdidas y robos  

---

## 🔬 Análisis exploratorio y visualizaciones

Se realizaron múltiples visualizaciones para detectar tendencias:

- Gráficos de línea para evolución de victorias y derrotas  
- Radar charts para comparar fortalezas ofensivas y defensivas  
- Heatmaps de correlación entre métricas clave  
- Líneas de tiempo de rotaciones, gerencias y jugadores destacados  
- Comparativa de eficiencia ofensiva por tipo de jugada  

---

## 📊 Dashboard en Power BI

El análisis exploratorio en Python fue complementado con la construcción de un **dashboard interactivo en Power BI**, orientado a presentar los resultados de manera visual, clara y ejecutiva.

### 🔧 Elementos desarrollados en Power BI:

- **Integración con datos limpios desde Python**  
  Se exportaron DataFrames procesados a Power BI para visualización dinámica.

- **Modelo de datos estructurado**  
  Relaciones entre tablas principales (jugadores, temporadas, equipos, draft, salarios, juegos) siguiendo las claves foráneas diseñadas en SQL.

- **Medidas DAX definidas**  
  - % de victorias por temporada  
  - Diferencial promedio de puntos  
  - Costo por victoria  
  - Aportación de novatos y titulares  
  - Ranking por eficiencia ofensiva y defensiva  

- **Dashboards desarrollados:**
  - **Rendimiento histórico (2013-2023)**: Victorias, derrotas, diferencial y eficiencia año a año  
  - **Indicadores ofensivos y defensivos**: Comparativas por temporada y métricas normalizadas  
  - **Draft y rotación**: Análisis de picks, combine y evolución de novatos  
  - **Eficiencia económica**: Salarios vs rendimiento deportivo  
  - **Panel exploratorio**: Interacción por tipo de jugada, alineación, y entrenador  

- **Interactividad configurada:**
  - Filtros por año, jugador, posición y tipo de jugada  
  - Tooltips explicativos en gráficos  
  - Segmentadores por métricas clave y comparadores visuales

> 📁 El archivo `.pbix` se encuentra en la carpeta `/DOCS/` con el nombre:  
> `Proyecto Final - Detroit Pistons V2 ajustado con python.pbix`

---

## 🚀 Conclusiones destacadas

- El equipo mantuvo un **diferencial negativo de puntos** en casi todas las temporadas.  
- Las **tasas de victoria fueron inferiores al 40%** en la mayoría de los años.  
- Las **pérdidas de balón**, **ineficiencia de tiro** y **defensa débil** fueron patrones recurrentes.  
- La inversión en salarios no siempre estuvo alineada con el rendimiento real.  
- El draft no ha generado impacto suficiente en el rendimiento global del equipo.  

---


