/** largeur (ou diamètre) de la balle */
final int BALL_WIDTH = 10;
/** vitesse de déplacement de la balle */
final int BALL_SPEED = 3;
/** couleur de la balle */
final color BALL_COLOR = BLANC;

/** nombre de balles */
int numberBall = 1;

/**
 * Une balle.
 */
class Ball {

  /** abscisse du centre de la balle */
  int x;

  /** ordonnée du centre de la balle */
  int y;

  /** mouvement sur l'axe des abscisses */
  int mvt_x;

  /** mouvement sur l'axe des ordonnées */
  int mvt_y;

  /**
   * Initialisation d'une balle : tous les attributs prennent des valeurs par défaut.
   */
  Ball() {
    x = width/2;
    y = height/2;
    do {
      mvt_x = int(random(-3, 3));
      mvt_y = int(random(-3, 3));
    } while (mvt_x == 0 || mvt_y == 0 || mvt_x == 1 || mvt_y == 1 || mvt_x == 2 || mvt_y == 2);
  }
}

/**
 * Affichage de la balle
 *
 * @param val     Ball b : b une instance de Balle
 */
void showBall(Ball b)
{
  fill(BALL_COLOR);
  ellipse(b.x, b.y, BALL_WIDTH, BALL_WIDTH);
  image(imgBall, b.x, b.y);
}

/**
 * Déplacement de la balle
 *
 * @param val     Ball b : b une instance de Balle
 *
 */
void moveBall(Ball b)
{
  // Mouvement Horizontal
  b.x += b.mvt_x;
  if (collisionHorizontale(b) == true)
  {
    b.x -= b.mvt_x; // mouvement annulé
    b.mvt_x *= -1; // changement de direction
  }
  // Mouvement Vertical
  b.y += b.mvt_y;
  if (collisionVerticale(b) == true)
  {
    b.y -= b.mvt_y; // mouvement annulé
    b.mvt_y *= -1; // changement de direction
  }
}

/**
 * Retourne vrai si la balle à sa valeur x inferieur à 0 ou est supérieur a la largeur
 * Empeche la balle de sortir du cadre
 * Collision quand la balle entre en collision avec une raquette
 *
 * @param val    Ball b : b une instance de Balle
 * @return       vrai quand la valeur x de la balle est inferieur à 0 ou est supérieur a la largeur
 * @author       Enzo Mourany
 */
boolean collisionHorizontale(Ball b)
{
  return (racket2.x - racket2.r_width <= b.x && b.x <= racket2.x + racket2.r_width) 
  && (racket2.y <= b.y && b.y <= racket2.y + racket2.r_height) 
  || (racket1.x <= b.x && b.x <= racket1.x + racket2.r_width) 
  && (racket1.y <= b.y && b.y <= racket1.y + racket2.r_height);
}


/**
 * Retourne vrai si la balle à sa valeur y inferieur à 0 ou est supérieur a la largeur
 * Empeche la balle de sortir du cadre
 *
 * @param val    Ball b : b une instance de Balle
 * @return       vrai quand la valeur y de la balle est inferieur à 0 ou est supérieur a la largeur
 * @author       Enzo Mourany
 */
boolean collisionVerticale(Ball b)
{
  return (b.y + BALL_WIDTH/2 > height) || (b.y < 0 + BALL_WIDTH/2);
}


/**
 * Collision entre les balles et les obstacles
 *
 * @param      Ball b : instance de la classe Ball 
 * @author     Enzo Mourany
 */
void collisionWithObstables(Ball b) {
  for (int i = 0; i < 5; i++) {
    if(collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH,
    obstacles[i].x, obstacles[i].y, obstacles[i].o_width, obstacles[i].o_height)) {
      b.x -= b.mvt_x;
      b.mvt_x *= -1; 
      b.y -= b.mvt_y;
      b.mvt_y *= -1;
    }
  }
}


/**
 *
 * Ajoute 1 au score d'un jour quand la balle atteint le coté de l'autre joueur
 * Reset la position de la balle au centre
 * 
 * @author         Enzo Mourany
 */
void checkPoint() {
  for (int i = 0; i < numberBall; i++) {
    if (balls[i].x + BALL_WIDTH/2 >= width) {
      balls[i].x = width/2;
      balls[i].y = height/2;

      player1.score += 1;
    } else if (balls[i].x - BALL_WIDTH/2 <= 0) {
      balls[i].x = width/2;
      balls[i].y = height/2;
      player2.score += 1;
    }
  }
}

/**
 * Affiche le score des deux joeurs
 *
 * @author     Enzo Mourany
 */
void displayScore() {
  textAlign(CENTER, TOP);
  fill(255);
  text("SCORE", width/2, 35);
  text(player1.score, 300, 60);
  text(player2.score, width - 300, 60);
}
