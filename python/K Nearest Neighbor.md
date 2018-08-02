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
scaled_features = scaler.transform(df.drop('Target Class', axis=1)) ' transformierte Werte ohne die Spalte "Target Class"
```

### 4. ML
```python
df_features = pd.DataFrame(scaled_features, columns = df.columns[:-1])  # Dataframe ohne die letzte Spalte ("Target Class")

from sklearn.model_selection import train_test_split

X_train, y_train, X_test, y_test = train_test_split(scaled_features, df['Target Class'], test_size = 0.30)

from sklearn.neighbors import KNeighborClassifier

knn = KNeighborClassifier(n_neighbors=1)  # den nächsten Nachbarn finden
knn.fit(X_train, y_train)

predictions = knn.predict(X_test)

from sklearn.metrics import classification_report, confusion_matrix
print(confusion_matrix(y_test, predictions))  # Vergleich der Tests
print(classification_report(y_test, predictions))
```

### 5. Optimierung (Minimierung der Fehlerrate)
Eine Optimierung erfolgt über eine Fehlerrate. Diese wurden zuvor durch die Metrics ausgegeben. Wenn wir im Falle der KNearestNeighbors nun die Anzahl der `n_neighbors` variieren, können wir und die mit der geringsten Fehlerrate ermitteln.
```python
error_rate = []

for i in range[1, 40]:
  knn = KNeighborClassifier(n_neighbors = i)
  knn.fit(X_train, y_train)
  pred_i = knn.predict(X_test)
  error_rate.append(np_mean(pred_i != y_test))

plt.figure(figsize=(10,6))
plt.plot(range(1,40), error_rate, color = 'blue', linestile = ':', marker = 'o', markerfacecolor = 'red', markersize = 10)
plt.title('Rate of Error')
plt.xlabel('K-Neighbor')
plt.ylabel('Error_rate')
```
Eine anschließende Kontrolle eines ausgewählten n_neighbors mittels `confusion_matrix` und `classification_report` zeigt eine Steigerung von bis zu 5%.
