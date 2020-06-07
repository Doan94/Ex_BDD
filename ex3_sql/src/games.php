<?php

    include 'application/bdd_connection.php';
    // Paramétrage de la liaison PHP <-> MySQL, les données sont encodées en UTF-8.
    $pdo->exec('SET NAMES UTF8');

    // Récupération de tous les articles du blog classés par ordre antéchronologique.
    $query = $pdo->prepare
    (
    'SELECT
        ID,
        UPPER(nom) AS nom_upper,
        prix
     FROM jeux_video
     ORDER BY ID'
    );

    // Demande à PDO d'envoyer la requête à MySQL pour exécution.
    $query->execute();

    /*
    * Récupération de toutes les données renvoyées par MySQL.
    *
    * La méthode fetchAll() renvoie un tableau à deux dimensions :
    * - la première dimension représente les différentes lignes de données
    * - la deuxième dimension représente les colonnes SQL de chaque ligne de données
    */
    $games = $query->fetchAll(PDO::FETCH_ASSOC);

    include 'templates/games.php';