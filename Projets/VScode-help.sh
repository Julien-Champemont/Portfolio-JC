#!/bin/bash

# Demander le nom du dossier à créer
while true; do
    DOSSIER_NAME=$(zenity --entry --text="Entrez le nom du dossier à créer" --title="Créer un dossier")
    if [ $? -ne 0 ]; then
        # L'utilisateur a annulé, quitter le script
        exit 1
    fi

    if [ -d ~/Bureau/$DOSSIER_NAME ]; then
        zenity --error --text="Le dossier '$DOSSIER_NAME' existe déjà sur le Bureau. Veuillez choisir un autre nom."
    else
        break
    fi
done

# Créer le dossier sur le Bureau
mkdir -p ~/Bureau/$DOSSIER_NAME

# Nom du fichier HTML à créer
FICHIER_HTML="index.html"

# Nom du fichier CSS à créer
FICHIER_CSS="styles.css"

# Nom du fichier JavaScript à créer
FICHIER_JS="script.js"

# Demander à l'utilisateur via une boîte de dialogue
if zenity --question --text="Voulez-vous un fichier HTML préconfiguré ?" --ok-label="Oui" --cancel-label="Non" --title="Créer un fichier HTML" --width=300; then
    # Code HTML préconfiguré
    HTML_CONTENT="<!DOCTYPE html>
<html lang=\"fr\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Structure de Page Web</title>
    <!-- Lien vers le fichier CSS -->
    <link rel=\"stylesheet\" href=\"$FICHIER_CSS\">
    <!-- Lien vers une bibliothèque CSS (par exemple, Bootstrap) -->
    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">
</head>
<body>
    <!-- En-tête de la page -->
    <header>
        <div class=\"container\">
            <h1>Mon Site Web</h1>
            <nav>
                <ul>
                    <li><a href=\"#home\">Accueil</a></li>
                    <li><a href=\"#about\">À Propos</a></li>
                    <li><a href=\"#contact\">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Contenu principal de la page -->
    <main>
        <div class=\"container\">
            <!-- Section d'accueil -->
            <section id=\"home\">
                <h2>Accueil</h2>
                <img src=\"path/to/image.jpg\" alt=\"Description de l'image\" class=\"img-fluid\">
                <p>Ceci est un exemple de page web. Vous pouvez ajouter du contenu ici.</p>
            </section>

            <!-- Section à propos -->
            <section id=\"about\">
                <h2>À Propos</h2>
                <p>Cette section est dédiée à la description de votre site ou de vous-même.</p>
            </section>

            <!-- Section de contact -->
            <section id=\"contact\">
                <h2>Contact</h2>
                <p>Voici les informations de contact ou un formulaire pour vous contacter.</p>
            </section>
        </div>
    </main>

    <!-- Pied de page -->
    <footer>
        <div class=\"container\">
            <p>&copy; 2024 Mon Site. Tous droits réservés.</p>
        </div>
    </footer>

    <!-- Lien vers le fichier JavaScript -->
    <script src=\"$FICHIER_JS\"></script>
    <!-- Lien vers une bibliothèque JavaScript (par exemple, jQuery) -->
    <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>
    <!-- Lien vers un fichier JavaScript de bibliothèque (par exemple, Bootstrap JS) -->
    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>
</body>
</html>"
else
    # Code HTML vide
    HTML_CONTENT="<!DOCTYPE html>
<html lang=\"fr\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Document</title>
    <link rel=\"stylesheet\" href=\"$FICHIER_CSS\">
</head>
<body>
    <script src=\"$FICHIER_JS\"></script>
</body>
</html>"
fi

# Code CSS vide
CSS_CONTENT="/* Ajoutez vos styles CSS ici */
/* Voici de quoi vous aidez en CSS : https://www.w3schools.com/css/ */"

# Code JavaScript vide
JS_CONTENT="// Ajoutez votre code JavaScript ici
// Voici de quoi vous aidez en JavaScript : https://www.w3schools.com/js/ "

# Écrire le contenu dans les fichiers
echo "$HTML_CONTENT" > ~/Bureau/$DOSSIER_NAME/$FICHIER_HTML
echo "$CSS_CONTENT" > ~/Bureau/$DOSSIER_NAME/$FICHIER_CSS
echo "$JS_CONTENT" > ~/Bureau/$DOSSIER_NAME/$FICHIER_JS

# Afficher une boîte de dialogue d'information

# Code CSS vide
CSS_CONTENT="/* Ajoutez vos styles CSS ici */
/* Voici de quoi vous aidez en CSS : https://www.w3schools.com/css/ */"

# Code JavaScript vide
JS_CONTENT="// Ajoutez votre code JavaScript ici
// Voici de quoi vous aidez en JavaScript : https://www.w3schools.com/js/ "

# Écrire le contenu dans les fichiers
echo "$HTML_CONTENT" > ~/Bureau/$DOSSIER_NAME/$FICHIER_HTML
echo "$CSS_CONTENT" > ~/Bureau/$DOSSIER_NAME/$FICHIER_CSS
echo "$JS_CONTENT" > ~/Bureau/$DOSSIER_NAME/$FICHIER_JS

# Afficher une boîte de dialogue d'information
zenity --info --text="Dossier '$DOSSIER_NAME' créé avec succès sur le Bureau, contenant les fichiers '$FICHIER_HTML', '$FICHIER_CSS' et '$FICHIER_JS'."

# Ouvrir Visual Studio Code avec le dossier créé
code ~/Bureau/$DOSSIER_NAME
