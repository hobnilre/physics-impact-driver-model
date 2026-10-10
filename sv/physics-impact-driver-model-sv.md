---
title: "Modellering av ett enskilt slag i en mutterdragare"
subtitle: "Syntetiserade koefficienter, en okänd komponent i hammaren och COP"
author: "Hob Nilre & Bo C. Herlin"
date: "2026-10-10"
lang: sv
abstract: |
  En roterande hammare träffar ett städ mot ett åtdraget förband. Vi
  syntetiserar koefficienter för tredje- och fjärdederivator och tillskriver
  deras vridmoment en okänd komponent inne i hammaren. Integraler av
  vridmoment gånger vinkelhastighet, med bibehållet tecken, ger det arbete
  som komponenten avger eller tar emot samt skenbara prestandafaktorer (COP).
  En separat ordningsjämförelse visar hur en skalär ekvation av fjärde
  ordningen återger båda moderna i en vanlig kollision mellan två
  roterande kroppar. I beräknade slag med 28,8 J ingående rörelseenergi
  överför den vanliga linjära modellen netto 2,43 J till städet; en angiven
  hammarmodell av fjärde ordningen överför 2,91 J. När dess vikt för
  fjärdederivatan fördubblas blir arbetet 35,39 J och städets skenbara COP
  1,229, samtidigt som en växande mod uppträder under kontakt. Återstuds,
  arbete till förbandet och energiposten vid separation sluter den ordinära
  energibalansen; den okända komponentens övriga energibalans är en fråga
  för mätning.
keywords:
  - mutterdragare
  - koefficientsyntes
  - ordinära differentialekvationer av högre ordning
  - okänd komponent i hammaren
  - arbete med bibehållet tecken
  - skenbar prestandafaktor
---

\begingroup\scriptsize
\noindent PDF created: \pdfbuildtimestamp\par
\noindent Latest on GitHub: \url{https://github.com/hobnilre/physics-impact-driver-model}\par
\endgroup

Svensk översättning av [*Modeling a Single Rotary Impact*](https://github.com/hobnilre/physics-impact-driver-model/blob/main/physics-impact-driver-model.md).

# Ett slag

Intervallet vi studerar börjar när en roterande hammare träffar ett städ
och slutar när de separerar. Det åtdragna fästelementet vrids inte vidare
makroskopiskt, men städet, hylsan och förbandet kan vridas elastiskt. Den
rörelsen avgör hur mycket arbete som når förbandet och hur mycket som
återförs till hammaren.

Vi lägger till vridmomentstermer med tredje- och fjärdederivator, konstruerade
med hjälp av [*ODE Coefficient Synthesis* (Nilre och Herlin, 2026a)][synthesis].
I enlighet med [*Energy Ledgers for Forced Harmonic ODEs* (Nilre och Herlin,
2026b)][energy] antar vi att dessa termer tillhör en okänd komponent inne i
hammaren. Tecknet på dess effekt avgör om den avger eller tar emot arbete.
Komponentens fysiska identitet, kapacitet och förberedelse är öppna delar
av hypotesen.

Låt $\theta_h,\theta_a$ vara hammarens och städets vinklar, mätta från
kontaktens början, $\omega_h=\dot\theta_h$, $\omega_a=\dot\theta_a$, och
$\delta=\theta_h-\theta_a$ kontaktdeformationen. De explicit modellerade
tröghetsmomenten är $J_h,J_a>0$. Ett positivt kontaktmoment $\tau_c$ motverkar
hammarens framåtrörelse och driver städet. Under kontakt gäller
\begin{equation}
\begin{aligned}
J_h\ddot\theta_h+\tau_c+\tau_X&=\tau_d,\\
J_a\ddot\theta_a&=\tau_c-\tau_j,\\
\tau_j&=k_j\theta_a+c_j\omega_a,\\
\tau_X&=B_3\theta_h^{(3)}+B_4\theta_h^{(4)}.
\end{aligned}
\label{eq:model}
\end{equation}
Här är $\tau_d$ ett yttre vridmoment på hammaren. Hylsan och det åtdragna
förbandet representeras tillsammans av $k_j,c_j>0$, med fast referens för
förbandet. Det okända momentet verkar vid hammarens koordinat, så dess
effekt beräknas med $\omega_h$. Figur \ref{fig:ports} visar var dessa
energiöverföringar hör hemma.

![Schematisk bild av modellen för ett slag. Kontakten överför arbete vid två olika vinkelhastigheter. Den okända komponenten ligger innanför hammarens systemgräns; positivt $P_X$ går in i dess energikonto. Förbandets referens är fast.](figures/impact-ports.pdf){#fig:ports width=100%}

\FloatBarrier

I referensjämförelsen är $\tau_d=0$, båda vinklarna är noll från början,
$\omega_h(0)=600\ \mathrm{rad\,s^{-1}}$, och $\omega_a(0)=0$. De elastiska
energilagren är från början noll i denna inkrementella modell. Motorns
föregående uppvarvning representeras av hammarens ingående rörelseenergi.

# Koefficienter och kontakt

För en positiv referenstrippel för rotation $(J_*,c_*,k_*)$ är
koefficientfamiljen
\begin{equation}
A_{r,n}=J_*^{n-1+r}c_*^{2-n-2r}k_*^r,
\qquad r\in\mathbb Z,\quad n\geq0.
\label{eq:family}
\end{equation}
Derivataordningen anges av $n$; heltalet $r$ väljer ett dimensionellt
tillåtet monom. Referensartikelns trappsteg
$r_n=1-\lceil n/2\rceil$ ger
$A_0=k_*$, $A_1=c_*$, $A_2=J_*$,
$A_3=J_*c_*/k_*$ och $A_4=J_*^2/k_*$
([Nilre och Herlin, 2026a][synthesis], avsnitt 1--4).
Vi sätter
\begin{equation}
B_3=w_3\frac{J_*c_*}{k_*},\qquad
B_4=w_4\frac{J_*^2}{k_*}.
\label{eq:weights}
\end{equation}
De dimensionslösa vikterna specificerar den föreslagna modellen. I exemplen
anger $(J_*,c_*,k_*)=(J_h,c_c,k_c)$ referensskalorna; hammarens explicit
modellerade tröghetsmoment förekommer fortfarande bara en gång i
\eqref{eq:model}.

Den vanliga linjära kontaktlagen är
\begin{equation}
\tau_c=k_c\delta+c_c\dot\delta.
\label{eq:linear}
\end{equation}
Fjäder–dämparkontakt som kopplas in och ur används i modeller av
mutterdragare ([ter Braack och Margolis, 2026][wrench]). Vi använder den
fram till kontaktmomentets första nollgenomgång från positivt till negativt
värde och sätter sedan $\tau_c=0$. Därmed fortsätter kontakten inte som en
dragkraft. Fjäderns kvarvarande energilager vid separationen redovisas nedan.

En olinjär jämförelse använder den deformationsberoende dämpningsformen hos
[Hunt och Crossley (1975)][hc]:
\begin{equation}
\tau_c=H\delta^{3/2}(1+\alpha\dot\delta),\qquad \delta\geq0.
\label{eq:nonlinear}
\end{equation}
Detta är en lokal rotationsapproximation av en kontakt av Hertztyp vid en
konstant hävarm $R$: förskjutningen $R\delta$ och vridmomentet $R F$ ger
$H=K R^{5/2}$ från en styvhetskoefficient $K$ i normalriktningen. Modellen
representerar denna antagna kontaktgeometri. Välj
$H=k_c/\sqrt{\delta_r}$ och $\alpha=c_c/(k_c\delta_r)$, med
$\delta_r=0{,}040\ \mathrm{rad}$. Det elastiska momentet och dämpningens
lutning sammanfaller då med \eqref{eq:linear} vid $\delta_r$. Separation
sker första gången $\delta$ återgår till noll;
$1+\alpha\dot\delta$ förblir positivt i samtliga redovisade beräkningar.

De vanliga jämförelsemodellerna sätter $B_3=B_4=0$. Den föreslagna
hammarmodellen av tredje ordningen sätter $(w_3,w_4)=(1/2,0)$, och modellen
av fjärde ordningen använder $(1/2,1/10)$, båda med \eqref{eq:linear}.
En känslighetsberäkning fördubblar $w_4$ till $1/5$. Dessa vikter är valda
för att illustrera modellen och har inte anpassats till mätningar eller
ett önskat COP. De kopplade modellerna av tredje och fjärde ordningen har
fem respektive sex rörelsetillstånd.

Högre ordning kräver fler begynnelsevärden. För exemplen med linjär kontakt
används
\begin{equation}
\ddot\theta_h(0)=-\frac{c_c\omega_h(0)}{J_h},\qquad
\theta_h^{(3)}(0)=0\quad\text{för fjärde ordningen}.
\label{eq:initial}
\end{equation}
Med dessa val är det okända momentet noll från början; den styrande
ekvationen bestämmer nästa derivata. Vid separationen är kropparnas
vinklar och vinkelhastigheter kontinuerliga, och den kontaktaktiverade
lagen av högre ordning upphör att gälla. Ändpunktsderivatorna i dess
arbetsintegral tas omedelbart före separationen. Den okända komponentens
tillstånd efter kontakten hör till dess återstående energiredovisning.

De tillagda termerna har både koefficienter och villkor för utgångstillståndet.
Enbart den ingående hastigheten bestämmer därför inte slaget i modellen
av högre ordning.

# Vad fjärde ordningen återger

Innan vi tolkar ett okänt bidrag är det användbart att fastställa varför
fjärde ordningen alls uppträder i en rotationskollision. Sätt
$\tau_X=\tau_d=0$ och använd den linjära kontakten. Om städets koordinat
elimineras ur de två vanliga ekvationerna fås den exakta ekvationen under
kontakt:
\begin{equation}
\begin{aligned}
J_hJ_a\theta_h^{(4)}
&+[J_h(c_c+c_j)+J_ac_c]\theta_h^{(3)}\\
&+[J_h(k_c+k_j)+J_ak_c+c_cc_j]\ddot\theta_h\\
&+(c_ck_j+c_jk_c)\dot\theta_h+k_ck_j\theta_h=0.
\end{aligned}
\label{eq:elimination}
\end{equation}
Division av \eqref{eq:elimination} med $k_*$ ger vridmomentsekvationens
enheter; koefficienterna kan då uttryckas som viktade medlemmar i
\eqref{eq:family}. De extra begynnelsevärdena bestäms av det eliminerade
städtillståndet. Denna skalära representation och den föreslagna komponenten
i \eqref{eq:model} har olika fysisk innebörd: den senare tillför ett nytt
vridmoment i de explicit modellerade tvåkroppsekvationerna.

Med parametrarna i tabell \ref{tab:parameters} har den vanliga
referensmodellen polerna $-159{,}414\pm5947{,}760\,\mathrm i$ och
$-21{,}836\pm1992{,}947\,\mathrm i$, i $\mathrm{s^{-1}}$.
Den har alltså två svängningsmoder. Vi anpassar stabila skalära ekvationer
av andra och tredje ordningen till hammarvinkel, kontaktmoment och effekt
på hammarsidan under hela kontaktintervallet. Varje signals residual
normaliseras med motsvarande referenssignals största absolutvärde, och
signalerna viktas lika. Anpassningen av andra ordningen har ett komplext
polpar; den tredje ordningen lägger till en reell pol. Båda behåller
begynnelsevinkel och begynnelsehastighet, och den tredje behåller även
begynnelseaccelerationen.

| Skalär ordning | Momentets NRMSE | Hammareffektens NRMSE |
|---------------:|----------------:|---------------------:|
| 2, anpassad | 30,53% | 25,67% |
| 3, anpassad | 30,42% | 25,61% |
| 4, exakt eliminering | $<10^{-10}\%$ | $<10^{-10}\%$ |

: Fel mot den vanliga syntetiska referensen under anpassningsintervallet.

Fjärde ordningen behåller den andra svängningsmoden och återger moment-
och effektpulsen. Att enbart lägga till en tredje derivata hjälper knappt
dessa anpassade modeller. Detta visar ordningsfördelen för den angivna
referensen; hypotesen om den okända komponenten i hammaren prövas nedan
genom sina egna förutsägelser.

# Arbete med bibehållet tecken och skenbar COP

Kontakten har två effektportar. Definiera, över hela kontaktintervallet
$[0,T]$,
\begin{equation}
\begin{aligned}
W_{hc}&=\int_0^T\tau_c\omega_h\,dt,&
W_{ca}&=\int_0^T\tau_c\omega_a\,dt,\\
W_j&=\int_0^T\tau_j\omega_a\,dt,&
W_X&=\int_0^T\tau_X\omega_h\,dt.
\end{aligned}
\label{eq:ports}
\end{equation}
Positivt $W_X$ innebär att den okända komponenten netto tar emot arbete;
negativt $W_X$ innebär att den netto avger arbete. Både framåtriktat och
återfört kontaktarbete behålls. Detta följer teckenkonventionen hos
[Nilre och Herlin (2026b)][energy], avsnitt 2, 4 och 5.

För konstanta $B_3,B_4$, skriv
$v=\dot\theta_h$, $a=\ddot\theta_h$ och $j=\theta_h^{(3)}$.
Partiell integration ger de exakta identiteterna
\begin{equation}
\begin{aligned}
W_3&=B_3[va]_0^T-B_3\int_0^T a^2\,dt,\\
W_4&=B_4[vj-\tfrac12a^2]_0^T,\qquad W_X=W_3+W_4.
\end{aligned}
\label{eq:higher-work}
\end{equation}
Tredjeordningstermen innehåller ett ändpunktsbidrag och en integral med
bibehållet tecken; fjärdeordningsarbetet är helt en ändpunktsskillnad.
Inget av tecknen kan bestämmas enbart från koefficienten. Ändpunktsuttrycket
för fjärde ordningen bestämmer överföringen utan att ange ett positivt
fysiskt energilager eller en mekanism för att återfylla det.

Låt $K_h=J_h\omega_h^2/2$, $K_a=J_a\omega_a^2/2$ och
$U_j=k_j\theta_a^2/2$. För linjär kontakt gäller
$U_c=k_c\delta^2/2$ och
$D_c=\int_0^T c_c\dot\delta^2\,dt$.
För \eqref{eq:nonlinear} ersätts dessa med
$U_c=2H\delta^{5/2}/5$ och
$D_c=\int_0^T H\alpha\delta^{3/2}\dot\delta^2\,dt$.
I båda fallen är $D_j=\int_0^T c_j\omega_a^2\,dt$. Multiplikation av
komponentlagarna med deras respektive hastigheter ger
\begin{equation}
\begin{aligned}
\Delta K_h&=W_d-W_{hc}-W_X,& W_d&=\int_0^T\tau_d\omega_h\,dt,\\
W_{hc}-W_{ca}&=\Delta U_c+D_c,\qquad&
W_{ca}&=\Delta K_a+W_j,\\
W_j&=\Delta U_j+D_j.
\end{aligned}
\label{eq:ledger}
\end{equation}
Dessa balanser följer direkt av de angivna momentlagarna.

Separationsregeln vid noll kontaktmoment kan lämna $U_c(T^-)>0$. När
kontaktfjädern tas bort tilldelas $Q_{\rm rel}=U_c(T^-)$ en separat
energipost för separationen, vars fysiska destination lämnas öppen.
Kropparna får ingen impuls vid denna händelse. Balansen efter separationen,
med $K_0=J_h\omega_h(0)^2/2$ och de angivna nollvärdena för städets
begynnelseenergi och de elastiska begynnelseenergierna, är
\begin{equation}
K_0+W_d-W_X=K_h(T)+K_a(T)+W_j+D_c+Q_{\rm rel}.
\label{eq:total}
\end{equation}
Kontaktens kvarvarande energilager räknas alltså en gång, som överföringen
vid separation. För den olinjära separationen vid noll deformation är
$Q_{\rm rel}=0$.

I enlighet med energiartikeln utesluts den okända komponentens konto från
den ordinära inenergi som räknas med. Med $I=K_0+W_d>0$ redovisas två
skenbara COP:
\begin{equation}
\boxed{\mathrm{COP}_{a}=\frac{W_{ca}}{I},\qquad
\mathrm{COP}_{j}=\frac{W_j}{I}.}
\label{eq:cop}
\end{equation}
Det första räknar städets mottagna nettoarbete. Det andra räknar arbetet
till det modellerade förbandets motstånd och fjäder, inklusive återvinningsbar
elastisk energi. Skillnaden är $\Delta K_a/I$. Vid bedömning av verklig
åtdragning skulle också den bestående åtdragningen och energikostnaden för
att förbereda och återfylla hammaren behöva mätas.

Städets mottagna arbete och arbetet till förbandet besvarar olika frågor.
När tecknet behålls räknas inte heller arbete som återförs under återstudsen
som kvarvarande utbyte.

# Beräknade slag

Alla numeriska värden nedan är modellberäkningar. Parametrarna är
illustrativa och gemensamma för jämförelserna, med undantag för den
uttryckligen angivna kontaktlagen eller vikten för högre ordning.

| Storhet | Värde |
|:------------------------------------------|-------------------------:|
| Hammarens tröghetsmoment $J_h$ | $1{,}6\times10^{-4}\ \mathrm{kg\,m^2}$ |
| Städets tröghetsmoment $J_a$ | $1{,}0\times10^{-4}\ \mathrm{kg\,m^2}$ |
| Kontaktstyvhet $k_c$ | $1500\ \mathrm{N\,m\,rad^{-1}}$ |
| Kontaktdämpning $c_c$ | $0{,}010\ \mathrm{N\,m\,s\,rad^{-1}}$ |
| Förbandsstyvhet $k_j$ | $1500\ \mathrm{N\,m\,rad^{-1}}$ |
| Förbandsdämpning $c_j$ | $0{,}020\ \mathrm{N\,m\,s\,rad^{-1}}$ |
| Ingående hammarhastighet | $600\ \mathrm{rad\,s^{-1}}$ |
| Räknad inenergi $I=K_0$ | $28{,}8\ \mathrm J$ |

: Gemensamma parametrar.\label{tab:parameters}

För de föreslagna modellerna är
$B_3=5{,}33333\times10^{-10}\ \mathrm{N\,m\,s^3\,rad^{-1}}$.
Den nominella koefficienten för fjärde ordningen är
$B_4=1{,}70667\times10^{-12}\ \mathrm{N\,m\,s^4\,rad^{-1}}$.
Jämförelsen med $w_4=1/5$ fördubblar detta värde utan att ändra någon annan
indata. Tabell \ref{tab:pulses} visar pulsresultat och utgående rörelse;
figur \ref{fig:pulses} visar tidsförloppen.

| Modell | $T$ (ms) | Max $\tau_c$ (N m) | $\omega_h(T)$ | $\omega_a(T)$ |
|:-----------------------|----------:|---------------------:|---------------:|---------------:|
| Vanlig linjär | 1,5742 | 184,41 | $-560{,}17$ | $-54{,}11$ |
| Vanlig olinjär | 1,3804 | 270,66 | $-522{,}92$ | $-104{,}90$ |
| Hammare, ordning 3 | 1,5740 | 185,33 | $-565{,}45$ | $-52{,}92$ |
| Fjärde, $w_4=1/10$ | 1,4796 | 233,14 | $-775{,}44$ | $6{,}15$ |
| Fjärde, $w_4=1/5$ | 0,7979 | 218,31 | $-358{,}25$ | $-55{,}69$ |

: Pulsresultat för hela kontakten; utgående hastigheter anges i rad/s.\label{tab:pulses}

![Beräknat kontaktmoment, hammarhastighet och ackumulerat arbete till städet för det gemensamma ingående tillståndet. Varje kurva slutar vid sin första separation. Den horisontella arbetslinjen visar den räknade inenergin, 28,8 J. Återfört arbete finns med i de nedre kurvornas fallande delar.](figures/impact-comparison.pdf){#fig:pulses width=100%}

\FloatBarrier

| Modell | $W_{ca}$ (J) | $W_j$ (J) | $W_X$ (J) | $\mathrm{COP}_{a}$ | $\mathrm{COP}_{j}$ |
|:-----------------------|------------:|----------:|----------:|------------------:|------------------:|
| Vanlig linjär | 2,4284 | 2,2820 | 0 | 0,08432 | 0,07924 |
| Vanlig olinjär | 4,4938 | 3,9436 | 0 | 0,15603 | 0,13693 |
| Hammare, ordning 3 | 2,4487 | 2,3086 | $-0{,}5114$ | 0,08502 | 0,08016 |
| Fjärde, $w_4=1/10$ | 2,9145 | 2,9126 | $-24{,}8868$ | 0,10120 | 0,10113 |
| Fjärde, $w_4=1/5$ | 35,3945 | 35,2395 | $-18{,}1210$ | 1,22898 | 1,22359 |

: Arbete med bibehållet tecken över intervallet och skenbar COP. Negativt $W_X$ är avgivet arbete.

Den vanliga linjära kontakten skickar $26{,}4708\ \mathrm J$ framåt till
städet och tar emot $24{,}0424\ \mathrm J$ tillbaka. Städets mottagna
nettoarbete är därför bara $2{,}4284\ \mathrm J$. I det nominella fallet
av fjärde ordningen är motsvarande belopp $29{,}3476$ och
$26{,}4330\ \mathrm J$. Den okända komponenten avger
$24{,}8868\ \mathrm J$, men den avgående hammaren behåller
$48{,}1048\ \mathrm J$, jämfört med $25{,}1034\ \mathrm J$ i det vanliga fallet.

Ett stort bidrag av avgivet arbete behöver inte ge ett stort utbyte till
förbandet. Här visar sig mycket av arbetet i hammarens kraftigare återstuds.

För $w_4=1/5$ avger den okända komponentens konto
$18{,}1210\ \mathrm J$, och båda skenbara COP överstiger ett.
Den fullständiga balansen är, med den visade precisionen,
\begin{equation}
\underbrace{28{,}8000+18{,}1210}_{\text{ordinär inenergi och avgivet arbete}}
=\underbrace{10{,}2673}_{K_h}
+\underbrace{0{,}1550}_{K_a}
+\underbrace{35{,}2395}_{W_j}
+\underbrace{1{,}2561}_{D_c}
+\underbrace{0{,}0031}_{Q_{\rm rel}}
\quad\mathrm J.
\label{eq:numerical-ledger}
\end{equation}
Arbetet till förbandet består av $33{,}6402\ \mathrm J$ elastiskt lagrad
energi och $1{,}5993\ \mathrm J$ motståndsarbete. Bidragen från de högre
ordningarna är $W_3=-0{,}7819\ \mathrm J$ och
$W_4=-17{,}3390\ \mathrm J$. Om det avgivna arbetet räknades som ytterligare
inenergi skulle kvoten bli $W_{ca}/(I-W_X)=0{,}7543$; den skenbara kvoten i
\eqref{eq:cop} håller den okända komponentens konto separat.

Energiöverföringarna vid separation är $0{,}00854$, $0$, $0{,}00876$ och
$0{,}02036\ \mathrm J$ för den linjära, olinjära, tredje ordningens och
nominella fjärde ordningens modell. Oberoende integrationer och
ändpunktsidentiteterna i \eqref{eq:higher-work} kontrollerar redovisningen.
I de fem exemplen ändrar noggrannare beräkningar med en annan
integrationsmetod COP med mindre än $10^{-10}$ och toppmomentet med mindre
än $10^{-6}\ \mathrm{N\,m}$; den totala balansresidualen är mindre än
$10^{-8}\ \mathrm J$.

# Randvillkor, utgångstillstånd och mätning

Beräkningarna behåller varje modells koefficienter när den ingående
hastigheten ändras till $400$ och $800\ \mathrm{rad\,s^{-1}}$.
För modellerna med linjär kontakt skalar rörelsen med den ingående
hastigheten, arbetet med dess kvadrat, och skenbar COP förblir oförändrad.
Den olinjära kontakten ger städets COP $0{,}12495$ och $0{,}18297$ vid dessa
hastigheter. Detta är förutsägelser för ändrade förhållanden, utan ny
parameteranpassning.

Förbandets randvillkor spelar roll även när hammarens koefficienter är
fasta. Med $k_j=1000\ \mathrm{N\,m\,rad^{-1}}$ separerar den nominella
modellen av fjärde ordningen vid $0{,}6939\ \mathrm{ms}$ och ger
$\mathrm{COP}_a=1{,}03358$, $\mathrm{COP}_j=0{,}87038$ och
$W_X=-2{,}9530\ \mathrm J$. Vid $k_j=2200$ är städets COP $0{,}07263$.
Det ändrade randvillkoret påverkar återgångsrörelsen och vilken nollgenomgång
under avlastningen som avslutar kontakten. Även den vanliga olinjära
modellen är känslig: dess COP för städet vid dessa två styvheter är
$0{,}92374$ och $0{,}08413$.

För fjärde ordningen ändras enbart vinkelrycket i begynnelseögonblicket,
alltså vinkelaccelerationens tidsderivata, till
$\theta_h^{(3)}(0)=\pm\omega_h(0)/t_c^2$, där
$t_c=\sqrt{J_h/k_c}$. Den nominella modellens COP för städet blir
$0{,}07467$ för det negativa valet och $0{,}13741$ för det positiva,
jämfört med $0{,}10120$ vid noll vinkelryck. Det extra begynnelsevillkoret
har en observerbar konsekvens och måste identifieras tillsammans med vikterna.

Det nominella linjära systemet av fjärde ordningen har under kontakt alla
poler i vänstra halvplanet, med största realdel
$-17{,}51\ \mathrm{s^{-1}}$. Även fallet med det mjukare förbandet ovan
har avklingande moder. En fördubbling av $w_4$ till $1/5$ inför en växande
mod med realdelen $1095{,}19\ \mathrm{s^{-1}}$. Dess beräknade slag slutar
efter $0{,}7979\ \mathrm{ms}$, innan något antagande om den senare
fortsättningen görs. Tillväxten är en del av förutsägelsen för detta
parameterval. Om endast $w_4$ i stället ändras till $1/20$ blir städets
COP $0{,}08611$, och moderna under kontakt är avklingande.

Synkroniserade mätningar av kontaktmoment och hammarens och städets
vinkelhastigheter skulle pröva dessa förutsägelser om pulser och arbete.
Hammarens residual $\tau_X=\tau_d-J_h\ddot\theta_h-\tau_c$ ger det härledda
okända momentet; integration av dess produkt med $\omega_h$ prövar den
okända komponentens energikonto. Förbandsmoment och städhastighet skiljer
mottaget arbete i städet från arbete till förbandet. Begynnelseacceleration
och vinkelryck, separationstidpunkt samt oberoende ändringar av hastighet
och förbandsstyvhet behövs för att skilja de föreslagna vikterna från ett
icke observerat utgångstillstånd. Derivatorna bör skattas gemensamt med
en rörelsemodell över en uppmätt bandbredd; upprepad derivering av brusiga
mätvärden kan annars dominera det skattade momentet av högre ordning.

Dessa beräkningar beskriver kontakter på ungefär $0{,}6$--$1{,}7\ \mathrm{ms}$
inom de angivna ändliga parametertesten. Noggrannhet och bandbredd för
verkliga verktyg återstår att fastställa med dessa mätningar. Den relevanta
jämförelsen är om en identifierad koefficientuppsättning förutsäger puls,
återstuds och arbete med bibehållet tecken vid oberoende slagförhållanden.

# Slutsats

Syntetiserade koefficienter av tredje och fjärde ordningen ger en konkret
modell av ett okänt bidrag i hammaren under ett rotationsslag. Den vanliga
referensen med två roterande kroppar förklarar också varför en skalär
beskrivning av fjärde ordningen kan överträffa reducerade modeller av andra
och tredje ordningen: den behåller båda svängningsmoderna.

Den okända komponenten har en separat, beräkningsbar arbetsredovisning.
I exemplen kan dess avgivna arbete förstärka hammarens återstuds, öka städets
mottagna arbete eller ge skenbar COP över ett. Utfallet beror på förbandets
randvillkor, vikterna och det förberedda tillståndet av högre ordning.
Kontakt- och förbandsintegraler med bibehållet tecken, energilager vid
ändpunkterna och överföringar vid separation visar vart det ordinärt
redovisade arbetet tar vägen. Mätning av dessa portar och hammarens residual
skulle pröva den förutsagda överföringen och avgöra vilken fysisk
energiredovisning som måste åtfölja den.

# Referenser {-}

1. H. Nilre och B. C. Herlin (2026a). [*ODE Coefficient Synthesis: The coefficient lattice and its staircase*][synthesis].
2. H. Nilre och B. C. Herlin (2026b). [*Energy Ledgers for Forced Harmonic ODEs: Kirchhoff power balance and an unknown component with X = LRC*][energy].
3. T. ter Braack och D. L. Margolis (2026). [“Modeling of an Impact Wrench for Use in Reducing Hand–Arm Vibrations”][wrench]. *Machines* **14**(2), 213. doi:10.3390/machines14020213.
4. K. H. Hunt och F. R. E. Crossley (1975). [“Coefficient of Restitution Interpreted as Damping in Vibroimpact”][hc]. *Journal of Applied Mechanics* **42**(2), 440--445. doi:10.1115/1.3423596.

[synthesis]: https://github.com/hobnilre/physics-ode-coefficient-synthesis/blob/main/ode-coefficient-synthesis.md
[energy]: https://github.com/hobnilre/physics-ode-energy/blob/main/physics-ode-energy.md
[wrench]: https://doi.org/10.3390/machines14020213
[hc]: https://doi.org/10.1115/1.3423596
