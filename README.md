# El Crimen Bajo la Lupa: Desentrañando los Robos en el Metro CDMX con Ciencia de Datos

**Autores:** Arian Pedroza, Edgar Godinez, Miguel Cuellar
**Afiliación:** Universidad Nacional Rosario Castellanos, Grupo 202, Ciencia de Datos para Negocios
**Fecha:** 31 de mayo de 2025

<!-- Opcional: Imagen de Portada/Banner -->
 ![Banner del Proyecto](Visualizaciones/banner_image.png) 

## Resumen del Proyecto

Este proyecto realiza un análisis exhaustivo del delito de robo en el Sistema de Transporte Colectivo (STC) Metro de la Ciudad de México, utilizando datos de carpetas de investigación de la FGJCDMX (2016-2024), datos de afluencia del Metro, información geográfica y socioeconómica. Aplicamos Análisis Exploratorio de Datos (EDA) para identificar patrones temporales y espaciales, modelado predictivo con Facebook Prophet (incluyendo regresores como afluencia y pandemia), y análisis de autocorrelación espacial (LISA) para explorar la relación entre robos a nivel alcaldía e indicadores socioeconómicos (Gini, IRS).

Los hallazgos clave revelan picos de robo los viernes y en horas de alta afluencia (7-9 AM, 18-20 PM), una concentración en alcaldías centrales (Cuauhtémoc destacada), y que la mayoría de los robos en Metro son sin violencia (91.5%). El modelo Prophet predijo robos diarios con un MAE de ~1.31. No se encontró una correlación global fuerte entre robos y Gini/IRS a nivel alcaldía. Se proponen estrategias de patrullaje predictivo, rediseño ambiental (CPTED) y fortalecimiento de la transparencia.

## Visualizaciones Destacadas

<!-- Elige 1 o 2 de tus GIFs o gráficas más impactantes -->
**Evolución Anual de la Tasa de Robo por Pasajero por Estación (2016-2024):**
![Evolución Tasa de Robo](Visualizaciones/evolucion_tasa_robo_metro_estacion_anual.gif)

**Robos por Modalidad de Transporte y Tipo de Violencia (2016-2024):**
![Violencia por Modalidad](Visualizaciones/violencia_por_modalidad_transporte.png)

## Motivación

El STC Metro es vital para la CDMX, transportando aproximadamente **3.2 millones** de pasajeros diariamente. El robo en este sistema afecta la seguridad y confianza de millones. Este análisis busca proveer insights basados en datos para informar estrategias de prevención más efectivas.

## Fuentes de Datos Principales

*   **Carpetas de Investigación FGJCDMX:** (2016 - Oct 2024) - `carpetasFGJ_acumulado_2025_01.csv` del [Portal de Datos Abiertos CDMX](https://datos.cdmx.gob.mx/dataset/carpetas-de-investigacion-fgj-de-la-ciudad-de-mexico).
*   **Afluencia STC Metro:** (2010 - Abr 2025) - `Afluencia_metro-2025-05-18.csv` del [Portal de Datos Abiertos CDMX](https://datos.cdmx.gob.mx/dataset/afluencia-diaria-del-metro-cdmx).
*   **Geometrías Estaciones Metro:** `stcmetro_shp.zip` de SEMOVI / [Portal de Datos Abiertos CDMX]([URL si la tienes, o buscar "líneas y estaciones metro"]).
*   **Geometrías Alcaldías CDMX:** `poligonos_alcaldias_cdmx.zip` del [Portal de Datos Abiertos CDMX](https://datos.cdmx.gob.mx/dataset/alcaldias).
*   **Coeficiente de Gini (2020):** `GiniMunicipios2010_2015_2020.xlsx` de [CONEVAL](https://www.coneval.org.mx/Medicion/Paginas/Cohesion_Social.aspx).
*   **Índice de Rezago Social (2020):** `IRS_localidades_2020.xlsx` de [CONEVAL](https://www.coneval.org.mx/Medicion/Documents/IRS_2020/IRS_loc_2000_2020.zip) (agregado a nivel municipal).

## Metodología

1.  **Recopilación y Preprocesamiento de Datos:** Carga, limpieza, transformación de fechas, estandarización de ubicaciones, ingeniería de características (`tipo_violencia`, `transport_mode`, variables temporales).
2.  **Análisis Exploratorio de Datos (EDA):**
    *   Tendencias temporales generales (anuales, mensuales).
    *   Patrones detallados (hora, día de la semana) para el Metro.
    *   Distribución geográfica (alcaldías y estaciones - volumen y tasa de robo).
    *   Análisis de modalidad de violencia por tipo de transporte.
    *   Correlación robos vs. afluencia.
3.  **Modelado Predictivo (Facebook Prophet):**
    *   Serie de robos diarios en Metro (transformación logarítmica).
    *   Regresores: Afluencia diaria, indicador de pandemia.
    *   Entrenamiento, predicción y evaluación (MAE, RMSE, MAPE).
    *   Análisis de componentes y residuos del modelo.
4.  **Análisis de Autocorrelación Espacial (Nivel Alcaldía, 2020):**
    *   Cálculo de Moran Global para robos en Metro.
    *   LISA univariado para robos en Metro.
    *   LISA bivariado: (Robos vs. Gini) y (Robos vs. IRS).

## Resultados Principales

*   **Patrones Temporales:** Pico de robos en Metro en 2018; caída en 2020 (pandemia) y recuperación parcial. Picos horarios a las 7-9 AM y 18-20 PM, y los días viernes.
    *   ![Frecuencia Robos Metro por Hora](Visualizaciones/hist_frecuencia_robos_metro_hora.png)
*   **Violencia:** Mayoría de robos en Metro son sin violencia (91.5%), en contraste con otros transportes como "Otro Vehículo Transporte" (90.6% con violencia).
*   **Geografía del Delito:**
    *   Alcaldía Cuauhtémoc concentra la mayor parte de robos en Metro.
        *   ![Top 7 Alcaldías](Visualizaciones/top7_alcaldias_transporte_agrupado_pct_metro.png)
    *   Estaciones con más robos absolutos: Hidalgo, Pino Suárez, Pantitlán.
        *   ![Top 10 Estaciones Absolutos](Visualizaciones/top_10_estaciones_robos_absolutos.png)
    *   Estaciones con mayor tasa de robo/afluencia (riesgo relativo): Hidalgo, Guerrero, Balderas.
        *   ![Top 10 Estaciones Tasa](Visualizaciones/top_10_estaciones_tasa_robo.png)
*   **Afluencia:** Positivamente correlacionada con robos (r=0.513), explica ~26.3% de la varianza de robos diarios.
    *   ![Robos vs Afluencia](Visualizaciones/scatter_robos_vs_afluencia_total.png)
*   **Modelo Prophet:** MAE de ~1.31 robos diarios. Captura tendencias y estacionalidades.
    *   ![Predicción Prophet](Visualizaciones/prediccion_prophet_final_log_revertida.png)
*   **Análisis Socioeconómico Espacial (Alcaldía 2020):** No se encontró correlación global fuerte ni patrones LISA dominantes entre robos en Metro y Gini/IRS.

## Propuestas

1.  **Patrullaje Predictivo y Adaptativo:** Usar patrones y predicciones para focalizar la seguridad.
2.  **Intervenciones CPTED en Estaciones Críticas:** Mejorar diseño ambiental (espejos, vallas, iluminación).
3.  **Fortalecimiento de Transparencia y Auditoría:** Incrementar la rendición de cuentas en la gestión del Metro.

*(Ver el paper completo en la carpeta `/paper/` para detalles de las propuestas).*

## Estructura del Repositorio

*   `/paper/`: Contiene el reporte de investigación detallado en formato PDF.
*   `/notebooks/`: Jupyter Notebook (`EDA_Analisis_Robo_Metro.ipynb`) con todo el código del análisis.
*   `/data/raw/`: Datos originales utilizados.
*   `/data/processed/`: Datos intermedios generados (ej. `robos_asignados_a_estaciones_metro.csv`).
*   `/visualizations/`: Todas las gráficas, mapas y GIFs generados.

## Cómo Replicar el Análisis

1.  Clonar este repositorio.
2.  Asegurar tener Python 3.x y las librerías listadas en (próximamente) `requirements.txt` (principales: pandas, geopandas, matplotlib, seaborn, prophet, scipy, libpysal, esda).
3.  Descargar los archivos de datos de las fuentes listadas y colocarlos en `data/raw/` (si no están ya en el repo).
4.  Ejecutar el notebook `notebooks/EDA_Analisis_Robo_Metro.ipynb`. Las visualizaciones se guardarán en `visualizations/`.

## Trabajo Futuro

*   Modelos predictivos más avanzados (LSTM, GNN, ST-Cokriging).
*   Análisis espacial a escala más fina (micro-hotspots).
*   Incorporación de más variables (eventos, clima).

## Licencia

Este proyecto se comparte bajo la Licencia: MIT License.

---
