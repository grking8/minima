---
layout: page
title: Maths
permalink: /maths/
order: 4
---

Cette page s'est fortement inspirée [de ce document.](http://depmath-nancy.univ-lorraine.fr/club/docs/entreTerminaleEtCPGE.pdf)
<br><br>

1 [PRELIMINAIRES](#preliminaires)

1.1 [Modes de raisonnement](#modes-de-raisonnement)

1.1.1 [Déduction](#deduction)
1.1.2 [Récurrence](#recurrence)
1.1.3 [Par l'absurde](#par-labsurde)
1.1.4 [Analyse-synthèse](#analyse-synthese)
1.1.5 [Contraposée](#contraposee)

1.2 [Calculs algébriques](#calculs-algebriques)

1.2.1 [Le symbole $\sum$](#le-symbole-sum)
1.2.2 [Sommes telescopiques](#sommes-telescopiques)
1.2.3 [Le symbole $\prod$](#le-symbole-prod)
1.2.4 [Factorielle d'un entier naturel](#factorielle-dun-entier-naturel)

1.3 [Trigonometrie et nombres complexes](#trigonometrie-et-nombres-complexes)

1.3.1 [Trigonometrie](#trigonometrie)
1.3.2 [Introduction aux nombres complexes](#introduction-aux-nombres-complexes)
<br><br>

2 [NOMBRES COMPLEXES](#nombres-complexes)
<br><br>

## Préliminaires

### Modes de raisonnement

#### Déduction

$$x < y \implies 2 + x < 2 + y$$

#### Récurrence

- $(simple) \; Montrer \; que \; pour \; tout \; n \; dans \;
\mathbb{N}^*:$

$$1^2 + \ldots + n^2 = \frac{n(n+1)(2n+1)}{6}$$ 

<details>
<summary></summary>
<br>
$\mathcal{P_n}: \; 1^2 + \ldots + n^2 = \frac{n(n+1)(2n+1)}{6}$
<br>
Vérifier $\mathcal{P_1}$
<br>
Soit $n \in \mathbb{N}^*$
<br>
Si $\mathcal{P}_n$, alors $\mathcal{P}_{n+1}$ 
<br>
Conclure
</details>
<br>

- $(forte) \; Montrer \; que \; tout \; entier \; n \geq 2 \; est \; produit
\; de \; nombres \; premiers.$

<details>
<summary></summary>
<br>
$\mathcal{P_n}: \;$ n est produit de nombres premiers
<br>
Vérifier $\mathcal{P_2}$
<br>
Soit $n \in \mathbb{N}^*\setminus \{ 1 \}$
<br>
Si $\mathcal{P}_2, \ldots, \mathcal{P}_n$, alors $\mathcal{P}_{n+1}$ 
<br>
Conclure
</details>
<br>

#### Par l'absurde

- $Montrer \; que \; \sqrt{2} \; est \; irrationnel.$

<details>
<summary></summary>
Supposons que $\sqrt{2}$ est rationnel
<br>
$\sqrt{2} = \frac{p}{q}$ avec $p,q$ dans $\mathbb{N}^*$, $\frac{p}{q}$
irreductible
<br>
$p^2$ est pair
<br>
Par l'absurde, $p$ est pair
<br>
De meme, $q$ est pair
<br>
Conclure
</details>
<br>

#### Analyse-synthèse

- $Soit \; f \; une \; fonction \; de \; \mathbb{R} \; dans \; \mathbb{R}. \;
Montrer \; qu'il \; existe \; un \; unique \; couple \; (p, i) \; de$

$fonctions \; de \; \mathbb{R} \; dans \; \mathbb{R} \; verifiant \; les \;
conditions \; suivantes:$

$i\) \; p \; est \; paire, \; i \; est \; impaire;$

$ii\) \; f=p+i$

<details>
<summary></summary>
Analyse
<br>
Supposons que $f=p+i$ avec $p$ paire, $i$ impaire
<br>
$p(x)=\frac{f(x)+f(-x)}{2}$
<br>
De meme $i(x)=\frac{f(x)-f(-x)}{2}$
<br>
Donc si un tel couple $(p,i)$ existait, il serait necessairement de la forme
<br>
$\left(
p:\mathbb{R}\rightarrow\mathbb{R},x \mapsto \frac{f(x)+f(-x)}{2},
i:\mathbb{R}\rightarrow\mathbb{R},x \mapsto \frac{f(x)-f(-x)}{2}
\right)$
<br>
Synthese
<br>
Verifier $p$ est paire, $i$ est impaire, et $f=p+i$
</details>
<br>

#### Contraposée

Au lieu de montrer $A \implies B$, montrer $non(B) \implies non(A)$

<br>
<br>

### Calculs algebriques

#### Le symbole $\sum$

- $Soit \; n \; dans \; \mathbb{N^*}. \; Donner \; une \; expression \; 
simple \; de \; la \; somme$
 
$$\sum_{k=1}^n(2k-1)$$

$des \; n \; premiers \;entiers \; impairs.$

<details>
<summary></summary>
Par linearite de la somme,
<br>
$\sum_{k=1}^n(2k-1)=2\sum_{k=1}^n k-\sum_{k=1}^n1$
</details>
<br>

- $On \; pose, \; pour \; n \; dans \; \mathbb{N}^*:$
 
$$u_n = \sum_{k=n}^{2n}\frac{1}{k}$$

$Simplifier \; u_{n+1}-u_n \; et \; en \; deduire \; la \; monotonie \; 
de \; (u_n)_{n \geq 1}$.

<details>
<summary></summary>
$u_{n+1}-u_n=\frac{1}{2n+1} + \frac{1}{2n+2} - \frac{1}{n}$
</details>
<br>

- $Montrer, \; pout \; tout \; entier \; n \geq 2:$

$$\; \sum_{k=1}^{n-1}H_k = nH_n - n$$

$ou \; H_n \; est \; la \; n-ieme \; nombre \; harmonique$

$$H_n = \sum_{k=1}^n \frac{1}{k}$$

<details>
<summary></summary>
Par recurrence simple
</details>
<br>

#### Sommes telescopiques

Supposons qu'on veut calculer 

$$\sum_{k=0}^{n}a_k$$

ou $(a_k)\_{k \geq 0}$ est une suite complexe, et qu'il existe une autre suite 
complexe $(b_k)\_{k \geq 0}$ telle que:

$$\forall k \in \mathbb{N}, \quad a_k=b_{k+1}-b_k$$

Alors

$$\sum_{k=0}^{n}a_k=b_{n+1}-b_0$$

- $a) \; Si \; n \; est \; dans \; \mathbb{N}^*, \; simplifier:$

$$\sum_{k=1}^n \ln\left(1+\frac{1}{k}\right)$$

$Quelle \; est \; la \; limite \; de \; cette \; expression \; lorsque \; n \;
tend \; vers \; +\infty ?$

$b) \; Si \; n \; est \; un \; entier \geq 2, \; simplifier:$

$$\sum_{k=2}^n \ln\left(1-\frac{1}{k^2}\right)$$

$Quelle \; est \; la \; limite \; de \; cette \; expression \; lorsque \; n\;
tend \; vers \; +\infty ?$

<details>
<summary></summary>
a) Soit $k \in \mathbb{N}^*$
<br>
$\ln\left(1+\frac{1}{k}\right)=\ln(k+1)-\ln(k)$
<br><br>
b) Soit $k \in \mathbb{N}^* \setminus \{ 1 \}$
<br>
$\ln\left(1-\frac{1}{k^2}\right)=(\ln(k+1)-\ln(k))-(\ln(k)-\ln(k-1))$
</details>
<br>

- $Determiner \; trois \; reels \; a, b, c \; tels \; que:$

$$\forall x \in \mathbb{R} \setminus \{0,-1,-2\}, \quad 
\frac{1}{x(x+1)(x+2)}=\frac{a}{x}+\frac{b}{x+1}+\frac{c}{x+2}$$

$En \; deduire, \; pour \; n \; dans \; \mathbb{N}^*, \; une \; expression \;
simple \; de:$

$$U_n=\sum_{k=1}^n \frac{1}{k(k+1)(k+2)}$$

$Quelle \; est \;
la \; limite \; de \; (U\_n)\_{n \geq 1} \; lorsque \; n \; tend \; vers \; 
+\infty ?$

<details>
<summary></summary>
Analyse
<br>
Supposons que $\frac{1}{x(x+1)(x+2)}=\frac{a}{x}+\frac{b}{x+1}+\frac{c}{x+2}$
<br>
Alors
$$
\left\{
\begin{array}{c}
a+b+c=0 \\ 
3a+2b+c=0 \\ 
2a=1
\end{array}
\right.
$$
Donc $(a,b,c)=(\frac{1}{2},-1,\frac{1}{2})$
<br>
Synthese
<br>
Verifier que $\frac{1}{x(x+1)(x+2)}=\frac{1}{2x}-\frac{1}{x+1}+\frac{1}{2x+4}$
<br>
$U_n=\frac{1}{2}\left(\sum_{k=1}^n\left(\frac{1}{k+2}-
\frac{1}{k+1}\right)-\sum_{k=1}^n\left(\frac{1}{k+1}-
\frac{1}{k}\right)\right)$
</details>
<br>

#### Le symbole $\prod$

- $Pour \; n \geq 2, \; donner \; une \; expression \; simple \; de:$

$$C_n=\prod_{k=2}^n\left(1-\frac{1}{k^2}\right)$$

$et \; trouver \; la \; limite \; de \; (C\_n)\_{n \geq 1} \; lorsque \; n \;
tend \; vers \; +\infty.$

<details>
<summary></summary>
Soit $n \geq 2$
<br>
$C_n=\prod_{k=2}^n \frac{k+1}{k}\prod_{k=2}^n \frac{k-1}{k}$
</details>
<br>

#### Factorielle d'un entier naturel

- $Pour \; 0 \leq m \leq n-1, \; simplifier:$

$$\frac{n \choose m+1}{n \choose m}$$

$et \; comparer \; (pour \; m \leq \lceil n/2
\rceil - 1) \; ce \; quotient \; a \; 1.$

$En \; deduire:$

$${n \choose 0} \leq {n \choose 1} \leq \ldots \leq {n \choose {\lceil n/2
\rceil}}$$

<details>
<summary></summary>
Soit $m \in \lbrace 0,\ldots,n-1 \rbrace$
<br>
$\frac{n \choose m+1}{n \choose m}=\frac{n-m}{m+1}$
<br>
Soit $m \in \lbrace 0,\ldots,\lceil n/2 \rceil-1 \rbrace$
<br>
$m+1 \leq \lceil n/2 \rceil$
<br>
$n-m \geq n+1-\lceil n/2 \rceil$
<br>
Verifier que $n+1-\lceil n/2 \rceil \geq \lceil n/2 \rceil$
<br>
Conclure
</details>
<br>

### Trigonometrie et nombres complexes

#### Trigonometrie

Les valeurs des cosinus et sinus des angles "usuels", e.g. $(\cos(0), \sin(0))=P(0)=(1,0)$:

<img src="..{{  site.baseurl  }}/assets/images/m1389i15.JPG" height="700" 
width="700" alt="cercle trigonometrique">

Formules:

$$\cos(x+y)=\cos(x)\cos(y)-\sin(x)\sin(y) \tag{0}$$

$$\sin(x+y)=\sin(x)\cos(y) + \sin(y)\cos(x) \tag{1}$$

$$\cos^2(\theta)+\sin^2(\theta)=1 \tag{2}$$

$$\cos(x)\cos(y)=\frac{1}{2}(\cos(x+y)+\cos(x-y)) \tag{3}$$

$$\cos(x)+\cos(y)=2\cos\left(\frac{x+y}{2}\right)
\cos\left(\frac{x-y}{2}\right) \tag{4}$$

avec $(x,y) \in \mathbb{R}^2, \theta \in \mathbb{R}$.

La fonction cosinus (sinus) est paire (impaire).

Congruences:

$$\cos(x)=\cos(y) \iff x \equiv y \pmod{2\pi} \; \mathrm{ou} 
\; x \equiv -y \pmod{2\pi} \tag{5}$$

$$\sin(x)=\sin(y) \iff x \equiv y \pmod{2\pi} \; \mathrm{ou} 
\; x \equiv \pi-y \pmod{2\pi} \tag{6}$$

$\[Soit \; a \; dans \; \mathbb{R}^*, \; (x,y) \; dans \; \mathbb{R^2}. \;
On \; ecrit:$

$$x \equiv y \pmod{a}$$

$s'il \; existe \; k \; dans \; \mathbb{Z} \; tel \; que \; x-y=ka\]$

La fonction tangente:

$$\tan(x)=\frac{\sin(x)}{\cos(x)}$$

avec $x \in \mathbb{R}, x \not\equiv \frac{\pi}{2} \pmod{\pi}$

- $Calculer \; le \; cosinus \; de \; \frac{\pi}{8} \; en \; utilisant \; la \;
formule \; de \; duplication \; pour \; cosinus.$

<details>
<summary></summary>
Par $(0), (2)$
<br>
$\lvert \cos(x) \rvert = \sqrt{\frac{\cos(2x)+1}{2}}$
</details>
<br>

- $Determiner \; sans \; calcul \; le \; maximum \; sur \; \mathbb{R} \; de:$

$$x \mapsto \sin(x)\cos(x) $$

<details>
<summary></summary>
Soit $x \in \mathbb{R}$
<br>
Par $(0), (2)$
<br>
$\left(\sin(x)\cos(x)\right)^2=\frac{1-\cos^2(2x)}{4}$
<br>
Posons $x=\frac{\pi}{4}$
</details>
<br>

- $a) \; Soit \; x \; un \; nombre \; reel \; non \; multiple \; entier \; 
de \; \pi. \; Simplifier, \; pour \; n \; dans \; \mathbb{N}^*, \; le \; 
produit:$

$$P_n(x)=\prod_{k=1}^n \cos \left(\frac{x}{2^k}\right)$$

$En \; utilisant \; la \; relation$

$$\frac{\sin(u)}{u}\xrightarrow[{u \to 0}]{}1$$

$(ce \; que \; l'on \; admet) \; et \; en \; l'appliquant \; a \; u=\frac{x}
{2^n} \; qui \; tend \; vers \; 0 \; lorsque \; n \; tend \; vers \; +
\infty,$

$determiner \; la \; limite \; de \; P_n(x) \; lorsque \; n \; tend
\; vers \; +\infty.$

$b) \; Pour \; n \; dans \; \mathbb{N}^*, \; soit:$

$$u_n=\sqrt{2+\sqrt{2+\sqrt{2+\ldots+\sqrt{2}}}} \quad (n \; radicaux)$$

$Montrer:$

$$\forall n \in \mathbb{N}^*, \quad u_n=2\cos\left(\frac{\pi}{2^{n+1}}\right)$$

$c) \; Pour \; n \; dans \; \mathbb{N}^*, \; on \; pose:$

$$v_n=\prod_{k=1}^n u_k$$

$Montrer:$

$$\frac{v_n}{2^n}\longrightarrow\frac{2}{\pi}$$

<details>
<summary></summary>
a) Par $(1)$
<br>
$\cos(y)=\frac{\sin(2y)}{2\sin(y)}$
<br>
(y est non multiple entier de $\pi$)
<br>
$P_n(x)=\frac{\sin(x)}{2^n \sin\left(\frac{x}{2^n}\right)}$
<br>
b) Par recurrence simple, $\cos(2x)=2\cos^2(x)-1$
<br>
c) Utiliser a), b)
</details>
<br>

- $Resoudre \; dans \; \mathbb{R} \; les \; equations:$

$$a) \; \cos(x)=\frac{1}{2}, \quad b) \; \sin(2x)=\frac{\sqrt{2}}{2}$$

<details>
<summary></summary>
a) $\cos\left(\frac{\pi}{3}\right)=\frac{1}{2}$, (5)
<br>
b) $\sin\left(\frac{\pi}{4}\right)=\frac{\sqrt{2}}{2}$, (6)
</details>
<br>

- $Soient \; a \; et \; b \; deux \; reels \; non \; tous \; nulls.$

$a) \; Montrer \; que \; le \; point \;
\left(\frac{a}{\sqrt{a^2+b^2}},\frac{b}{\sqrt{a^2+b^2}}\right) \;
appartient \; au \; cercle \; de \; centre \; O \; et \; de \; rayon \; 1$
 
$du \; plan. \; Il \; existe \; donc \; \phi \; dans \; \mathbb{R} \; tel \; 
que \; \left(\frac{a}{\sqrt{a^2+b^2}},\frac{b}{\sqrt{a^2+b^2}}\right)
=(\cos(\phi),\sin(\phi)).$

$b) \; Verifier:$

$$\forall x \in \mathbb{R}, \; a\cos(x)+b\sin(x)=\sqrt{a^2+b^2}\cos(x-\phi)$$

$Quel \; est \; le \; maximum \; de \; a\cos(x)+b\sin(x) \; lorsque \; x \;
decrit \; \mathbb{R}?$

$c) \; Appliquer \; ce \; qui \; precede \; pour \; resoudre:$

$$\cos(x)+\sin(x)=\sqrt{\frac{3}{2}}$$

<details>
<summary></summary>
a) $(x,y) \in \mathcal{C} \iff x^2+y^2=1$
<br>
b) Par (0)
<br>
c) Posons $a=b=1$
<br>
$\left(\cos(\frac{\pi}{4}),\sin(\frac{\pi}{4})\right)=
\left(\frac{1}{\sqrt{2}},\frac{1}{\sqrt{2}}\right)$
<br>
$\cos(\frac{\pi}{6})=\frac{\sqrt{3}}{2}$
</details>
<br>

- $Sous \; des \; hypotheses \; convenables, \; exprimer \; \tan(x+y) \; en
\; fonction \; de \; \tan(x) \; et \; \tan(y).$

<details>
<summary></summary>
Soient $x,y \in \mathbb{R}$ tels que $x+y \not\equiv \frac{\pi}{2} \pmod \pi$
<br>
Donc $\tan(x+y)$ est bien definie
<br>
De plus, supposons que 
$x \not\equiv \frac{\pi}{2} \pmod \pi$,
$y \not\equiv \frac{\pi}{2} \pmod \pi$
<br>
Donc $\tan(x),\tan(y)$ bien definies
<br>
Considerer $\frac{\cos(x+y)}{\cos(x)\cos(y)}$ et
$\frac{\sin(x+y)}{\cos(x)\cos(y)}$
</details>
<br>

- $Soient \; x \; dans \; \mathbb{R} \; non \; congru \; a \; \pi \; modulo \; 
2\pi, \; t=\tan\left(\frac{x}{2}\right). Verifier$

$$\cos(x)=\frac{1-t^2}{1+t^2}, \quad \sin(x)=\frac{2t}{1+t^2}$$

<details>
<summary></summary>
Par $(0),(1),(2)$
</details>
<br>
