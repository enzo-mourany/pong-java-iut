/**
 * Détection de collision entre 2 rectangles a et b
 *
 * @param ax rectangle 1 : abscisse du coin haut/gauche
 * @param ay rectangle 1 : ordonnée du coin haut/gauche
 * @param aw rectangle 1 : largeur
 * @param ah rectangle 1 : hauteur
 * @param bx rectangle 2 : abscisse du coin haut/gauche
 * @param by rectangle 2 : ordonnée du coin haut/gauche
 * @param bw rectangle 2 : largeur
 * @param bh rectangle 2 : hauteur
 * @return true si il y a collision entre les deux rectangles, false sinon
 */
boolean collision( int ax, int ay, int aw, int ah,
                   int bx, int by, int bw, int bh)
{
  // il y a collision si les abscisses se chevauchent, ainsi que les ordonnées
  return chevauchementIntervalles(ax, ax+aw, bx, bx+bw)
      && chevauchementIntervalles(ay, ay+ah, by, by+bh);
}

/**
 * Détermine si deux intervalles se chevauchent (s'intersectent).
 *
 * @param a_min borne inférieure du premier intervalle
 * @param a_max borne supérieure du premier intervalle
 * @param b_min borne inférieure du deuxième intervalle
 * @param b_max borne supérieure du deuxième intervalle
 */
boolean chevauchementIntervalles(int a_min, int a_max, int b_min, int b_max)
{
    int plus_grand_min = max(a_min, b_min);
    int plus_petit_max = min(a_max, b_max);
    return plus_grand_min <= plus_petit_max;
}