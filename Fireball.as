﻿package src.shooter {	import flash.display.MovieClip;	import flash.events.*	import flash.filters.GlowFilter;	import src.core.Game;	public class Fireball extends Projectile{		public function Fireball(_shooter, _angle, _isExplosive){			super(_shooter, _angle, speed, damage);			//trace(_shooter);			//Props			speed = 12;			damage = 20;			isExplosive = _isExplosive;							life = 96;						//Glow effect			var glow:GlowFilter = new GlowFilter(0xFF5A3C, 0.5, 15, 15, 5);			var filtersArray = [glow];			var glower:MovieClip = new MovieClip();			glower.graphics.beginFill(0xFF5A3C, 0.5);			glower.graphics.drawCircle(0,0,5);			glower.graphics.endFill();			glower.filters = filtersArray;			addChildAt(glower, 0);			var glow2:GlowFilter = new GlowFilter(0xffff00, 0.4, 40,40,15,2);			var filtersArray2 = [glow2];			var glower2:MovieClip = new MovieClip();			glower2.graphics.beginFill(0xffff00, 0.4);			glower2.graphics.drawCircle(0,0,5);			glower2.graphics.endFill();			glower2.filters = filtersArray2;			addChildAt(glower2, 0);			//shooter = _shooter;			//trace(shooter);		}		override public function move(){						super.move();						//speed x radians			y += speed * Math.sin((angle - 90) * (Math.PI / 180));			x += speed * Math.cos((angle - 90) * (Math.PI / 180));					}		override public function kill(){						//7th Level Ability Power			if ( isExplosive && Math.random() < 0.5 ){				//Add Explode				var explosion:Explosion = new Explosion(3, shooter.friendly);				explosion.x = x;				explosion.y = y;				Game.currentLevel.topLayer.addChild(explosion);			}			super.kill();					}		override public function remove(){			//Remove from Array//			for(var i=0; i < ShooterGame.magicList.length; i++)//			{//				if( ShooterGame.magicList[i]==this) { ShooterGame.magicList.splice(i,1) };//			}						super.remove();							}			}}