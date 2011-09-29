﻿package src.shooter {	import flash.display.MovieClip;	import flash.events.Event;	import flash.geom.Point;	import flash.display.BlendMode;		import fl.transitions.Tween;	import fl.transitions.easing.*;	import fl.transitions.TweenEvent;	import flash.filters.GlowFilter;	import flash.filters.BitmapFilterQuality;	import src.shooter.ShooterGameObject;	public class Avatar extends ShooterGameObject {						public var bodyLevel:Number;		public var weaponLevel:Number;		public var abilityLevel:Number;		public var abilityPoints:Number = 1;  //huh?		//Body Stats		//var healthRegen:Number;		//var healthRegenModifier:Number = 1;		var abilityRegen:Number;		var abilityRegenModifier:Number = 1;				public var maxHP:Number;		public var rotationSpeed:Number;		public var alive:Boolean;		var speed:Number;		//var speedModifier:Number = 1;		//var isSlowed:Boolean = false;				public var gun:Gun;		public var wand:Wand;		public var currentWeaponIcon;		//Ability Specific properties		var isBodyEnhanced:Boolean = false;						public function Avatar(){									stop();			head.stop();			body.stop();			legs.stop();			coIcon.visible = false;			/*			var glower:MovieClip = new MovieClip();			glower.graphics.beginFill(0xFF0000, 1);			glower.graphics.drawCircle(0,0,10);			glower.graphics.endFill();			glower.filters = [ new GlowFilter(0xffff00,1,60.0,60.0,1) ]; 			addChildAt(glower, 0);			*/		}				public override function behavior():void{						//abilityModifiers();					}		protected function health(){						//hp += healthRegen * healthRegenModifier;			if (hp > maxHP) { hp = maxHP };					}				//If passed null or current bodyLevel, this function updates bodyStats		//If passed somthing other than the current level, it does NOT update the stats		//It always returns the stats as an object		public function getOrSetBodyStats(_bodyLevel=null){									if (_bodyLevel == null ){				_bodyLevel = bodyLevel;			}									var bodyStats:Object = new Object();			//Get			bodyStats.maxHP = 40 + ( (_bodyLevel) * 10 );			bodyStats.speed = 3 + ( (_bodyLevel) * 0.25 );			bodyStats.rotationSpeed = 4 + ( (_bodyLevel) * 1 );			//bodyStats.healthRegen = 0 + ( (_bodyLevel) * 0.025 );			bodyStats.abilityRegen = 0.5 + ( (_bodyLevel) * 0.25 ); 			//Player bump			if ( this is Player){ 				bodyStats.maxHP += 50;				bodyStats.speed += 3;			}			//Set, if current level			if (_bodyLevel == bodyLevel){				maxHP = bodyStats.maxHP;				speed = bodyStats.speed;				rotationSpeed = bodyStats.rotationSpeed;				//healthRegen = bodyStats.healthRegen;				abilityRegen = bodyStats.abilityRegen;			}					return bodyStats;								}		override public function kill(){						super.kill();						//TODO ADD VARIABLE FOR DEAD FRAME			//Change to dead frame			//gotoAndStop(2);			body.gotoAndStop(2);			head.gotoAndStop(2);			legs.gotoAndStop(2);						this.blendMode = BlendMode.NORMAL;					}				override public function remove(){						super.remove();					}	}}