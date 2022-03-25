/** largeur d'une raquette */
final int RACKET_WIDTH  = 10;
/** hauteur d'une raquette */
final int RACKET_HEIGHT = 40;
/** vitesse de déplacement vertical d'une raquette */
final int RACKET_SPEED  = 7;
/** distance du bord de la fenêtre pour la raquette */
final int BORDER_SPACE  = 20;
/** couleur de la rackette */
final color RACKET_COLOR = BLEU; 



/**
 * Une raquette.
 */
class Racket {
  
  /** abscisse du coté haut gauche de la raquette */
  int x;
  
  /** ordonnée du coté haut gauche de la raquette */
  int y;
  
  /** largeur de la raquette */
  int r_width;
  
  /** longueur de la raquette */
  int r_height;
  
  /** Mouvement Y de la raquette */
  int mvtY;
  
  
  /**
   * Initialisation d'une raquette : tous les attributs prennent des valeurs par défaut.
   *
   * @author    Enzo Mourany
   */
  Racket() {
    x = BORDER_SPACE;
    y = 200;
    r_width = RACKET_WIDTH;
    r_height = RACKET_HEIGHT;
    mvtY = 0;
  }
 
}

/**
*
* Affiche la raquette
*
* @param val    Racket r : objet Racket r
* @author       Enzo Mourany
*/
void showRacket(Racket r, Racket r2) {
  image(imgRacket1, r.x, r.y);
  image(imgRacket2, r2.x, r2.y);
}


/**
*
* Change les valeurs de mvtY (le mouvement en Y d'une raquette) quand les touches z, s, o, l sont préssés
* Stop l'affichage (draw) quand la touche espace est préssée
*
* @author    Enzo Mourany
*/
void keyPressed() {
  switch (key) {
        case 's' :
          racket1.mvtY = RACKET_SPEED;
          break;
        case 'z' :
          racket1.mvtY = -RACKET_SPEED;
          break;
        case 'l' :
          racket2.mvtY = RACKET_SPEED;
          break;
        case 'o' :
          racket2.mvtY = -RACKET_SPEED;
          break;
         case ' ' :
           if (onBreak == false) {
             noLoop();
             onBreak = true;
           } else {
             loop();
             onBreak = false;
           }
           break;
         default :
           break;
      }
}

/**
*
* Met mvtY (le mouvement en Y d'une raquette) à 0
*
* @author    Enzo Mourany
*/
void keyReleased() {
  switch (key) {
        case 's' :
          racket1.mvtY = 0;
          break;
        case 'z' :
          racket1.mvtY = 0;
          break;
        case 'l' :
          racket2.mvtY = 0;
          break;
        case 'o' :
          racket2.mvtY = 0;
          break;
        default :
          break;
      }
}

/**
*
* Ajoute aux valeur y des raquettes selectionnés (ordonnés) la vitesse de la raquette,
* permet de déplacer les raquettes
*
* @author    Enzo Mourany 
*/
void moveRacket() {
  for (int i = 0; i < 2; i++) {
    if (i == 0) {
      racket1.y += racket1.mvtY;
    } else {
      racket2.y += racket2.mvtY;
    }
  }
  if (racket1.y >= height - racket1.r_height - 20 || racket1.y <= 0 + 20) {
    racket1.mvtY = 0;
  } else if (racket2.y >= height - racket2.r_height - 20 || racket2.y <= 0 + 20) {
    racket2.mvtY = 0;
  }
}
