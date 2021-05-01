extends KinematicBody2D

var vitesse = 80
var velocite = Vector2()
export var direction = -1 

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x  * direction
	
func _physics_process(delta):
	if is_on_wall() or not $RayCast2D.is_colliding() and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x  * direction
	velocite.y += 20
	velocite.x = vitesse * direction
	velocite = move_and_slide(velocite, Vector2.UP) 


func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("mort")
	vitesse = 0
	set_collision_layer_bit(3,false)
	set_collision_mask_bit(0,false)
	$Area2D.set_collision_layer_bit(3,false)
	$Area2D.set_collision_mask_bit(0,false)
	$Area2D2.set_collision_layer_bit(3,false)
	$Area2D2.set_collision_mask_bit(0,false)
	$Timer.start()
	body.rebond()
	$AudioStreamPlayer.play()
	
func _on_Area2D2_body_entered(body):
	get_tree().reload_current_scene()

func _on_Timer_timeout():
	queue_free()
