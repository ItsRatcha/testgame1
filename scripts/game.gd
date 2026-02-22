extends Node2D
@onready var label = $Label
@onready var label2 = $Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	var result = randi_range(1,100)
	label.text = str(result)
	if result > 50:
		label2.text = "you passed"
	else:
		label2.text = ""
