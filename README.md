# Mastermind
Mastermind game made in Motorola 68k Assembly 
# Mastermind en Assembleur 68k

Un jeu de Mastermind classique développé entièrement en assembleur Motorola 68000. Le jeu se déroule dans une interface graphique personnalisée et gère la logique de comparaison de combinaisons secrètes.

## Aperçu du jeu

<img width="1118" height="904" alt="{64B65AF1-F526-4D9D-A5EE-7C9DE7F59D51}" src="https://github.com/user-attachments/assets/138b611c-2b3f-43dc-9f1e-65f194146804" />


## Comment lancer le projet

Ce projet nécessite l'émulateur **EASy68K** pour être assemblé et exécuté.

1. **Téléchargez et installez** [EASy68K](http://www.easy68k.com/).
2. **Ouvrez le fichier source** principal dans l'éditeur EASy68K.
3. **Assemblez le code** en appuyant sur `F9` (Project > Assemble).
4. **Lancez le simulateur** Sim68K en appuyant sur `F10` (Project > Execute).
5. Appuyez sur le bouton **Play** dans Sim68K pour démarrer la partie. Une fenêtre de 900x700 pixels avec un fond vert s'ouvrira pour afficher le jeu.

##  Logique du Code

Le jeu repose sur une architecture modulaire séparant les appels graphiques et la logique de jeu.

### Génération aléatoire du code secret
Le code secret n'est pas fixe. À chaque nouvelle partie, le programme génère une nouvelle combinaison :
* **Graine temporelle :** La routine `TIMER_SEED` fait appel au système (Trap #15) pour récupérer l'heure de l'horloge système et l'utiliser comme graine de départ.
* **Calcul aléatoire :** La routine `INIT_RANDOM_SEED` utilise ensuite cette graine pour effectuer un calcul mathématique (multiplication, addition, et division par 10) afin d'isoler le reste et d'obtenir un chiffre aléatoire compris entre 0 et 9.

### Algorithme de vérification (Bien placés / Mal placés)
Pour comparer la tentative du joueur au code secret, le programme utilise deux passes et des marqueurs (`PLACE_SECRET` et `PLACE_CHOISI`) pour éviter les doublons :
1. **Les éléments bien placés :** La routine `BIEN_PLACE` compare les indices un à un[cite: 3]. Si une correspondance exacte est trouvée, la position est "marquée" à la fois dans le tableau secret et dans le tableau du joueur par un "1".
2. **Les éléments mal placés :** La routine `MAL_PLACE` croise les chiffres restants en ignorant systématiquement ceux qui ont été préalablement marqués à l'étape précédente.

## Règles du jeu
* L'ordinateur génère un code secret de 5 chiffres (de 0 à 9).
* Vous avez 10 tentatives pour le deviner[cite: 3].
* Saisissez une combinaison de 5 chiffres et appuyez sur Entrée[cite: 3]. La saisie est sécurisée et n'accepte que les caractères numériques.
* Le jeu vous indique combien de chiffres sont parfaitement placés, et combien sont corrects mais mal positionnés.
