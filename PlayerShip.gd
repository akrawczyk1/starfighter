extends Node2D

var bullet = preload("res://bullet.tscn")

#Configurations
const SCREEN_BUFFERZONE = 50
@export var accel : float = 4.0


#size of game window
var screen_size

var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = 0
	screen_size = get_viewport_rect().size
	position = screen_size / 2
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	handle_movement(delta)
	handle_screenwrap()
	handle_bullet()
	

		
func handle_movement(delta) -> void :
	if Input.is_action_pressed("ui_right"):
		rotate(PI * delta)
	if Input.is_action_pressed("ui_left"):
		rotate(-PI * delta)
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2(accel, 0).rotated(rotation)
		$AnimatedSprite2D.frame = 1
	else:
		$AnimatedSprite2D.frame = 0
		
	position += velocity * delta
	

func handle_screenwrap() -> void:
	if position.x > screen_size.x + SCREEN_BUFFERZONE:
		position.x = 0 - SCREEN_BUFFERZONE
		
	if position.x < 0 - SCREEN_BUFFERZONE:
		position.x = screen_size.x + SCREEN_BUFFERZONE
		
	if position.y > screen_size.y + SCREEN_BUFFERZONE:
		position.y = 0 - SCREEN_BUFFERZONE
		
	if position.y < 0 - SCREEN_BUFFERZONE:
		position.y = screen_size.y + SCREEN_BUFFERZONE
	
func handle_bullet() -> void:
	if Input.is_action_pressed("fire"):
		pass
		
		
