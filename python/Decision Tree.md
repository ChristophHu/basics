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
                                    # Features: Kyphosis, Alter, Nummer von Halswirbeln, Erster Halswirbel
df.info()                           # Anz. Datensätze, ...
sns.pairplot(df, hue = 'Kyphosis')  # Gegenüberstellen der Spalten bez. Kyphosis
```

#### Modell bilden
```python
from sklearn.model_selection import train_test_split
X = dfdrop('Kyphosis', axis = 1)    # Features
y = df['Kyphosis']                  # Labels

X_train, y_train, X_test, y_test = train_test_split(X, y, test_size = 0.30)

from sklearn.tree import DecisionTreeClassifier
dtree = DecisionTreeClassifier()
dtree.fit(X_train, y_train)

predictions = dtree.predict(X_test)

from sklearn.metrics import classification_report, confusion_matrix

print(classification_report(y_test, predictions))
print(confusion_matrix(y_test, predictions))
```

#### Visualisierung mit ipython

