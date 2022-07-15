extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
var spd = 10
var dice = load("res://Scenes/dice.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector3(Input.get_axis("Left","Right"),0,Input.get_axis("Forward","Backward"))
	var dir = movement.normalized()
	move_and_collide(movement * spd * delta)
	var pos = self.transform.origin
	if Input.is_action_just_pressed("Dice"):
		var instance = dice.instance()
		instance.transform.origin = instance.transform.origin + Vector3(0,1,0)
		instance.linear_velocity = dir * 10;
		instance.angular_velocity = Vector3(dir.z,0,-dir.x) * 10
		self.add_child(instance)
