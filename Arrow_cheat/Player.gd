extends Area2D

# signals
signal shot_failed
signal shot_hit

# rotation speed
export var rot_speed = 1.5
export var shoot_speed = 300

# aim for shoot
var aim = 1
var hit_target = false
var active = false

var velocity = Vector2()

func _ready():
	hide()
	
# update
func _process(delta):
	
	# rotation direction
	var rot_dir = 1
	
	# update rotation
	rotation += rot_dir * rot_speed * delta * aim
	
	if Input.is_action_pressed("ui_accept") and active:
		aim = 0
		velocity = Vector2(0, -shoot_speed).rotated(rotation)
	
	if not hit_target:
		position += velocity * delta
		


func start(pos):
	velocity = Vector2()
	aim = 1
	hit_target = false
	position = pos
	show()
	$CollisionPolygon2D.disabled = false


func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("shot_failed")


func _on_Player_body_entered(body):
	emit_signal("shot_hit")


func _on_Player_area_entered(area):
	emit_signal("shot_hit")
	hit_target = true
