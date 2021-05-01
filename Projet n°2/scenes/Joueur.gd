extends KinematicBody2D

var velocite = Vector2(0,0)
var score = 0
const VITESSE = 500
const SAUT = -1050
const GRAVITE = 35

func _physics_process(delta):
	if Input.is_action_pressed("DROITE"):
		velocite.x = VITESSE
		$Sprite.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("GAUCHE"):
		velocite.x = -VITESSE
		$Sprite.play("run")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("saut")
	
	velocite.y = velocite.y + GRAVITE
	
	if Input.is_action_just_pressed("SAUT") and is_on_floor():
		velocite.y = SAUT
	
	velocite = move_and_slide(velocite, Vector2.UP)
	
	velocite.x = lerp(velocite.x, 0, 0.2)


func _on_Area2D_body_entered(body):
	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().reload_current_scene()

func rebond():
	velocite.y = SAUT * 0.7


