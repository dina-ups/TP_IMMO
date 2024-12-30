<?php
$servername = "tp_mysql_new"; // Nom du conteneur MySQL
$username = "root";       // Nom d'utilisateur MySQL
$password = "yourpassword"; // Mot de passe MySQL
$dbname = "TP_IMMO";       // Nom de la base de données

try {
    // Connexion à MySQL avec PDO
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Préparer la requête
    $stmt = $conn->prepare("INSERT INTO Inscrit (IDC, IDA) VALUES (:idc, :ida)");
    $stmt->bindParam(':idc', $_POST['idc']);
    $stmt->bindParam(':ida', $_POST['ida']);

    // Exécuter la requête
    $stmt->execute();
    echo "Inscription réussie.";
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
?>
