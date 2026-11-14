extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() :
	pass # Replace with function body.

var button_type = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) :
	pass


func _on_start_pressed() :
	button_type = "start"
	$fadetrans.show()
	$fadetrans/Fade_timer.start()
	$fadetrans/AnimationPlayer.play("fadein")
	


func _on_quit_pressed() :
	get_tree().quit()


func _on_fade_timer_timeout() :
	if button_type == "start" :
		get_tree().change_scene_to_file("res://mainaster.tscn")
	
