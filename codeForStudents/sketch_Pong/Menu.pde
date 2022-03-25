/**---------------- Gestion de menu du jeu -----------------*/

/**
 * Affiche les boutons play et quit en rouge
 * Quand la souris les survole, elle affiche ces memes boutons en jaune
 *
 * @author     Enzo Mourany
 */
void displayButtons() {
  // Bouton quitter
  copy(imgButtons, 0, 0, 150, 60, 145, 120, 150, 60);
  // Bouton jouer
  copy(imgButtons, 0, 100, 150, 60, 145, 200, 150, 60);
  // Bouton jouer 4 joueurs
  copy(imgButtons, 0, 100, 150, 60, 345, 120, 150, 60);
  if (mouseX >= 145 && mouseX <= 295 && mouseY >= 120 && mouseY <= 180) {
    copy(imgButtons, 200, 0, 150, 60, 145, 120, 150, 60);
  } else if (mouseX >= 145 && mouseX <= 295 && mouseY >= 200 && mouseY <= 260) {
    copy(imgButtons, 200, 100, 150, 60, 145, 200, 150, 60);  
  } else if (mouseX >= 345 && mouseX <= 495 && mouseY >= 120 && mouseY <= 180) {
    copy(imgButtons, 200, 100, 150, 60, 345, 120, 150, 60);
  }
}

/** Booléen, vérifier si on est dans le menu */
boolean inTheMenu = true;
