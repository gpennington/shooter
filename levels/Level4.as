﻿package src.shooter.levels {	import flash.display.MovieClip;	import flash.events.Event;	import src.core.Game;	import src.shooter.Obstacle;	//import src.shooter.Powerup;	import src.shooter.Enemy;	public class Level4 extends Level{		public function Level4(playerX, playerY, playerDirection){			super(playerX, playerY, playerDirection);					}		override function waitForAdded(e:Event){			super.waitForAdded(e);						//Next Level			nextLevel.x = 360;			nextLevel.y = 480;			nextLevel.rotation = 90;									//Walls			var wall0:Obstacle = new Obstacle("junglewall",0,0,0,0);			bottomLayer.addChild(wall0);			var wall1:Obstacle = new Obstacle("junglewall",320,0,0,0);			bottomLayer.addChild(wall1);			var wall4:Obstacle = new Obstacle("junglewall",640,0,0,0);			wall4.rotation = 90;			bottomLayer.addChild(wall4);			var wall5:Obstacle = new Obstacle("junglewall",640,320,0,0);			wall5.rotation = 90;			bottomLayer.addChild(wall5);						var iwall1:Obstacle = new Obstacle("iwall",0,0,40,480);			bottomLayer.addChild(iwall1);						var iwall2:Obstacle = new Obstacle("iwall",0,440,640,40);			bottomLayer.addChild(iwall2);			//Obstacles			var crate0:Obstacle = new Obstacle("crate", 250,175,0,0,true,false,true);			bottomLayer.addChild(crate0);			var crate2:Obstacle = new Obstacle("crate", 360,240,0,0,true,false,true);			bottomLayer.addChild(crate2);			var crate3:Obstacle = new Obstacle("crate", 427,360,0,0,true,false,true);			bottomLayer.addChild(crate3);						//Enemies			var enemy0:Enemy = new Enemy(313,171, 1, 3, null);			topLayer.addChild(enemy0);			var enemy1:Enemy = new Enemy(413,232, 1, 1, null);			topLayer.addChild(enemy1);			var enemy2:Enemy = new Enemy(503,383, 1, 3, null);			topLayer.addChild(enemy2);		}		override function exitTrigger(){			super.exitTrigger();						Game.gameRef.loadLevel("level5", false); 		}			}}