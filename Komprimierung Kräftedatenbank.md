# Kräftedatenbank

## Datenbank komprimieren und reparieren

### Grundlagen
Eine Komprimierung und Reparatur der Datenbank ist nötig um Beschädigung zu vermeiden und den Datenverlust zu beschränken. Dazu werden auch redundante Daten entfernt und eine korrekte Indexierung vorgenommen.

### Vorbereitung
Um eine Komprimierung und Reparatur der Datenbank durchzuführen, muss die Datenbank geschlossen sein um diese als einziger explizit zu öffnen.

### Durchführung
Um die Komprimierung und Reparatur durchzuführen, muss die Datenbank (_Daten_f_KraeftesteuerungV7-1.mdb_) unter dem Pfad: _\\map-file-0680\DirZA\Dir E St\St 1\St 11\St 113\St 1131 K\Kräftedatenbank\Kräftesteuerung\Daten für KräftesteuerungV7_ im **Bearbeitungsmodus** geöffnet werden.
Dieser Modus wird durch ein öffnen der Datei bei gedrückter `Shift`-Taste erzwungen. Ist die Datenbank geöffnet, erscheinen auf der Linken Seite die Tabellen, Abfragen und Makros. Diese bitte ich nicht zu öffnen ;)
In der oberen linken Ecke befindet sich die `Datei`-Schaltfläche. Hinter dieser befindet sich ein Menüpunkt `Verwalten`. Die erste angezeigte Option heißt `Datenbank komprimieren und reparieren`. Nach der Auswahl dieser Option wird die Datenbank komprimiert. Nach Abschluss dessen kann die Datenbank wieder geschlossen werden.