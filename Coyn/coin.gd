extends MeshInstance3D

@export var ui : CanvasLayer

var rng = RandomNumberGenerator.new()
var shouldreset = false

var states = {
	"inbetween": Vector3(0, 0, 1.56),
	"heads": Vector3(0, 0, 3.3),
	"tails": Vector3(0, 0, 0)
}

var currentstate = states["inbetween"]

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if shouldreset:
			ui.get_node("Label2").text = "Tap to toss"
			currentstate = states["inbetween"]
			shouldreset = false
		else:
			shouldreset = true
			var random_no = rng.randi_range(1, 2)
			
			if random_no == 1:
				currentstate = states["heads"]
				ui.get_node("Label2").text = "You got heads!"
			else:
				ui.get_node("Label2").text = "You got tails! :3"
				currentstate = states["tails"]
	
	rotation = rotation.lerp(currentstate, 0.5)
