#### Creare un ontologia dedicata ai libri.

- Creare le Classi Editore, Persona, Prodotto. Per Prodotto, creare le sottoclassi: Libro, Cd, Canzone. Per la Classe Persona, creare le sottoclassi: Autore, ScrittoreDiLibri. 

- Creare delle object Property: 

- - haAutore: lega un prodotto a una persona. impostare dominio e range. Crearne anche l'inversa èAutoreDi.
  
  - haCoAutore: lega due persone che lavorano insieme. Impostare come simmetrica tale proprietà. 
  
  - haPubblicato: lega un editore a un libro.

- Creare delle data property: 

- - èUnLetterato: lega una persona a un booelano. 
  
  - numeroPagine: lega un libro al suo numero di pagine intero. 
  
  - copieVendute: lega un libro al suo numero di copie vendute intero. 
  
  - genereLetterario: lega un libro a una stringa. 
  
  - èAutorevole: lega un editore a un booleano, indica se un editore è autorevole. 

- Popolare l'ontologia: 

- - Creare un libro "The_art_of_prolog" e assegnargli le data prop "copieVendute=200000", "numeroPagine=800", "genereLetterario=Mitologico".
  
  - Creare un libro "The_art_of_prolog2" e assegnargli le data prop "copieVendute=100000", "numeroPagine=850", "genereLetterario=Mitologico".
  
  - Creare un libro "Luger_AI" e assegnargli le data prop "copieVendute=500000", "numeroPagine=1400",  "genereLetterario=Mitologico". 
  
  - Creare un libro "Semantic_Web_Primer", e assegnargli le data prop "copieVendute=12000", "numeroPagine=600", "genereLetterario=Semantica"
  
  - Creare un editore "Pearson" e assegnargli come object property "haPubblicato" i due libri creati prima, inserire anche la data prop "èAutorevole" True. 
  
  - Creare degli individui Persona: Alfredo è autore di "the_art_of_prolog", Frank è autore di "Luger_AI", Saldang è autore di "the_art_prolog", Luigi è autore di "Semantic_Web_Primer". 

# Traccia Libri:

Estendere l’ontologia aggiungendo almeno un paio di object properties e data
properties, inserendo delle restrizioni (almeno un paio di Value Constraints e
Cardinality Constraints), e popolando l’ontologia con almeno 5 individui.

### Query Sparql

Effettuare le seguenti query SPARQL, fornendo una descrizione delle query e uno
snapshot dei risultati (ottenuti tramite Protegè):

a. Scelta una classe C, una data property P ed un Literal L, ricercare tutte le
istanze di C in cui è applicata P e in cui P assume un valore L.

![](/home/paolo/.config/marktext/images/2025-02-03-13-08-37-image.png)

b. Ricerca tutte le istanze della classe “Libro” che: (hanno "Saldang" come "Autore" ed almeno una pubblicazione con un editore) OR tutti i libri che hanno come genere letterario "Mitologico".

![](/home/paolo/.config/marktext/images/2025-02-03-13-13-29-image.png)

c. Ricercare il numero di libri presenti nell’ontologia.

![](/home/paolo/.config/marktext/images/2025-02-03-13-17-25-image.png)

d. Ricercare tutti i libri che contengono la stringa “The_art_of_prolog” nel nome.
Porre un limite a 1 risultato.

SELECT ?libro  
WHERE {  
  ?libro a libri:Libro .  
  FILTER(CONTAINS(STR(?libro), "The_art_of_prolog"))  
} 

![](/home/paolo/.config/marktext/images/2025-02-03-13-25-06-image.png)

e. Data una Object Property O, ricercare il range ed il dominio



SELECT ?domain ?range  
WHERE {  
    libri:haAutore rdfs:domain ?domain . 
    libri:haAutore rdfs:range ?range

} 



![](/home/paolo/.config/marktext/images/2025-02-03-13-20-47-image.png)

### Regole SWRL

1. Se un libro L è stato scritto dalla persona P, allora L ha come autore P. 
   
   Persona(?P) ^ èAutoreDi(?P, ?L) -> haAutore(?L,?P)

2. Se una Persona P ha scritto un libro L allora egli è un letterato. 
   
   Persona(?P) ^ èAutoreDi(?P, ?L) -> èUnLetterato(?P, true)

3. Se una Persona P ha scritto un libro L, allora è anche istanza della classe Autore e Scrittore di Libri. 
   
   Persona(?P) ^ èAutoreDi(?P,?L) ^ Libro(?L) -> ScrittoreDiLibri(?P)

4. Se un Libro L ha più di 300 pagine e ha venduto più di 10000 copie, ed è pubblicato da una fonte autorevole, allora è un best seller. 
   
   Libro(?L) ^ numeroPagine(?L, ?pagine) ^ swrlb:greaterThan(?pagine, 300)  ^ copieVendute(?L, ?copie) ^ swrlb:greaterThan(?copie, 10000) ^ haPubblicato(?E, ?L) ^ èAutorevole(?E, true) -> BestSeller(?L)

5. Se un autore A di un Libro L ha scritto un bestseller, allora A è uno scrittore Famoso. 
   
   Libro(?L) ^ haAutore(?L, ?P) ^ BestSeller(?L) -> ScrittoreFamoso(?P)

Dopodichè realizzare le seguenti Regole SWRL (fornire anche uno snapshot del risultato della
regola eseguita tramite Protegè):

a. Scegli o crea tre classi differenti, qui indicate in generale come A, B e C, e una object property P (Puoi usare quelle già presenti o che hai creato inprecedenza).
Scrivi una regola per cui se esiste la relazione P tra due individui di A e B, allora l’individuo di A appartiene anche alla classe C.
b. Scegli o crea tre classi differenti, qui indicate in generale come A, B e C, e due object properties P1 e P2 (Puoi usare quelle già presenti o che hai creato in precedenza).
Scrivi una regola per cui se esiste una relazione P tra due individui di A e B, allora esiste una relazione P2 tra individui di A e C.
c. Scegli o crea tre classi differenti, qui indicate in generale come A, B e una data property D1 (Puoi usare quelle già presenti o che hai creato in precedenza).
Scrivi una regola per cui se un individuo di A possiede la proprietà D, ed essa si trova in un range (a tua scelta), allora esso è individuo anche di B.
d. Se L è una Libro, se possiede come autore "Saldang", è pubblicato da "Pearson" ed è un bestseller, allora il libro L è anche un BestSeller. 
