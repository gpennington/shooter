﻿package src.shooter {	import flash.display.MovieClip;	import flash.events.Event;	import flash.utils.Timer;	//import flash.geom.Point;	import src.core.Game;	public class Radio extends MovieClip{		//public var wandProps:Object;		//var fromEnemy:Boolean;		//var friendly:Boolean;				//var burstWhere:Number;		//var burst:Timer;		//var b:int = 0;		var s_fire:SoundFire = new SoundFire();		var shooter;		var radioTimer:Timer;				public function Radio(s){									shooter = s;			//x = shooter.x;			//y = shooter.y;						trace("got this radio");						//On Frame 			addEventListener(Event.ADDED_TO_STAGE, waitForAdded);			function waitForAdded(e:Event):void	{				removeEventListener(Event.ADDED_TO_STAGE, waitForAdded);				addEventListener(Event.ENTER_FRAME, onFrame);			}		}		private function onFrame(e:Event){		}						public function call(){						//			var signal:RadioSignal = new RadioSignal();//			Game.currentLevel.addChild(signal);//			signal.x = x;//			signal.y = y;						var pu:PopUp = new PopUp("We need backup!");			Game.currentLevel.topLayer.addChild(pu);			pu.x = shooter.x;			pu.y = shooter.y;						var enemy1:Enemy = new Enemy(Game.currentLevel.spawnPoint.x,Game.currentLevel.spawnPoint.y, 1, 1, null);			Game.currentLevel.topLayer.addChild(enemy1);								}						public function remove(){							//Remove Listeners			removeEventListener(Event.ENTER_FRAME, onFrame);			//remove the display object			Game.remove(this);		}			}		}