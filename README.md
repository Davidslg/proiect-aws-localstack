# Arhitecturi Cloud cu Amazon Web Services
## Validare practica prin LocalStack - Amazon SQS

### Descriere
Acest proiect demonstreaza functionarea serviciului Amazon Simple Queue Service (SQS) intr-un mediu AWS emulat local, folosind LocalStack.

Scenariul ales este procesarea comenzilor unui magazin online. O comanda este trimisa intr-o coada SQS, apoi este receptionata si stearsa dupa procesare.

### Tehnologii utilizate
- Amazon SQS
- LocalStack
- Docker Desktop
- AWS CLI
- Bash

### Cerinte pentru rulare
- Docker Desktop pornit
- LocalStack CLI (`lstk`) instalat si configurat
- AWS CLI instalat

### Instructiuni de rulare
1. Porniti Docker Desktop.
2. Porniti LocalStack folosind comanda `lstk start`.
3. Deschideti Terminalul in folderul proiectului.
4. Executati:

```bash
bash demo.sh
```

### Ce face scriptul
1. Creeaza coada SQS `comenzi-magazin`.
2. Trimite mesajul `Comanda 101: laptop, cantitate 1`.
3. Receptioneaza mesajul din coada.
4. Sterge mesajul dupa procesare.

### Concluzie
Testul demonstreaza functionarea Amazon SQS in LocalStack, fara utilizarea resurselor AWS reale.
