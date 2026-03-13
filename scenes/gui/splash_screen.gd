extends Control

func _ready():
	$AnimationPlayer.play("show")
	await $AnimationPlayer.animation_finished
	Global.change_scene("res://scenes/gui/title_screen.tscn")
