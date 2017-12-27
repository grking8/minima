---
layout: page
title: Maths
permalink: /maths/
order: 4
---

Cette page s'est fortement inspirée [de ce document.](http://depmath-nancy.univ-lorraine.fr/club/docs/entreTerminaleEtCPGE.pdf)

1 [Préliminaires](#preliminaires)

1.1 [Modes de raisonnement](#modes-de-raisonnement)

1.1.1 [Déduction](#deduction)
1.1.2 [Récurrence](#recurrence)
1.1.3 [Par l'absurde](#par-labsurde)
1.1.4 [Analyse-synthèse](#analyse-synthese)
1.1.5 [Contraposée](#contraposee)

1.2 [Calculs algébriques](#calculs-algebriques)

1.2.1

2 [Analyse](#analyse)

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
