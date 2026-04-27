extends CharacterBody2D

var mobspeed = 35
var direction = Vector2(0,1)
var hornet_decimalnumber = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hornet_decimalnumber = randi_range(1,255)
	print("Hornet spawned:", hornet_decimalnumber)
	add_to_group("hornets")
	$Label.text = str(hornet_decimalnumber)
	$AnimatedSprite2D.play("hornet")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	direction = Vector2(0,1)
	velocity = direction * mobspeed
	move_and_slide()

func explode():
	$AnimatedSprite2D.play("death")
	$CollisionShape2D.hide()
	$Label.hide()

func _on_animated_sprite_2d_animation_finished():
	queue_free()
