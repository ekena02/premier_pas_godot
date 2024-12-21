extends Area2D

signal vie()
var loop = 0
var inc = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("vie", Callable(get_parent().get_node("player_anim"), "vie"))

#<
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if loop<0 or loop>60:
		inc*=-1
	loop+=inc
	scale.x+=inc/100.0
	scale.y+=inc/100.0


func _on_body_entered(body: Node2D) -> void:
	emit_signal("vie")
	queue_free()
