﻿package src.shooter {	import flash.display.MovieClip;	import flash.display.Shape;	import flash.events.*	import flash.utils.Timer;	import flash.geom.Point;	import flash.display.BlendMode;	import flash.filters.GlowFilter;	import src.core.Game;	public class MegaDrone extends ShooterGameObject{		//Stats		var weaponLevel:Number = 1;		var dropsMine:Boolean = false;		var targetAngle:Number;		var shootTimer:Timer;		var fireCount:int;		public var speed:Number = 8;		//var maxHp:Number = 125;		var gun:Gun;		var gun2:Gun;		var gun3:Gun;		//var wand:Wand;				//		var shooter;//		var friendly:Boolean;		public function MegaDrone(_shooter, _weaponLevel, _dropsMine){						//ShooterGame.droneList.push(this);			shooter = _shooter;			weaponLevel = _weaponLevel;			dropsMine = _dropsMine;			x = 200 + ( Math.random() * 240 );			y = 120 + ( Math.random() * 240 );			rotation = Math.random() * 360;									friendly = shooter.friendly;			gun = new Gun(this);			addChild(gun);			gun2 = new Gun(this);			addChild(gun2);			gun3 = new Gun(this);			addChild(gun3);			shootTimer = new Timer(1200, 9);			shootTimer.addEventListener(TimerEvent.TIMER, shoot,false,0,true);			shootTimer.addEventListener("timerComplete", selfDestruct,false,0,true);			shootTimer.start();						//Effect			var effect:AbilityEffect = new AbilityEffect("green");			effect.x = x;			effect.y = y;			Game.currentLevel.middleLayer.addChild(effect);					}		public override function behavior():void{			//Find the target angle			//targetAngle = Math.random() * 360;			droneProps.rotation -= 71;			//trace(droneProps.rotation);			move();		}		public function move(){						/*			targetAngle = Math.atan((y -240)/(x - 320)) * (180/Math.PI);			targetAngle = targetAngle + 90;			//Convert to weird 180 flash angles			if ( 320 < x ){				targetAngle = -1 * (180 - targetAngle);			}						y += speed * Math.sin((targetAngle - 0) * (Math.PI / 180));			x += speed * Math.cos((targetAngle - 0) * (Math.PI / 180));			*/						rotation += 5;			targetAngle = rotation;					}					public function shoot(e:TimerEvent){			//Shoot or Drop Grenade			if ( dropsMine && Math.random() < 0.25 ){				//trace("grenade baby");				var mine:Mine = new Mine(this);				//Game.magicList.push(trap);				Game.currentLevel.addChild(mine);			}			else {				gun.shoot(targetAngle-15);				gun2.shoot(targetAngle);				gun3.shoot(targetAngle+15);			}		}		private function selfDestruct(e:TimerEvent){			kill();		}		override public function kill(){			var effect:AbilityEffect = new AbilityEffect("green");			effect.x = x;			effect.y = y;			Game.currentLevel.middleLayer.addChild(effect);			remove();					}		override public function remove(){			//take away the gun			if ( gun != null ){				gun.remove();			}			//Remove Listeners			shootTimer.removeEventListener(TimerEvent.TIMER, shoot);			shootTimer.removeEventListener("timerComplete", selfDestruct);						//Back to normal look						this.blendMode = BlendMode.NORMAL;			//Search list and delete from array//			for(var i=0; i < ShooterGame.droneList.length; i++)//			{//				if( ShooterGame.droneList[i]==this) { ShooterGame.droneList.splice(i,1) };//			}					//trace("drone removed");			super.remove();					}	}}