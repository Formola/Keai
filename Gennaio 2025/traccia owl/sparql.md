# Query sparql wine

a. Scelta una classe C, una data property P ed un Literal L, ricercare tutte le
istanze di C in cui è applicata P e in cui P assume un valore L.

```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX wine: <http://www.w3.org/TR/2003/PR-owl-guide-20031209/wine#>

SELECT ?wine ?price
    WHERE { ?wine wine:hasPrice ?price }
```

b. Ricerca tutte le istanze della classe “Wine”

```sparql
SELECT ?wine
 WHERE { ?wine rdf:type wine:Wine }
```

c. Ricercare il numero dei vini che hanno come “VintageYear” il 1977

```sparql
SELECT (COUNT(?wine) as ?countWine)
 WHERE { 

 ?wine wine:hasVintageYear ?vintageYear.
 ?vintageYear wine:yearValue 1977 

}
```

d. Ricercare (tutti i vini provenienti da una “ItalianRegion” AND il cui colore è
“Rose”) OR (tutti i vini provenienti da “ChiantiRegion”)

```sparql
SELECT ?wine
 WHERE { 
  {
  ?wine wine:locatedIn wine:ItalianRegion . 
  ?wine wine:hasColor wine:Rose
  }

  UNION

  {
  ?wine wine:locatedIn wine:ChiantiRegion
  }

}
```

e. Data una Object Property, ricercare il range ed il dominio

```sparql
SELECT ?domain ?range
WHERE {
    { wine:possesses rdfs:domain ?domain. } .
    { wine:possesses rdfs:range ?range. }
}
```
