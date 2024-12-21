extends Area2D

signal touchee()
var loop = 0
@export var loop_final:int = 120
@export var speed:int=2
var inc = 1
@onready var enemi_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("touchee", Callable(get_parent().get_node("player_anim"), "touchee")) # Replace with function body.

#<
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if loop<0 or loop>loop_final:
		inc *=-1
	self.position.x +=inc*speed
	loop+=inc
	enemi_sprite.flip_h = inc<0
	enemi_sprite.play("default")
	


func _on_body_entered(body: CharacterBody2D) -> void:
	emit_signal("touchee")
	queue_free()
