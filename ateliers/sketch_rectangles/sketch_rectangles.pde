// quelques couleurs utiles
final color
  BRIGHT_BLUE = color(190, 240, 255), 
  SEMI_GREEN = color(10, 155, 20), 
  MOSTLY_ORANGE = color(255, 80, 10);

// variables pour la gestion de la souris
boolean souris;
int precX, precY;
// variables pour manipuler les rectangles
Rectangle rVert, rOrange, rSelect;

/**
 * Rectangle avec couleur.
 */
class Rectangle {
  int x;
  int y;
  int largeur;
  int hauteur;
  color col; 

  /**
   * Constructeur de rectangle.
   */
  Rectangle(int xR, int yR, int lR, int hR, color cR) {
    x = xR;
    y = yR;
    largeur = lR;
    hauteur = hR;
    col = cR;
  }
}

/**
 * Appartenance d'un point a un rectangle.
 * @param x abscisse
 * @param y ordonnee
 * @param r rectangle
 * @return vrai ssi (x, y) dans r (frontiere incluse)
 */
boolean estDans(int x, int y, Rectangle r) {
  if (x <= r.x && y <= r.y) {
    return true;
  } else {
    return false;
  }
}

/**
 * Modifie la position d'un rectangle.
 * @param x destination-x
 * @param y destination-y
 * @param r rectangle
 */
void bouger(int x, int y, Rectangle r) {
  r.x = x;
  r.y = y;
}

/**
 * Modifie la taille d'un rectangle.
 * @param dx modificateur relatif largeur
 * @param dy modificateur relatif hauteur
 * @param r rectangle
 */
void changer(int dx, int dy, Rectangle r) {
  r.largeur += dx;
  r.hauteur += dy;
}


/**
 * Dessine un rectangle.
 * @param r rectangle
 */
void dessiner(Rectangle r) {
  if (souris && r.col == rSelect.col) {
    fill(BRIGHT_BLUE);
  } else {
    fill(r.col);
  }
  rect(r.x, r.y, r.largeur, r.hauteur);
}

void setup() {
  size(640, 480);
  rVert = new Rectangle(10, 20, 60, 80, SEMI_GREEN);
  rOrange = new Rectangle(200, 250, 300, 120, MOSTLY_ORANGE);
}

void mousePressed() {
  if (!souris) {
    if (estDans(mouseX, mouseY, rVert)) {
      souris = true;
      rSelect = rVert;
    } else if (estDans(mouseX, mouseY, rOrange)) {
      souris = true;
      rSelect = rOrange;
    }
    precX = mouseX;
    precY = mouseY;
  } else {
    if (estDans(mouseX, mouseY, rVert) && rSelect.col == rVert.col) {
      changer(mouseX-precX, mouseY-precY, rVert);
    } else if (estDans(mouseX, mouseY, rOrange) && rSelect.col == rOrange.col) {
      changer(mouseX-precX, mouseY-precY, rOrange);
    } else {
      bouger(mouseX, mouseY, rSelect);
    }
    souris = false;
  }
}

void draw() {
  background(0);
  dessiner(rVert);
  dessiner(rOrange);
}
