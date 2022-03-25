/** constante : coueleur de la raquette */
final color OBSTACLE_COLOR = BLANC; 

class Obstacle {
  
  /** abscisse du coté haut gauche de l'obstacle */
  int x;
  
  /** ordonnée du coté haut gauche de l'obstacle */
  int y;
  
  /** largeur de l'obstacle */
  int o_width;
  
  /** hautueur de l'obstacle */
  int o_height;
  
  /** couleur de l'obstacle */
  int o_color;
  
  /**
   * Initialisation d'un obstacle : tous les attributs prennent des valeurs par défaut.
   *
   * @author    Enzo Mourany
   */
  Obstacle() {
    x = int(random(0, 640));
    y = int(random(0, 400));
    o_width = int(random(20, 70));
    o_height = int(random(20, 60));
    o_color = OBSTACLE_COLOR;
  }
}

/**
*
* Affiche les obstacles
*
* @author       Enzo Mourany
*/
void showObstacle(Obstacle o) {
  do {
    for (int i = 0; i < 5; i++) {
    fill(obstacles[i].o_color);
    rect(obstacles[i].x, obstacles[i].y, obstacles[i].o_width, obstacles[i].o_height);
    }
  } while (o.x < 280 && o.x > 360 && o.x > 80 && o.x < 490 && o.y < 160 && o.y > 240 && o.y < 420);
}
