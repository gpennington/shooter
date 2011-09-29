﻿package src.shooter {	import flash.display.MovieClip;	import flash.events.*	import flash.filters.GlowFilter;	import src.core.Game;	public class IceSpike extends Projectile{				var s_fire:SoundFire = new SoundFire();		var isReversing:Boolean;			public function IceSpike(_shooter, _angle, _isExplosive, _isReversing){			speed = 10;			//if ( _isReversing ){				//speed = 10;			//}			damage = 15;						super(_shooter, _angle, speed, damage);			//ShooterGame.magicList.push(this);			isExplosive = _isExplosive;			isReversing = _isReversing;						life = 96;						//Glow effect			var glow:GlowFilter = new GlowFilter(0x9999ff, 0.5, 15, 15, 5);			var filtersArray = [glow];			var glower:MovieClip = new MovieClip();			glower.graphics.beginFill(0x9999ff, 0.5);			glower.graphics.drawCircle(0,0,5);			glower.graphics.endFill();			glower.filters = filtersArray;			addChildAt(glower, 0);		}		override public function move(){			super.move();			//speed x radians			y += speed * Math.sin((angle - 90) * (Math.PI / 180));			x += speed * Math.cos((angle - 90) * (Math.PI / 180));						//			if ( isReversing ){//				speed -= 0.75;//				//				//Rotate it properly//				if ( speed < 0){//					rotation = angle + 180;//				}//			}				}		override public function kill(){						//7th Level Ability Power			//Explose into more spikes			if ( isExplosive && Math.random() < 0.25 ){				//Visibly Shatter				var effect = new AbilityEffect("blue");				effect.x = x;				effect.y = y;				Game.currentLevel.middleLayer.addChild(effect);  												var ice:IceSpike;				var numSpikes = shooter.abilityLevel;				for (var shot=0; shot<numSpikes; shot++){					var spread = (360 / numSpikes) * shot;					ice = new IceSpike(this, angle + spread, false, false);					//Game.magicList.push(ice);					Game.currentLevel.middleLayer.addChild(ice);				}				//s_fire.play();			}			super.kill();					}		override public function remove(){			//Remove from Array			for(var i=0; i < ShooterGame.magicList.length; i++)			{				if( ShooterGame.magicList[i]==this) { ShooterGame.magicList.splice(i,1) };			}						super.remove();		}			}}