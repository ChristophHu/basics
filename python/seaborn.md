# Visualisation mit Seaborn
Grundlage von Seaborn ist die MatPlotLib.

## Vorbereitung

### Installation
Ähnlich MatPlot muss Seaborn zu Python nachinstalliert werden. Dazu dient folgendes Kommando: `conda install seaborn`.

### Beispiele
Um den Umfang von Seaborn zu erfassen kann die Homepage [www.seaborn.pydata.org](www.seaborn.pydata.org) besucht werden. Diese beinhaltet in der Gallerie einen visuellen Auszug von möglichen Diagrammen. Die API beschreibt die möglichen Methoden und Funktioen. (Plot-Funktionen, Styles, Farben, Widgets,...)

## Visualisierung

### Import der Pakete
```python
import seaborn as sns
%matplotlib inline
```

### Laden der Daten
```python
data = seaborn.load_dataset("Data")               # 
data.head()                                       # Ausgabe der ersten 5 Datensätze
```

#### DistPlot
```python
sns.distplot(data("col"))                         # Ausgabe des Distplot Diagramms
#sns.distplot(data("col"), kde=false, bins=20)    # KDE = Durchschnittsfunktion, bins = Anzahl der Boxen
```

#### JointPlot
```python
sns.jointplot(x="col1", y="col2", data=data, kind="scatter")  # 
sns.jointplot(x="col1", y="col2", data=data, kind="hex")  # in Form von Hexagons
sns.jointplot(x="col1", y="col2", data=data, kind="reg")  # Trendanzeige
sns.jointplot(x="col1", y="col2", data=data, kind="kde")  # Gradientverteilung
```

#### PairPlot
```python
sns.pairplot(data)                                # Allgemeine Darstellung
sns.pairplot(data, hue="col")                     # Hervorhebung von untersch. Werten der Spalte
sns.pairplot(data, hue="col", palette="coolwarm") # veränderte Farbgebung
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

x_axes = np.linspace(x_min, x_max, 100)
bandwidth = ((4*data.std()**5)/(3*len(dataset)))**.2

kernel_list = []

for data_point in dataset:
  kernel = stats.norm(data_point, bandwidth).pdf(x_axes)
  kernel_list.append(kernel)                      # Für jeden Punkt wird ein Kernel erstellt und angefügt
  
  kernel = kernel / kernel.max()
  kernel = kernel * .4
  plt.plot(x_axes, kernel, color = "grey", alpha = 0.5)
  
plt.ylim(0, 1)                                    # Ausgabe der Verteilung als Graphen, die Summe der Graphen stellt der KDE-Plot dar
```

