# Machine Learning (maschinelles Lernen)

Eine Methode der Datenanalyse, die die Bilduing von analytischen Modellen automatisiert.

Aud der Seite [www-bcf.usc.edu](www-bcf.usc.edu) - "An Introduction to Statistical Leraning" frei zum Download.

## Beispieldaten
[Kaggle](www.kaggle.com)

## Grundlagen

### Anwendungsgebiete

* Betrugserkennung (ist eine Kreditkarte gestohlen?),
* Ergebnisse von Websuchen,
* Echtzeit Werbung (dieses Buch könnte sie auch interessieren),
* Scoring der Kreditwürdigkeit,
* Neue Preicing-Modelle,
* Erkennung von Netzwerk-Eindringlingen,
* Empfehlungssysteme,
* Kundensedimentierung,
* Spam-Filter,
* Muster- und Bilderkennung,
* Finanzmodelle
* Analyse von Stimmungen in Texten,...

### Machine Learning Prozess

Daten Aquisition > Daten bereinigen > Modell Training > Modell Tests > Modell Einsatz

### Machine Learning Algorithmen
3 Arten von Machine Learning:
* Supervised Learning (gekennzeichnete Daten (Mail ist Spam)),
* Unsupervised Learning (keine Kennzeichnung, aber Hinweise in Daten),
* Reinforcement Learning (Erfahrung sammeln um Aufgaben auszuführen -> durch Algorithmen).


## Machine Learning in Python

### Das Scikit Learn Paket

#### Installation
Mit dem Kommando `conda install scikit-learn` kann das Paket nachinstalliert werden.

#### Import des Paketes
```python
from sklearn.family import Modell     # Allgemeiner Import des Paketes
#from sklearn.linear_model import LinearRegression
```

### Linear Regression

#### Vorgehen
1. Daten aufnehmen
2. Daten verglichen
3. Grunddaten analysieren (inkl. Verteilung)
4. Korrelation (Abhängigkeiten) analysiert
5. Trennung der Daten in Trainings- und Testdaten
6. Modell trainiert (per intercept_ und coef_)
7. Ergebnisse ausgeben 

#### Durchführung (am Beispiel einer Prognose der Kosten eines Hauskaufs)
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt       # zur Darstellung
import seaborn as sns                 # ebenfalls zur Darstellung
%matplotlib inline

# die Daten
USAhousing = pd.read_csv('USAhousing.csv')  # laden der csv-Datei in ein DataFrame
USAhousing.head()                     # Tabelle erster 5 Datensätze
USAhousing.info()                     # Einkommen, Hausalter, Räume, Schlafzimmer, Einwohner
USAhousing.describe()                 # Übersicht der Info nach count, mean, sdt, min..max
USAhousing.columns                    # Spaltennamen als Array

# Darstellung von Parametern
sns.pairplot(USAhousing)              # alle Spalten werden gegenübergestellt (zur Interpretation)
sns.distplot(USAhousing['Price'])     # Ausprägung des Preises (Gaus-Normalverteilung) als Balkendiagramm
sns.heatmap(USAhousing.corr())        # Korrelation der Daten (Abhängigkeiten) in Form einer Heatmap
                                      # Bestehen Abhängigkeiten, kann ein Modell gebildet werden

# Lineare Regression (der Preis soll vorhergesagt werden)
X = USAhousing(['Avg. Area Income', 'Avg. Area House Age',...])
y = USAhousing('Price')               # 

from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=101) # testdaten=40%

from sklearn.linear_model import LinearRegression
lm = LinearRegression()
lm.fit(X_train, y_train)              # trainieren des Modells
lm.coef_                              # Koefizienten
coef_df = pd.DataFrame(lm.coef_,X.columns=['Koeffizienten'])
coef_df                               # Ausgabe des Dataframe mit den Koeffizienten nach Parameter
                                      # alle Werte beziehen sich auf die Steigerung des Preises nach Einheit

# Vorhersage des Modells berechnen
predictions = lm.predict(X_test)      # Nutzung der Testdaten
predictions                           # Ausgabe (Array)
plt.scatter(y_test, predictions)      # Vergleich der y_test-Daten mit den Predictions
                                      # die Differenz (y_test - predictions) zeigt die Zuverlässigkeit an

sns.distplot(y_test - predictions)    # Ausgabe der DIfferenz

# Berechnung der Abweichungen - mean error
from sklearn import metrics
metrics.mean_absolute_error(y_test, predictions)  # MAE - mean absolute error
metrics.mean_squared_error(y_test, predictions)  # MSE - mean squared error
np.sqrt(metrics.mean_squared_error(y_test, predictions))  # RMSE - root mean absolute error
```

### Verzerrung/Varianz (Biaz/Variance)
Im sinne einer Zielscheibe, werden mit der Verzerrung und Varianz die Genauigkeit eines Modells bestimmt. Ein Modell mit einer hohen Verzellrung und einer hohen Varianz ... Ziel ist es eine nidrige Verzerrung und eine nidrige Varianz (im Ziel) zu erreichen.

Mittels der Berechnungen von Abweichungen in Abhängigkeit von der Komplexität, ist zu erkennen welches Modell oder welche Komplexität die  geringste Abweichung enthält.

### Logistic Regression
Bei der Logistic Regression handelt es sich um eine binäre (ja/nein) Klassifikation. Eine Lineare Regression würde in diesem Fall nicht greifen, da Wertegruppen nur 0 und 1 enthalten. Eine lineare Funktion kann dies nicht abbilden. Die Logistische Funktion gibt eine Wahrscheionlichkeit zwischen 0 und 1 aus (0,5 = 1, 0,4 = 0).

#### Einsatzgebiete
* Erkennen von Spam-EMails,
* Kreditausfall (ja/nein),
* Krankheitsdiagnose.

#### Konfusionsmatrix
Die Konfusionsmatrix gibt eine Aussage zur Genauigkeit eines Modells wieder. Dieses stellt die Vorhersage den eigentlichen Ergebnissen gegenüber. Dabei kann die Verhersage dem Ergebnis entsprechen (True=T, Ergebnis ist positiv (P) oder negativ (N)) oder die Vorsage entspricht nicht dem Ergebnis (False=F) und das Modell ist Falsch!

n=165|Vorhersage: NO|Vorhersage: YES|-
---|---|---|---
Ergebnis: NO|TN=50|FP=10|60
Ergebnis: YEA|FN=5|TP=100|105
-|55|110|165

Berechnung der Fehlerverteilung: (FN + FP)/n = 15 / 165 = 0.09 - zu 9% wird ein falsches Ergebnis prognostiziert.
                                 (TN + TP)/n = 150 / 165 = 0.909 - zu ca. 91% wird ein korrektes Ergebnis vorhergesagt.

#### Vorgehen

#### Durchführung
www.kaggle.de - Titanic-Daten
```python
# Import der Datem
train = pd.read_csv("titanic_train.csv")

# Sichtung der Daten/Informationen
train.head()                            # Ausgabe der ersten 5 Datensätze
train.info()                            # Informationen zu Spalten
train.describe()                        # Informationen zu Spalten
train.columns()                         # Ausgabe der Spalten in einem Array

# Bereinigung / Sichtung von NULL-Werten
sns.heatmap(train.isnull(), yticklabels = False, cbar = False, cmap = 'viridis')  # Ausgabe der Nullwerte als Diagramm
sns.distplot(train['Age'].dropna(), kde = False, bins = 30) # NULL-Werte der Spalte Age nicht betrachten -> .dropna()

# weitere allg. Sichtung
sns.countplot(x = 'Survived', data = train) # Ausgabe/Gegenüberstellung Überlebender/nicht Überlebender
sns.countplot(x = 'Survived', hue = 'Pclass', data = train) # nach Klasse
```
