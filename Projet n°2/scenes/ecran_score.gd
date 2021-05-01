tool
extends CanvasLayer

var score = 0

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var next_scene: PackedScene


func _ready():
	$score.text = String(score)

func _on_score():
	score +=1
	_ready()
	if score == 100:
		teleport()
	
func _get_configuration_warning() -> String:
	return "You must have a next scene." if not next_scene else ""

func teleport() -> void:
	anim_player.play("end")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
