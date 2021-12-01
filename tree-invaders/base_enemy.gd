extends Node2D

var randomizer = RandomNumberGenerator.new()
export var minimum_position_x : int =   50
export var maximum_position_x : int =  550
export var minimum_position_y : int = - 50
export var maximum_position_y : int = -200
onready var player_laser_cost = \
		get_tree().get_nodes_in_group("players")[0].get_laser_cost()

func _ready():
	randomizer.randomize()
	self.position = Vector2(
		randomizer.randi_range(minimum_position_x, maximum_position_x),
		randomizer.randi_range(minimum_position_y, maximum_position_y)
	)

func _process(_delta):
	if GameManager.is_game_over():
		faint(0)


export var explosion : PackedScene
export var explosion_audio : PackedScene

func faint(score_to_add):
	GameManager.add_score(score_to_add)
	var explosion_instance
	if SaveSettings.game_settings["particle_effects"]["explosions"] == true:
		explosion_instance = explosion.instance()
	else:
		explosion_instance = explosion_audio.instance()
	get_parent().add_child( explosion_instance )
	explosion_instance.position = self.position
	GameManager.enemy_death_effects()
	queue_free()


export var base_speed : int = 100
var speed : int
var score_to_give = 1
