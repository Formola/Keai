a. Scelta una classe C, una data property P ed un Literal L, ricercare tutte le
istanze di C in cui è applicata P e in cui P assume un valore L.

![](/home/paolo/.config/marktext/images/2025-02-01-23-23-03-image.png)

b. Ricerca tutte le istanze della classe “Pizza” per cui è stata scelta la base B ed
almeno un ingrediente di Tipo I OR tutte le pizze di tipo “SpicyPizza”.

**![](/home/paolo/.config/marktext/images/2025-02-01-23-33-03-image.png)**

****

c. Ricercare il numero delle pizze presenti nell’ontologia.

![](/home/paolo/.config/marktext/images/2025-02-01-23-34-02-image.png)

d. Ricercare tutte le pizze che contengono la stringa “margherita” nel nome.
Porre un limite a 2 risultati.

![](/home/paolo/.config/marktext/images/2025-02-01-23-49-29-image.png)

limit non funzioona su sto plugin e merd

e. Data una Object Property O, ricercare il range ed il dominio

![](/home/paolo/.config/marktext/images/2025-02-01-23-50-47-image.png)

## REGOLE SWRL

a. Scegli o crea tre classi differenti, qui indicate in generale come A, B e C, e una
object property P (Puoi usare quelle già presenti o che hai creato in
precedenza).
Scrivi una regola per cui se esiste la relazione P tra due individui di A e B,
allora l’individuo di A appartiene anche alla classe C.

Cliente(?a) ^ eats(?a, ?b) ^ Margherita(?b) ^ cooks(Porzio, ?b) -> PorzioEnjoyer(?a)

b. Scegli o crea tre classi differenti, qui indicate in generale come A, B e C, e due
object properties P1 e P2 (Puoi usare quelle già presenti o che hai creato in
precedenza).
Scrivi una regola per cui se esiste una relazione P tra due individui di A e B,
allora esiste una relazione P2 tra individui di A e C.

Cliente(?a) ^ eats(?a, ?b) ^ Pizza(?b) ^ isCookedBy(?b, ?c) ^ Pizzaiolo(?) -> likes(?a, ?c)

c. Scegli o crea tre classi differenti, qui indicate in generale come A, B e una data
property D1 (Puoi usare quelle già presenti o che hai creato in precedenza).
Scrivi una regola per cui se un individuo di A possiede la proprietà D, ed essa
si trova in un range (a tua scelta), allora esso è individuo anche di B.

Pizza(?pizza) ^ hasPrice(?pizza, ?price) ^ swrlb:greatherThan(?price, 10) -> PizzaCostosa(?pizza)

d. Se P è una Pizza, se possiede almeno un ingrediente di tipo “Mozzarella” ed
un ingrediente di tipo “Pomodoro” e la base è di tipo “DeepPanBase”, allora la
pizza è una margherita

Pizza(?p) ^ hasTopping(?p, ?m) ^ MozzarellaTopping(?m) ^ hasTopping(?p, ?pomodoro) ^ TomatoTopping(?pomodoro) ^ hasBase(?p, ?b) ^ DeepPanBase(?b) -> Margherita(?p)
