# Python

### Installation von PyCharm der FA JetBrains
Download der aktuellen Version von [JetBrains](www.jetbrains.com) für die verwendete Plattform.

##### Linux
Die Datei 'pycharm-community-2018.1.4.tar.gz' wird mit dem Kommando `sudo tar xfz pycharm-community-2018.1.4.tar.gz -C /opt/` werden die Daten unter /opt/ entpackt und PyCharm kann ausgeführt werden. Dazu befindet sich im Ordner /opt/pycharm/bin die datei `pycharm.sh` -> `./pycharm.sh`.

##### Mac
Auf eine Installation auf der Mac-Plattform wird hier verzichtet.

---

### Ausführen von Jupyter Notebook
Ist Python (Anaconda) installiert, kann Jupyter Notebook einfach durch das Kommando `jupyter notebook` per Terminal ausgeführt werden.

---

### Python für die Datenanalyse - Pandas

Pandas ist eine Open Source Bibliothek, die auf NumPy aufgebaut ist. Es erlaubt eine schnelle Datenanlyse und -bereinigung. Viele Datenquellen können damit verarbeitet werden. Eine zusätzliche nstallation ist nicht erforderlich, da es bei der Installation von Anaconda mit integriert ist. Sollte das nicht der Fall sein, kann es per `conda install pandas` nahgeladen werden.

#### Series
```python
import numpy as np
import pandas as pd

labels = ["a", "b", "c"]
liste = [10, 20, 30]
arr = np.array(liste)           # Numpy-Array
dict = ("a":10, "b":20, "c":30) #
pd.Series(data=liste)           # Zuweisung der Liste zu Pandas
pd.Series(data=liste, index=labels) # Labels > Index
pd.Series(array, labels)        # Ausgabe mit Numpy-Array und Labels
```

#### Data Frames
```python
from numpy.random import randn

np.random.seed(101)

# Erstellung des DataFrames (ähnlich Series)
df = pd.DataFrame(randn(5, 4), index='A B C D E'.spilt(),columns='W X Y Z'.split())
df                              # Ausgabe des DataFrame
df["W", "Z"]                    # Ausgabe der Spalte W und Z (df.W geht auch)

# Erstellen/Löschen einer neuen Spalte
df["neu"] = df["W"] + df["Y"]   # aufnahme der Spalte 'neu' als Summe der Spalten 'W' und 'Y'
df.drop('neu', axis=1)          # entfernt die Spalte 'neu' nur temporär
df.drop('neu', axis=1, inplace=true)  # entfernt die Spalte final

# Erstellen/Löschen einer neuen Zeile
df.drop('E', axis=0)            # Zeile ebenfalls temp. entfernt

# Zeilen/Spalten ausgeben
df.loc['A']                     # Ausgabe einer Zeile
df.iloc[2]                      # Ausgabe des Index

df.loc['A', 'Y']                # Ausgabe der Zeile
df.loc[['A', 'B'], ['X', 'Y']]  # Ausgabe eines Bereiches
```

###### Bedingte Auswahl
```python
# positive Werte
df[df>0]                        # Ausgabe aller Werte größer 0

# Spalten auswählen
df[df['W']>0][['X', 'Y', 'Z']]  # Ausgabe der drei Spalten X-Z

# Filter kombinieren
df[(df['W']>0) & (df['Y']>1)]   # Ausgabe der Zeilen, bei denen W>0 "und" Y>1 ist
df[(df['W']>0) | (df['Y']>1)]   # Ausgabe mit "oder"

# Index vorausstellen
df.reset_index()                # stellt dem vorhandenen Index einen weiteren Index vorran

# Index wechseln
df.set_index('Staaten', inplace = true) # Spalte Staaten wird neuer Index
```
