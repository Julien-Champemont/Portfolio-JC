<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom = $_POST["name"];
    $email = $_POST["email"];
    $sujet = $_POST["subject"];
    $message = $_POST["message"];

    // Configuration de l'email
    $destinataire = "jujuchampemon@gmail.com"; // Remplacez par votre adresse email
    $objet = "Formulaire de contact - $sujet";
    $contenu = "Nom : $nom\nEmail : $email\nSujet : $sujet\nMessage : $message";

    // Envoi de l'email
    if (mail($destinataire, $objet, $contenu)) {
        echo "Merci de nous avoir contacté ! Votre message a été envoyé avec succès.";
    } else {
        echo "Erreur lors de l'envoi de l'email. Veuillez réessayer.";
    }
}
?>