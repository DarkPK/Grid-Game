void fullOutMonMove() {
  //directs the monster movement
  if (charX < monsterX) {
    moveMonsterD();
  }
  else if (charX > monsterX) {
    moveMonsterU();
  }
}