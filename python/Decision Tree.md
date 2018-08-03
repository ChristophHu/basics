# Python

## Decision Tree (Entscheidungsbäume)

### Erstes Beispiel
Am Beispiel wurde gegeben, in dem wöchentlich ein Tennistraining abgehalten werden soll. Ein eingeladener Freund kommt oder kommt nicht. In Abhängigkeit von verschiedenen Parametern soll nun ermittelt werden ob er kommt oder nicht. 
Parameter: Temperatur, Bewölkung, Luftfeuchtigkeit und Wind -> Spiel kommt zustande

Nach einigen Datensätzen können Wahrscheinlichkeiten berechnet werden. Dazu nutzt man Entscheidungsbäume mit Knoten und Blättern. Die Blätter geben dabei das Ergebnis zum Spiel aus. Besteht ein besonders starker Parameter (Feature), so wird der Baum zwangsläufig diesen Parameter als Wurzel wählen. Damit werden alle Bäume sehr ähnlich. Durch die Random Forest - Methode wird eine zufällige Wurzel bei mehreren Durchgängen gewählt. Das Ergebnis wird somit "korreliert".

### Vorgehen


### Durchführung
Die Durchführung soll nun an einem medizinischen Beispiel erfolgen, welches eine Entscheidung über einen Eingriff trifft, ob dieser durchgeführt werden soll oder nicht.

#### Allg. Import
```python
import pandas as pd
import numpy as np
import matplotlib as plt
import seaborn as sns
%matplotlib inline
```

#### Daten einlesen
```python
df = pd.read_csv(kyphosis.csv)
```

#### Daten sichten
```python
df.head()                           # Ausgabe der ersten 5 Datensätze mit Header
                                    # Features: Alter, Nummer von Halswirbeln, Erster Halswirbel

```
