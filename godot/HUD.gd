extends HBoxContainer

func _ready():
	pass

onready var score = $ScoreCount
onready var highscore = $HighscoreCount

func update_score(_score):
	score.text = str(_score)

func update_highscore(_score):
	highscore.text = str(_score)