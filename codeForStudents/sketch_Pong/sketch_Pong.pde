// Constantes - Couleurs //<>//

final color NOIR = color(0);
final color BLANC = color(255);
final color ROUGE = color(255, 0, 0);
final color VERT = color(0, 255, 0);
final color BLEU = color(0, 0, 255);

// Autres contantes et variables
final int sizeFont = 32;
PFont font;

/**------------ Sprites (images) -------------*/

/** Image balle */
PImage imgBall;

/** Images raquettes */
PImage imgRacket1;
PImage imgRacket2;

/** Image background */
PImage imgBackground;
PImage imgBackgroundMenu;

/** Image boutons (menu de jeu) */
PImage imgButtons;

//** Liste de Balles */
Ball[] balls;

/** Liste d'obstacles */
Obstacle[] obstacles;

/**-------------- Etat du jeu ----------------*/

/** Gestion de la pause */
boolean onBreak = false;

/** La balle */
Ball ball;

/** Les raquettes */
Racket racket1;
Racket racket2;

/** Les joueurs */
Player player1;
Player player2;


/**
 * Fonction d'initialisation Processing.
 */
void setup()
{
  size(640, 400);

  // on initialise nos objets
  balls = new Ball[5];
  for (int i = 0; i < 5; i++) {
    balls[i] = new Ball();
  }

  racket1 = new Racket();
  racket2 = new Racket();
  player1 = new Player();
  player2 = new Player();
  
  obstacles = new Obstacle[5];
  for (int i = 0; i < 5; i++) {
    obstacles[i] = new Obstacle();
  }

  // parametre les coordonnées de la raquette 2
  racket2.x = width - BORDER_SPACE;

  // chargement de la police d'écriture
  font = loadFont("AlNile-48.vlw");
  textFont(font, sizeFont);

  // Chargement des sprites
  imgBall = loadImage("ball.png");
  imgRacket1 = loadImage("player01.png");
  imgRacket2 = loadImage("player02.png");
  imgBackground = loadImage("background.jpg");
  imgBackgroundMenu = loadImage("fond.png");
  imgButtons = loadImage("button.png");
  image(imgButtons, 145, 120);
}

/**
 * Fonction de rafraichissement Processing.
 */
void draw() {
  
  if (inTheMenu == true) {
    background(imgBackgroundMenu);
    displayButtons();
    if (mousePressed && mouseX >= 145 && mouseX <= 295 && mouseY >= 120 && mouseY <= 180) {
      exit();
    } else if (mousePressed && mouseX >= 145 && mouseX <= 295 && mouseY >= 200 && mouseY <= 260) {
      inTheMenu = false;
    } else if (mousePressed && mouseX >= 345 && mouseX <= 495 && mouseY >= 120 && mouseY <= 180) {
      inTheMenu = false;
      numberBall = 4;
    }
  } else {
    background(imgBackground);
    if (numberBall == 1) {
      for (int i = 0; i < numberBall; i++) {
        showBall(balls[i]);
        moveBall(balls[i]);
        checkPoint();
        displayScore();
        collisionWithObstables(balls[i]);
        showObstacle(obstacles[i]);
      }
    } else if (numberBall == 4) {
      for (int i = 0; i < numberBall; i++) {
        showBall(balls[i]);
        moveBall(balls[i]);
        checkPoint();
        displayScore();
        collisionWithObstables(balls[i]);
        showObstacle(obstacles[i]);
      }
    }
    showRacket(racket1, racket2);
    moveRacket();
    
    
    
  }
}
