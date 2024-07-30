extends Area2D

var screen_size

var velocity: Vector2

func _init(v = Vector2(0, 0), pos = Vector2(0, 0)):
	velocity = v
	position = pos
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	$KillTimer.wait_time = 4
	$KillTimer.start()
	$AnimatedSprite2D.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	


func _on_kill_timer_timeout():
	queue_free()
	
func set_initial_params(v, pos):
	velocity = v
	position = pos
