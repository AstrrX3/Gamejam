extends CanvasLayer

func trans(target: String):
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("fade")
	
func reload_scene():
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	get_tree().reload_current_scene()
	await get_tree().create_timer(0.3).timeout
	$AnimationPlayer.play_backwards("fade")
  
func load_scene(target: String):
	#$AnimationPlayer.play("fade")
	#$AudioStreamPlayer2D.play()
	#await $AnimationPlayer.animation_finished
	#await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file(target)
	#$AnimationPlayer.play_backwards("fade")
