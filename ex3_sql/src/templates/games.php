<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Ex3_SQL</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <section class="indexbody">
            <table class="standard-table">
                <caption>Liste des jeux</caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prix</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($games as $game): ?>
                        <tr>
                            <td><?= $game['ID'] ?></td>
                            <td><?= $game['nom_upper'] ?></td>
                            <td><?= $game['prix'] ?></td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </section>

</body>
</html>