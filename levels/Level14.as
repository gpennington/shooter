﻿package src.shooter.levels {	import flash.display.MovieClip;	import flash.events.Event;	import src.core.Game;	import src.shooter.Obstacle;	import src.shooter.Enemy;	public class Level14 extends Level{		public function Level14(playerX, playerY, playerDirection){			super(playerX, playerY, playerDirection);		}		override function waitForAdded(e:Event){			super.waitForAdded(e);						//Next Level			nextLevel.x = 250;			//nextLevel.y = 0;			nextLevel.rotation = -90;			//Walls			var leftWall1:Obstacle = new Obstacle("junglewall",0,160,0,0);			leftWall1.rotation = -90;			bottomLayer.addChild(leftWall1);						var leftWall2:Obstacle = new Obstacle("junglewall",0,640,0,0);			leftWall2.rotation = -90;			bottomLayer.addChild(leftWall2);									//river			var rightIWall:Obstacle = new Obstacle("iwall",490,0,150,480,false,false,false,true);			bottomLayer.addChild(rightIWall);			var topIWall:Obstacle = new Obstacle("iwall",0,0,640,40);			bottomLayer.addChild(topIWall);			var leftIWall:Obstacle = new Obstacle("iwall",0,0,40,480);			bottomLayer.addChild(leftIWall);			var bottomIWall:Obstacle = new Obstacle("iwall",0,440,640,40);			bottomLayer.addChild(bottomIWall);//			//Obstacles//			var crate0:Obstacle = new Obstacle("crate", 421, 54,0,0,true,false,true);//			bottomLayer.addChild(crate0);////			var crate1:Obstacle = new Obstacle("crate", 445,199,0,0,true,false,true);//			bottomLayer.addChild(crate1);//			//			var crate2:Obstacle = new Obstacle("crate", 413,344,0,0,true,false,true);//			bottomLayer.addChild(crate2);////			var tree0:Obstacle = new Obstacle("treetrunk", 196,249,0,0);//			tree0.rotation = -90;//			bottomLayer.addChild(tree0);////			//			//			//Enemies//			var enemy0:Enemy = new Enemy(490,43, 1, 1, null, "", "stationary");//			topLayer.addChild(enemy0);////			var enemy1:Enemy = new Enemy(435,120, 1, 1, null, "", "stationary");//			topLayer.addChild(enemy1);////			var enemy2:Enemy = new Enemy(516,193, 1, 1, null, "", "stationary");//			topLayer.addChild(enemy2);////			var enemy3:Enemy = new Enemy(430,274, 1, 1, null, "", "stationary");//			topLayer.addChild(enemy3);////			var enemy4:Enemy = new Enemy(488,340, 1, 1, null, "", "stationary");//			topLayer.addChild(enemy4);		}		override function exitTrigger(){			super.exitTrigger();						Game.gameRef.loadLevel("level15", false);		}	}}