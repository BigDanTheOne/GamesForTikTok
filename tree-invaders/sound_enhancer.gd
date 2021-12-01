extends AudioStreamPlayer2D


export (float, 0.1, 4) var minimum_random_pitch = 1.0
export (float, 0.1, 4) var maximum_random_pitch = 1.0


func _ready():       _enhance_sound()
func _on_finished(): _enhance_sound()


func _enhance_sound():
	randomize()
	pitch_scale = rand_range(minimum_random_pitch, maximum_random_pitch)
