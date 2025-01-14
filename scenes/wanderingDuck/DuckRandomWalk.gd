# use for every duck object that wanders around
extends KinematicBody2D

var speed = 100
var timer = 2.0
var walk_ready = true
var walking = false
var direction = Vector2(rand_range(-10, 10), rand_range(-10, 10)).normalized()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	walk_ready = true
	walking = false
	randomize()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if walk_ready:
		direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
		start_timer()
	if walking:
		move_and_slide(direction * speed)
func start_timer():
	# Start the timer called WalkTimer to wait for 2 seconds
	print("walking")
	$WalkTimer.start(timer)
	walking = true
	walk_ready = false

func _on_WalkTimer_timeout():
	# When the timer finishes, choose a new direction and restart the timer
	print("changing direction")
	walk_ready = true
	walking = false
