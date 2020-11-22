import 'dart:io';

import 'dart:math';

enum Move { bato, papel, gunting }
enum GG { GodMode }
void main() {
  print('Game Initializing...');
  print('Game Start');
  print('Bato, Papel, Gunting intitiated...');

  final rng = Random();

  while (true) {
    stdout.write('Choose your weapon (Bato, Papel, Gunting): ');

    final input = stdin.readLineSync();

    if (input == 'bato' || input == 'BATO' || input == 'Bato' || input == 'papel' || input == 'PAPEL' || input == 'Papel' || 
    input == 'gunting' || input == 'GUNTING' || input == 'Gunting' || input == 'GodMode') {
      var PlayerMove;

      if (input == 'bato' || input == 'BATO' || input == 'Bato') {
        PlayerMove = Move.bato;
        print('You chose Bato ⚫');
      } else if (input == 'papel' || input == 'PAPEL' || input == 'Papel') {
        PlayerMove = Move.papel;
        print('You chose Papel ⬜');
      } else if (input == 'gunting' || input == 'GUNTING' || input == 'Gunting') {
        PlayerMove = Move.gunting;
        print('You chose Gunting ✂');
      } else if (input == 'GodMode') {
      PlayerMove = GG.GodMode; 
        print('You chose GodMode ⚡');
      }

      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      
      if (aiMove == Move.bato) {
        print('AI chose Bato ⚫');
      } else if (aiMove == Move.papel) {
        print('AI chose Papel ⬜');
      } else if (aiMove == Move.gunting) {
        print('AI chose Gunting ✂');
      }

      if (PlayerMove == aiMove) {
        print('Draw');
      } else if (PlayerMove == Move.bato && aiMove == Move.gunting ||
          PlayerMove == Move.papel && aiMove == Move.bato ||
          PlayerMove == Move.gunting && aiMove == Move.papel) {
        print('You Win!');
      } else if (PlayerMove == GG.GodMode && aiMove == Move.bato ||
          PlayerMove == GG.GodMode && aiMove == Move.papel || PlayerMove == GG.GodMode && aiMove == Move.gunting) {
        print('You show no mercy to the AI and automatically win');
      } else {
        print('You Lose!');
      }
    } else if (input == 'stop' || input == 'STOP' || input == 'Stop') {
    print('Game Over'); 
      break;
    } else {
      print('Invalid Weapon');
    }
  }
}
