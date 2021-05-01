extends Area2D

signal score

func _on_or_body_entered(body):
	$AnimationPlayer.play("or_anim")
	emit_signal("score")
	set_collision_mask_bit(0,false)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


