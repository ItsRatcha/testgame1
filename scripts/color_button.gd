extends Button

@onready var label: Label = $Label

var colors = [
	Color("#8ab060"),
	Color("b45252"),
	Color("4b80ca"),
	Color("cf8acb")
]

var color_index = 0

var style := StyleBoxFlat.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_color(colors[color_index])
	update_label()

func apply_color(color: Color):
	var style = StyleBoxFlat.new()
	style.bg_color = color
	
	var hover_style = StyleBoxFlat.new()
	hover_style.bg_color = color.darkened(0.1)
	
	var pressed_style = StyleBoxFlat.new()
	pressed_style.bg_color = color.darkened(0.3)
	
	add_theme_stylebox_override("normal", style)
	add_theme_stylebox_override("hover", hover_style)
	add_theme_stylebox_override("pressed", pressed_style)
	add_theme_stylebox_override("focus", style)

func _pressed() -> void:
	color_index = (color_index + 1) % colors.size()
	apply_color(colors[color_index])
	update_label()
	
func update_label() -> void:
	var c: Color = colors[color_index]
	label.text = "Current Color: #"+c.to_html(false)
