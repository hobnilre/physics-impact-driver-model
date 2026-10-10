# Modellering av ett enskilt slag i en mutterdragare

*Syntetiserade koefficienter, en okänd komponent i hammaren och COP*

Hob Nilre & Bo C. Herlin

[Läs artikeln](physics-impact-driver-model-sv.pdf) · [Manuskript](physics-impact-driver-model-sv.md) · [Engelskt original](../physics-impact-driver-model.pdf)

## Vad artikeln tillför och varför det spelar roll

Artikeln modellerar en enda kollision mellan hammare och städ mot ett åtdraget
förband. Den konstruerar vridmomentskoefficienter för tredje- och fjärdederivator
och behandlar deras bidrag som en okänd komponent inne i hammaren. Vanliga
linjära och olinjära kontakter används som jämförelser. Integraler av vridmoment
gånger vinkelhastighet, med bibehållet tecken, ger städets mottagna arbete,
arbetet till förbandet, den okända komponentens arbete och skenbar COP.

En separat ordningsjämförelse förklarar varför fjärde ordningen återger drag i
kollisionen som skalära modeller av lägre ordning missar. Genomräknade slag
visar hur avgivet arbete kan förstärka återstudsen eller nå förbandet, inklusive
ett angivet fall med skenbar COP över ett. Randvillkor, förberedda tillstånd av
högre ordning, kontaktens separation och en växande mod ingår i tolkningen.

Konstruktionen och energikonventionen följer två referensartiklar:

- [ODE Coefficient Synthesis](https://github.com/hobnilre/physics-ode-coefficient-synthesis)
- [Energy Ledgers for Forced Harmonic ODEs](https://github.com/hobnilre/physics-ode-energy)
