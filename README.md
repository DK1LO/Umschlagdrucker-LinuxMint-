# DK1LO Umschlagdrucker

Native C-Anwendung für Umschläge unter Linux Mint 22.x. Adressen bleiben lokal. PDF entsteht mit Cairo/Pango und Druck läuft über CUPS `lp`. Kennzeichnung: (C)DK1LO.

## Installation und Build

```sh
sudo apt install build-essential cmake pkg-config libgtk-3-dev libcairo2-dev libpango1.0-dev fonts-dejavu cups
cmake -S c-version -B c-version/build
cmake --build c-version/build
./start-c.sh
```

`start-c.sh` prüft vor dem Start Compiler, CMake, Bibliotheken, CUPS, Schrift und Programmdatei.

Die C-Version bietet DL, C6, C5 und C4. Formatwahl setzt Seitenmaß, PDF und Vorschau gemeinsam. Der konkrete Druckertreiber muss die jeweilige CUPS-Größe (`EnvDL`, `EnvC6`, `EnvC5`, `EnvC4`) anbieten.

## Druck

Drucker über „Drucker laden“ wählen. Die App nutzt unverändert `PageSize=EnvDL`, `InputSlot=ByPassTray`, `MediaType=Envelope`, `print-scaling=none`, `sides=one-sided`. CUPS-Annahme ist nicht gleich physischer Abschluss.

Einlegen: schmale 110-mm-Kante zuerst, Adressseite oben, Klappe rechts.

## Einstellungen

`~/.config/dl-umschlagdrucker/config.json` speichert Drucker, Adressen, Positionen, Größen und Exemplare. Positionen gelten in mm ab links/oben. PDF und Vorschau nutzen dieselben Koordinaten.

## C-Version ohne Qt

Die native C-Version liegt unter `c-version/`. Das Programm heißt `dk1lo-umschlagdrucker`. Sie nutzt GTK3, Cairo/Pango und startet CUPS über `lp` ohne Shell. Bauen:

```sh
cmake -S c-version -B c-version/build
cmake --build c-version/build
./start-c.sh
```

Benötigte Mint-Pakete:

```sh
sudo apt install build-essential libgtk-3-dev libcairo2-dev libpango1.0-dev fonts-dejavu cups
```

