## K Nearest Neighbor

### Beispiel (Pferd/Hund)
Es existieren Daten zu Pferden und Hunden. In Abhängigkeit von Größe und Gewicht kann bestimmt werden ob es sich um ein Pferd oder einen Hund handelt. Dabei werden nach Angabe von Parametern die nächsten Nachbarpunkte berechnet. Dabei kann die Genauigkeit durch einbeziehen mehrerer Nachbarn erhöht werden.

### Vorgehen
1. Libaries importieren,
2. Daten einlesen
3. Standardisieren der Daten

### 2. Daten einlesen
```python
df = pd.read_csv("Data.csv", index_col = 0) # Erste Spalte als Index nutzen, wenn in der csv vorhanden
```

### 3. Standardisieren der Daten
Um die Daten vergleichbar zu machen müssen diese standardisiert werden. So ist die Einwirkung der Entfernung von Städten (in Metern) größer als die Anzahl von Monaten im Jahr. Diese Einwirkung muss gleichgesetzt werden.
```python
from sklearn.preprocessing import Standardscaler
scaler = Standardscaler()

scaler.fit(df.drop('Target Class', axis=1)) # auf Spaltenebene die Target Class entfernt
scaled_features = scaler.transform(df.drop('Target Class', axis=1))
```
