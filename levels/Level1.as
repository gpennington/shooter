﻿package src.shooter.levels {	import flash.display.MovieClip;	import flash.events.Event;	import src.core.Game;	import src.shooter.Obstacle;	public class Level1 extends Level{		public function Level1(playerX, playerY, playerDirection){			super(playerX, playerY, playerDirection);		}		override function waitForAdded(e:Event){			super.waitForAdded(e);			//Next Level			nextLevel.x = 250;			//nextLevel.y = 0;			nextLevel.rotation = -90;			//Walls						var wall0:Obstacle = new Obstacle("junglewall",0,320,0,0);			wall0.rotation = -90;			bottomLayer.addChild(wall0);			var wall1:Obstacle = new Obstacle("junglewall",0,640,0,0);			wall1.rotation = -90;			bottomLayer.addChild(wall1);			var wall2:Obstacle = new Obstacle("junglewall",640,0,0,0);			wall2.rotation = 90;			bottomLayer.addChild(wall2);			var wall3:Obstacle = new Obstacle("junglewall",640,320,0,0);			wall3.rotation = 90;			bottomLayer.addChild(wall3);			var iwall1:Obstacle = new Obstacle("iwall",0,0,640,40);			bottomLayer.addChild(iwall1);			var iwall2:Obstacle = new Obstacle("iwall",0,440,640,40);			bottomLayer.addChild(iwall2);			//Obstacles						//Enemies		}		override function exitTrigger(){			super.exitTrigger();			//var level2 = new Level2();			Game.gameRef.loadLevel("level2", false);		}	}}