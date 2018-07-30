# Visualisation mit Seaborn
Grundlage von Seaborn ist die MatPlotLib.

## Vorbereitung

### Installation
Ähnlich MatPlot muss Seaborn zu Python nachinstalliert werden. Dazu dient folgendes Kommando: `conda install seaborn`.

### Beispiele
Um den Umfang von Seaborn zu erfassen kann die Homepage [www.seaborn.pydata.org](www.seaborn.pydata.org) besucht werden. Diese beinhaltet in der Gallerie einen visuellen Auszug von möglichen Diagrammen. Die API beschreibt die möglichen Methoden und Funktioen. (Plot-Funktionen, Styles, Farben, Widgets,...)

#### Import der Pakete
```python
import seaborn as sns
%matplotlib inline
```

#### Laden der Daten
```python
data = seaborn.load_dataset("Data")
data.head()                                       # Ausgabe der ersten 5 Datensätze
```

## Visualisierung

### Verteilungs Plots

#### DistPlot
```python
sns.distplot(data("col"))                         # Ausgabe des Distplot Diagramms
#sns.distplot(data("col"), kde=false, bins=20)    # KDE = Durchschnittsfunktion, bins = Anzahl der Boxen
```

#### JointPlot
```python
sns.jointplot(x="col1", y="col2", data=data, kind="scatter")  # 
#sns.jointplot(x="col1", y="col2", data=data, kind="hex")  # in Form von Hexagons
#sns.jointplot(x="col1", y="col2", data=data, kind="reg")  # Trendanzeige
#sns.jointplot(x="col1", y="col2", data=data, kind="kde")  # Gradientverteilung
```

#### PairPlot
```python
sns.pairplot(data)                                # Allgemeine Darstellung
#sns.pairplot(data, hue="col")                     # Hervorhebung von untersch. Werten der Spalte
#sns.pairplot(data, hue="col", palette="coolwarm") # veränderte Farbgebung
```

#### RugPlot
```python
sns.rugplot(data["col"])                          # Verteilung im RugPlot-Diagramm (ähnlich Barcode)
```

#### KDE-Plot (Kerndichteschätzer)
Bei der Kerndichteschätzung handelt es sich um ein statistisches Verfahren zur Schätzung der Wahrscheinlichkeitsverteilung einer Variable.
```python
import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

dataset = np.random.randn(25)                     # Datensatz erstellen
sns.rugplot(dataset)                              # Ausgabe des Dataset als Rugplot (Verteilung)
x_min = dataset.min() - 2                         # X-Achse beschränken
x_max = dataset.max() + 2

x_axis = np.linspace(x_min, x_max, 100)
bandwidth = ((4*data.std()**5)/(3*len(dataset)))**.2

kernel_list = []

for data_point in dataset:
  kernel = stats.norm(data_point, bandwidth).pdf(x_axis)
  kernel_list.append(kernel)                      # Für jeden Punkt wird ein Kernel erstellt und angefügt
  
  kernel = kernel / kernel.max()
  kernel = kernel * .4
  plt.plot(x_axes, kernel, color = "grey", alpha = 0.5)
  
plt.ylim(0, 1)                                    # Ausgabe der Verteilung als Graphen, die Summe der Graphen stellt der KDE-Plot dar

sum_of_kde = np.sum(kernel_list, axis=0)          # Graphen summieren

fig = plt.plot(x_axis, sum_of_kde, color='indianred')
sns.rugplot(dataset, c = 'indianred')

plt.yticks([])                                    # Y-Achse Markierungen entfernen

#sns.kdeplot(dataset)                             # Ausführung des kdeplot
```

### Kategorische Plots

#### Barplot
Darstellung eines einfachen Balkendiagrams.
```python
sns.barplot(x = "col", y = "col2", data = data)
```

#### Countplot
Zählung von Inhalten einer Spalte und Aufgliederung.
```python
sns.countplot(x = "col", data = data)
```

#### Boxplot
Darstellung von kategorischen Daten und Verteilung als Box (quantitative Daten), Biske (restliche Verteilung von Werten).
```python
sns.boxplot(x = "col", y = "col2", data = data, palette = "rainbow")
#sns.boxplot(x = "col", y = "col2", data = data, palette = "rainbow", orient = "h")  # horizontale Ausrichtung
#sns.boxplot(x = "col", y = "col2", data = data, hue=""col3) # Hue stellt Verteilung nebeneinander nach Spalte
```

### Matrix Plots

#### Heatmap
````python
import seaborn as sns
%matplotlib inline

data = ('S1':[3, 2, 1],
        'S2':[2, 3, 1],
        'S3':[2, 1, 3])

sns.heatmap(data.corr())                          # Korrelation der Spalten zueinander
#sns.heatmap(data.corr(), cmap='coolwarm', annot=True, linecolor='white', linewidth=1) # Farbkorrektur, Inhalt anzeigen, Linien
```

Ist eine Tabelle vorhanden, kann diese per `data.pivot_table(values='werte', index='rows', columns='cols')`.

#### Clustermap
Die `clustermap()` ist eine gruppierte `heatmap()`, nach Werten.
```python
sns.clustermap(data.corr(), cmap='coolwarm', standard_scale=1)  # Scale beschr. die Gliederung der Cluster
```

### Regression Plots

#### LM Plot
```python
sns.lmplot(x='S1', y='S2', data=data)             # Ausgabe eines LMPlot
#sns.lmplot(x='S1', y='S2', data=data, hue='S3', palette='coolwarm')  # Unterteilung nach Spalte 3
#sns.lmplot(x='S1', y='S2', data=data, hue='S3', markers=['o', 'v'])  # Unterteilung mit Kreis und Dreieck
#sns.lmplot(x='S1', y='S2', data=data, scatter_kws=('s'=100))         # Marker vergrößern

#sns.lmplot(x='S1', y='S2', data=data, col='S3')  # Splate 3 nach 2 Diagrammen unterteilen
#sns.lmplot(x='S1', y='S2', data=data, col='S3', row='S4')  # weitere Unterteilung in Zeilen
```

### Gridplot

### Style und Farbgebung 
```python
plt.figure(figsize=(13, 3))
sns.set_style('darkgrid')                         # Auswahl aus Std.-Grids
sns.countplot(x='S1', data=data)                  # Balkendiagramm
sns.dispine()                                     # Rahmen entfernen (ggf. auch Parameter: left=true)
```
