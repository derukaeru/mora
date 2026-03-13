extends Node2D

func _ready():
	$ui/cover.show()
	$ui/cover/AnimationPlayer.play("open")
	await $ui/cover/AnimationPlayer.animation_finished
	$ui/cover.hide()
