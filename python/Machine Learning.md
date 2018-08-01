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

### Allgemeiner Import (am Beispiel Titanic-Desaster)

#### Bibliotheken
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt       # zur Darstellung
import seaborn as sns                 # ebenfalls zur Darstellung
%matplotlib inline
```

#### Daten
```python
train = pd.read_csv('train.csv')      # laden der csv-Datei in ein DataFrame
```

### Allgemeiner Vergleich der Daten
```python
train.head()                          # Tabelle erster 5 Datensätze
train.columns                         # Spaltennamen als Array
train.info()                          # Einkommen, Hausalter, Räume, Schlafzimmer, Einwohner
train.describe()                      # Übersicht der Info nach count, mean, sdt, min..max

# Darstellung von Parametern
sns.pairplot(train)                   # alle Spalten werden gegenübergestellt (zur Interpretation)
sns.distplot(train['Price'])          # Ausprägung des Preises (Gaus-Normalverteilung) als Balkendiagramm
sns.heatmap(train.corr())             # Korrelation der Daten (Abhängigkeiten) in Form einer Heatmap
                                      # Bestehen Abhängigkeiten, kann ein Modell gebildet werden
                                      # (Alter, Sex, Klasse,...)
```

### Bereinigung (am Beispiel Titanic-Desaster)

#### Nullwerte berichtigen/beheben
Werte, die als 'NaN' gesetzt werden, können für das ML nicht berücksichtigt werden. Diese werden entfernt oder behoben. Um diese zu berücksichtigen, können sie mit einem Durchschnisstwert o.Ä. gesetzt werden. Der Durchschnittswert muss jedoch erst bestimmt werden.
```python
train.isnull()                        # Ausgabe von Null-Werten
sns.heatmap(train.isnull(), yticklabels = False, cbar = False, cmap = 'viridis')  # Ausgabe von Nullwerten in einer Heatmap

# Setzen des Alters in Abhängigkeit von der Klasse
def input_age(cols):
  age = cols[0]
  pclass = cols[1]
  if pd.isnull(age):
    if pclass = 1:
      return 37
    elif pcals = 2:
      return 29
    else:
      return 24
  else:
    return age
# Ende des def

train['Age'] = train[['Age', 'Pclass']].apply(input_age, axis = 1)  # Spalte 'Age' durch Funktion anpassen

sns.heatmap(train.isnull(), yticklabels = False, cbar = cmap = 'viridis') # Vergleich beider Heatmaps bez. Nullwerten
train.dropna(inplace = True)                  # Entfernen der Spalten mit Null-Werten (final)
train.drop('Cabin', axis = 1, inplace = True) # Entfernen der Spalte Kabine (final)
```
Datensätze mit Null-Werten werden gelöscht.

#### Normalisierung (Logisch)
Um mittels einer Spalte (Sex oder Embarked) das ML anzustoßen, müssen diese normalisiert werden. Der Dummy von 'Sex' enthält die Spalten male und female. Es genügt eine Spalte 'male' mit 1 und 0. Der Dummy von 'Embarked' enthält 3 Spalten Q=Queenstown, C=Cherbourg und S=Southampton mit 1 und 0. zwei Spalten genügen, denn wenn Q = 0 und C = 0, so muss es sich um S handeln.
```python
sex = pd.get_dummies(train['Sex'], drop_first=true)
embark = pd.get_dummies(train['Embarked'], drop_first=True)

train = pd.concat([train, sex, embark]) # Zusammenführen der Tabellen train, sex und embark
```
Es wurden die neuen Spalten an die Tabelle Train angefügt. Diese enthalten lediglich 1 und 0. Nicht auflösbare Spalten und bereits aufgelöste Spalten können entfernt werden.
```python
train.drop(['Sex', 'Embarked', 'Name', 'Ticket'], axis = 1, inplace = True)
```
Es bleiben lediglich numerische Werte enthalten.


### Linear Regression

#### Vorgehen
1. Import der Daten
2. Verglichen der Daten -> Korrelation/Abhängigkeit analysieren
3. Grunddaten analysieren (inkl. Verteilung)
4. Korrelation (Abhängigkeiten) analysiert
5. Trennung der Daten in Trainings- und Testdaten
6. Modell trainiert (per intercept_ und coef_)
7. Ergebnisse ausgeben 

#### Durchführung (am Beispiel einer Prognose der Kosten eines Hauskaufs)
```python
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
Ergebnis: YES|FN=5|TP=100|105
-|55|110|165

Berechnung der Fehlerverteilung: (FN + FP) / n = 15 / 165 = 0.09 - zu 9% wird ein falsches Ergebnis prognostiziert.
                                 (TN + TP) / n = 150 / 165 = 0.909 - zu ca. 91% wird ein korrektes Ergebnis vorhergesagt.

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

# weitere allg. Sichtung
sns.countplot(x = 'Survived', data = train) # Ausgabe/Gegenüberstellung Überlebender/nicht Überlebender
sns.countplot(x = 'Survived', hue = 'Pclass', data = train) # nach Klasse

# Cufflinks-Diagramme
import cufflinks as cf                  # import cufflinks zur Ansicht von Statistiken
cf.go_offline()                         # cufflinks für die offline-Ansicht
train['Fare'].iplot(kind='hist', bins=30, color='green')  # interaktives Diagramm mit Zoom

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(train.drop('Survived', axis=1), train['Survived'], test_size = 0.3, random_state = 101)


```
