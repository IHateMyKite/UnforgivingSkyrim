;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname US_TIF__0C1FA6EB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;dress up here
GRQE.LockBoundCuntCollar(akSpeaker)
GRQE.LockRandomArmRestraint(akSpeaker)
GRQE.LockRandomGag(akSpeaker)
GRQE.GRQ.Masochism = GRQE.GRQ.Masochism + 1
GRQE.USlibs.IncreaseSLFame(aiMasochist = 3, aiSlave = 3, aiSlut = 1, aiWhore = 1)
Utility.Wait(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;start lesbian sex scene
USlibs.DHLPSuspend() 

USlibs.UDCDmain.DisableActor(Game.GetPlayer())
Game.SetPlayerAIDriven(true)

Actor[] loc_SLActors = new Actor[2]
sslBaseAnimation[] loc_SLAnim    
loc_SLActors[0] = Game.GetPlayer()
loc_SLActors[1] = akSpeaker

If loc_SLAnim.Length == 0
    loc_SLAnim = UDmain.libs.SelectValidDDAnimations(loc_SLActors, 2, false, "Lesbian")
EndIf

If loc_SLAnim.Length > 0
    UDmain.libs.SexLab.StartSex(Positions = loc_SLActors, Anims = loc_SLAnim, Victim = Game.GetPlayer())
endif

while UDmain.libs.IsAnimating(Game.GetPlayer())
    Utility.Wait(1)
endwhile

USlibs.UDCDmain.EnableActor(Game.GetPlayer())
Game.SetPlayerAIDriven(false)
USlibs.DHLPResume()

int loc_relation = akSpeaker.GetRelationshipRank(Game.GetPlayer())
if loc_relation < 4
    akSpeaker.SetRelationshipRank(Game.GetPlayer(), loc_relation + 1)
endif

MasoSpell.Cast(Game.GetPlayer())
UDmain.Print("You feel strangely invigorated by this encounter!")

;akSpeaker.Say(Reward)
ActorUtil.AddPackageOverride(akSpeaker,RewardFG,99)
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

UnforgivingDevicesMain Property UDmain auto

US_libs Property USlibs auto

Ingredient Property BlackGoo auto

US_GooResearch_Script Property GRQ auto

Topic Property Reward auto

Package Property RewardFG auto

Spell Property MasoSpell auto

US_GRQ_Enchanting_Quest_script Property GRQE auto
