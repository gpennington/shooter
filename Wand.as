﻿package src.shooter {	import flash.display.MovieClip;		import src.core.Game;		public class Wand extends MovieClip{		//More Sounds		var s_fire:SoundFire = new SoundFire();		var shooter;		var wand:String;				public function Wand(_shooter, _wand){									shooter = _shooter;									wand = _wand;		}		public function shoot(where){									//TODO LOOK AT THESE.  DO I NEED THEM?			var spread:Number = 0;			var effect:AbilityEffect;						switch (wand){				case "fire":									//Effect					effect = new AbilityEffect("red");					effect.x = shooter.x;					effect.y = shooter.y;					Game.currentLevel.middleLayer.addChild(effect);									//LAUNCH FIREBALLS - LEVEL 1					var explosiveFireballs = false;					if ( shooter.abilityLevel >= 7 && shooter.abilityPoints >= 200 ){						explosiveFireballs = true;					}										var fireball:Fireball;					//One straight on					fireball = new Fireball(shooter, where, explosiveFireballs);					//Game.magicList.push(fireball);					Game.currentLevel.middleLayer.addChild(fireball);					s_fire.play();					//Others on either side					var spreadLeft:Number = 0;					var spreadRight:Number = 0;					var f:int=1;					for (f; f < shooter.abilityLevel; f++){												if ( (f & 1) == 0 ) { // even							spreadRight += 15;							spread = spreadRight;						}						else { //odd							spreadLeft -= 15;							spread = spreadLeft;						}						fireball = new Fireball(shooter, where + spread, explosiveFireballs);						//Game.magicList.push(fireball);						Game.currentLevel.middleLayer.addChild(fireball);					}										//FIRE IMBUED BULLETS - Level 3					if ( shooter.abilityLevel >= 3 && shooter.abilityPoints >= 100 ){						shooter.gun.isFireImbued = true;					}										//LAUNCH NOVA - Level 5					if (shooter.abilityLevel >= 5 && shooter.abilityPoints >= 150 ){												var firenova = new FireNova(shooter); 						//Game.magicList.push(firenova);						Game.currentLevel.middleLayer.addChild(firenova);					}															//EXPLODING FIREBALLS - Level 7					//SEE LEVEL 1					//FIRE BIRD!!! - Level 9					if ( shooter.abilityLevel >= 9 && shooter.abilityPoints >= 299 ){						var firebird = new Firebird(shooter);						Game.currentLevel.topLayer.addChild(firebird);					}					break;				case "ice":									//Effect					effect = new AbilityEffect("blue");					effect.x = shooter.x;					effect.y = shooter.y;					Game.currentLevel.middleLayer.addChild(effect);  									//LAUNCH ICESPIKES - Level 1					var explosiveIceSpikes = false;					if ( shooter.abilityLevel >= 7 && shooter.abilityPoints >= 200 ){						explosiveIceSpikes = true;					}					var ice:IceSpike;					var numSpikes = shooter.abilityLevel*2;					for (var shot=0; shot<numSpikes; shot++){						spread = (360 / numSpikes) * shot;						ice = new IceSpike(shooter, where + spread, explosiveIceSpikes, true);						//Game.magicList.push(ice);						Game.currentLevel.middleLayer.addChild(ice);					}					s_fire.play();										//ENHANCE BODY - Level 3					if ( shooter.abilityLevel >= 3 && shooter.abilityPoints >= 100 ){						//shooter.enhanceBody();					}										//CREATE ICE SHIELD - Level 5					if (shooter.abilityLevel >= 5  && shooter.abilityPoints >= 150){						if ( shooter.hasIceShield ){ // if they already have one							for(var i=0; i < ShooterGame.magicList.length; i++) //find it and remove it							{								//trace(ShooterGame.magicList[i]);								if( ShooterGame.magicList[i] is IceShield && ShooterGame.magicList[i].shooter == shooter ) {									ShooterGame.magicList[i].remove();								}							}						}												var iceShield:IceShield = new IceShield(shooter);						//Game.magicList.push(iceShield);						Game.currentLevel.middleLayer.addChild(iceShield);						shooter.hasIceShield = true;					}										//SHATTERING SPIKES - Level 7					//SEE LEVEL 1										//GIANT SNOW BALL - Level 9										break;									case "mech":									//Effect					effect = new AbilityEffect("green");					effect.x = shooter.x;					effect.y = shooter.y;					Game.currentLevel.middleLayer.addChild(effect);  									//LAUNCH DRONE - Level 1, 3 and 7										//Add a new one? Or Delete the oldest one THEN add a new one?					if ( ShooterGame.droneList.length < shooter.abilityLevel ){						//do nothing.  add another.					}					else{						ShooterGame.droneList[0].kill();					}										var explosiveDrone = false;					var droneWeaponLevel:int = 1;					if ( shooter.abilityLevel >= 3 && shooter.abilityPoints >= 100 ){						droneWeaponLevel = 3;					}					if ( shooter.abilityLevel >= 7 && shooter.abilityPoints >= 200 ){						explosiveDrone = true;					}					var drone:Drone = new Drone(shooter, droneWeaponLevel, explosiveDrone);					Game.currentLevel.topLayer.addChild(drone);					s_fire.play();										//UPGRADE DRONES - Level 3					//SEE LEVEL 1															//CREATE TRAP - Level 5					if (shooter.abilityLevel >= 5 && shooter.abilityPoints >= 150){						var mine:Mine = new Mine(shooter);						//Game.magicList.push(trap);						Game.currentLevel.middleLayer.addChild(mine);					}										//UPGRADE DRONES - Level 7					//SEE LEVEL 1										//MEGA DRONE - Level 9					if ( shooter.abilityLevel >= 9 && shooter.abilityPoints >= 299 ){						var megaDrone:MegaDrone = new MegaDrone(shooter, 9, false);						Game.currentLevel.topLayer.addChild(megaDrone);					}										break;			}					}// end cast						public function remove(){										Game.remove(this);		}			}		}