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
del df['neu']                   # entfernt die Spalte ebenfalls final

# Erstellen/Löschen einer neuen Zeile
df.drop('E', axis=0)            # Zeile ebenfalls temp. entfernt

# Zeilen/Spalten ausgeben
df.loc['A']                     # Ausgabe einer Zeile
df.iloc[2]                      # Ausgabe des Index

df.loc['A', 'Y']                # Ausgabe der Zeile
df.loc[['A', 'B'], ['X', 'Y']]  # Ausgabe eines Bereiches
```

#### Funktionen

######
```python
df.columns                      # Ausgabe aller Spaltenüberschriften
```

###### Bedingte Auswahl
```python
# positive Werte
df[df>0]                        # Ausgabe aller Werte größer 0

# Spalten auswählen
df[df['W']>0][['X', 'Y', 'Z']]  # Ausgabe der drei Spalten X-Z

# Filter kombinieren
df[(df['W']>0) & (df['Y']>1)]   # UND - Ausgabe der Zeilen, bei denen W>0 und Y>1 ist
df[(df['W']>0) | (df['Y']>1)]   # ODER - Ausgabe mit mit der logischen Verknüpfung oder
```

###### Index
```python
# Index vorausstellen
df.reset_index()                # stellt dem vorhandenen Index einen weiteren/neuen Index vorran

# Index wechseln
df.set_index('Staaten', inplace = true) # Spalte Staaten wird neuer Index
```

###### Multiindex
```python
aussen = ['Gruppe 1', 'Gruppe 1', 'Gruppe 1', 'Gruppe 2', 'Gruppe 2', 'Gruppe 2']
innen = [1, 2, 3, 1, 2, 3]

# Kombination von aussen und innen [('Gruppe 1', 1), ('Gruppe 1', 2), ... ('Gruppe 2', 3)]
hier_index = liste(zip(aussen, innen))

# Multiindex erstellen
hier_index = pd.MultiIndex.from_tuples(hier_index)

# Erstellen einer Matrix mit 6 Zeilen und 2 Spalten mit definiertem Index und den Spaltenüberschriften A und B
df. DataFrame(np.random.randn(6, 2), index = index_hier, columns = ['A', 'B'])

# Auswahl und bedingte Auswahl
df.loc['Gruppe 1'].loc[2]       # Auswahl anhand der 2 Indizes

# Indexüberschrift
df.index.names = ['Gruppe', 'Num']

# Auswahl einer Gruppe/Untergruppe
df.xs('Gruppe 1')               # Auswahl der Gruppe
df.xs('Gruppe 1', 1)            # Auswahl der Gruppe und Untergruppe
df.xs('1', level = 'Num')       # Auswahl einer Untergruppe mit Namen
```

###### Verlorene Daten - Eliminierungsverfahren
```python
# Erstellung einer Matrix mit fehlenden Daten
df = pd.DataFrame({'A':[1, 2, np.nan], 'B':[5, np.nan, np.nan], 'C':[1, 2, 3]})

df. dropna()                    # Entfernen aller Dtaensätze mit NaN Zellen
df.dropna(axis = 1)             # vollständie Achsen
df.dropna(thresh = 2)           # entf. v. Datensätzen mit 2 fehlerhaften Einträgen

df.fillna(value=0)              # fehlerhafte Einträge durch 0 ersetzen
df['A'].fillna(value = df['A'].sum ())  # fehlerhafte Einträge durch Summe ersetzen
```

###### Group By
```python
# DataFrame erstellen
data = {'Firma':['GOO', 'GOO', 'MS', 'MS', 'FB', 'FB'],
        'Person':['SAM', 'Tom', 'Anne', 'Ben', 'Amy', 'Karl'],
        'Sales':[200, 120, 340, 124, 243, 350]}
df = pd.DataFrame(data)

# Gruppieren von Gruppen nach Firma
df.groupby('Firma').mean()      # Durchschnitt, sum() - Summe, .std() - Standardabweichung, .min() - Minimum, .max() - Maximum, .count() - Anzahl

# Transportiert
df.groupby('Firma').min().transpose()

```

###### Concat, Merge, Join
```python
df1 = pd.DataFrame({'A':['A0', 'A1', 'A2'],
                    'B':['B0', 'B1', 'B2'],
                    'C':['C0', 'C1', 'C2']},
                    index = [0, 1, 2])
df2 = pd.DataFrame({'A':['A3', 'A4', 'A5'],
                    'B':['B3', 'B4', 'B5'],
                    'C':['C3', 'C4', 'C5']},
                    index = [3, 4, 5])

# Concat der zwei Frames
pd.concat([df1, df2])           # axis = 0
pd.concat([df1, df2], axis = 1) # axis = 1

# Merge von 2 Frames
pd.merge(df1, df2, how = 'inner', on 'key')     # Besteht ein Kex oder gleicher Index, können über diesen die zwei Frames verbunden werden (how kann auch 'outer', 'left' oder 'right' enthalten)

# Join
df1.join(df2)                   # (rechts, how = 'outer'), Std. ist 'inner'
```

#### Operationen

###### Unique
```python
df['col'].unique()              # Ausgabe der unique Werte
df['col'].nunique()             # die Anzahl alle einzigartigen Werte der Spalte werden ausgegeben
df['col'].value_counts()        # Anzahl von Wertin in Spalte
new_df = df[(df['col']>2 & (df['col2']==444))]
```

###### Funktionen anwenden
```python
def mal2(x):
        return x * 2
df['col'].apply(mal2)           # wirken der Funktion mal2 auf alle Elemente, Funktionen: len
```

###### Lambda-Funktionen anwenden
```python
df['col'].apply(lambda x: x * 2)
```

###### Sort by Value
```python
df.sort_value(by = 'col')       # Sortiert nach Spalte (kann auch als inplace = true gespeichert werden)
```

###### Is Null
```python
df.isnull()                     # Boolean - ausgabe von true/false wenn 0
df.dropna()                     # Nollwerte entfernen
df
```

#### Pivot

```python
data = {'A':['foo', 'foo', 'foo', 'bar', 'bar', 'bar'],
        'B':['one', 'one', 'two', 'two', 'one', 'one'],
        'C':['x', 'y', 'x', 'y', 'x', 'y'],
        'D':[1, 3, 2, 5, 4, 1]}

df = pd.DataFrame(data)

# Pivot-Tabelle mit Werten aus Spalte D (1-5)
df.pivot_table(values='D', index=['A', 'B'], columns='C')       
```

### CVS, Excel und SQL
Installation der Module sqlalchemy, lxml, html5lib und BeautifulSoap4 durch die folgenden Kommandos:
`conda install sqlalchemy`, `conda install lxml`, `conda install html5lib` und `conda install BeautifulSoup4`.

```python
import nympy as np
import pandas as pd

pwd                             # Verzeichnis ausgeben

df = pd.read_csv('examlpe.cvs') # lesen und übergeben der CSV-Datei
df.to_cvs('save_example.csv')   # speichern des DataFrame in eine CSV-Datei

df = pd.read_excel('excel_sample.xlsx', sheetname='Tabelle1') # lesen und übergeben der Excel-Datei
df.to_excel('save_excel.xlsx', sheet_name='Tabelle1')   ' speichern des DataFrame in eine Excel-Datei

df = pd.real_html('http://www.site.com')        # Auslesen einer HTML <Table> und Speicherung
type(df)                        # wenn df eine Liste ist, kann es ausgegeben werden
df[0]                           # Ausgabe der ersten Tabelle
df[0].head()                    # Ausgabe der ersten Datensätze

from sqlalchemy import create_engine
engine = create_engine('sqlite:///localhost:80')

sql_df = pd.read_sql('Daten', engine)   # Tabelle Daten der SQL-Datenbank auslesen
df.to_sql('Daten', engine)      # Tabelle Daten der SQL-Datenbank beschrieben
```
