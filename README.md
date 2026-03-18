![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Windows Support](https://img.shields.io/badge/Windows-10%2F11-blue)
![Category](https://img.shields.io/badge/Category-System%20Repair-orange)
![Community](https://img.shields.io/badge/Community-AngoloDiWindows-0078d4)

# Windows Update & Network Reset Tool
**Un utility batch per ripristinare i componenti di Windows Update e ottimizzare la rete.**

Questo script è stato progettato per risolvere i problemi comuni di aggiornamento e connettività su Windows 10 e Windows 11. È una risorsa ufficiale della community di [angolodiwindows.com](https://www.angolodiwindows.com).

---

## 🚀 Funzionalità principali

### 1. Reset di Windows Update
* Arresta i servizi critici (`wuauserv`, `bits`, `cryptsvc`).
* Svuota la cache della cartella `SoftwareDistribution` (dove spesso risiedono file di aggiornamento corrotti).
* Rigenera la cartella `Catroot2`.
* Pulisce i log di errore del database `DataStore`.

### 2. Ottimizzazione e Reset della Rete
* Disabilita le euristiche TCP per una connessione più stabile.
* **Opzionale:** Gestione manuale di **Receive Side Scaling (RSS)** e **Autotuning**.
* Reset completo dello stack **Winsock** e **TCP/IP**.
* Flush del resolver DNS e rinnovo dell'indirizzo IP.

---

## 💻 Come utilizzare lo script

1. **Scarica il file:** Scarica il file `reset_system.bat` da questo repository.
2. **Esecuzione:** Fai doppio clic sul file. Lo script richiederà automaticamente i **privilegi di Amministratore** necessari per operare sui servizi di sistema.
3. **Interattività:** Segui le istruzioni a schermo. Potrai scegliere se eseguire il reset completo o solo le operazioni base.
4. **Riavvio:** Al termine delle operazioni, è caldamente consigliato riavviare il PC.

---

## ⚠️ Disclaimer (Leggere attentamente)

> [!CAUTION]
> Questo strumento modifica impostazioni di sistema e arresta servizi di rete. Sebbene sia sicuro nella maggior parte dei casi, l'autore non si assume alcuna responsabilità per eventuali malfunzionamenti derivanti dall'uso improprio dello script. Utilizzalo a tuo rischio.

---

## 🤝 Contributi e Supporto

Se trovi un bug o hai suggerimenti per migliorare lo script:
* Apri una **Issue** qui su GitHub.
* Visita il sito [Angolo di Windows](https://www.angolodiwindows.com) per guide dettagliate.
* Unisciti alla discussione sul nostro subreddit ufficiale.

---

## 📄 Licenza
Questo progetto è rilasciato sotto licenza MIT. Sei libero di usarlo, modificarlo e distribuirlo citando la fonte originale.
