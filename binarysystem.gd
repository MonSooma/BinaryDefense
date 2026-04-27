extends Node2D

var bit1 = 0
var bit2 = 0
var bit3 = 0
var bit4 = 0
var bit5 = 0
var bit6 = 0
var bit7 = 0
var bit8 = 0

@onready var gameplay = get_parent()

var codenumber = 0

signal enter_pressed(codenumber)

# Called when the node enters the scene tree for the first time.
func _ready():
	gameplay.resetbits.connect(resettingbits)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	$Button1/Label.text = str(bit1)
	$Button2/Label.text = str(bit2)
	$Button3/Label.text = str(bit3)
	$Button4/Label.text = str(bit4)
	$Button5/Label.text = str(bit5)
	$Button6/Label.text = str(bit6)
	$Button7/Label.text = str(bit7)
	$Button8/Label.text = str(bit8)
	$Disp.text = str((bit1*128)+(bit2*64)+(bit3*32)+(bit4*16)+(bit5*8)+(bit6*4)+(bit7*2)+(bit8))
	
	if Input.is_action_just_pressed("bit1"):
		_on_button_1_pressed()
	if Input.is_action_just_pressed("bit2"):
		_on_button_2_pressed()
	if Input.is_action_just_pressed("bit3"):
		_on_button_3_pressed()
	if Input.is_action_just_pressed("bit4"):
		_on_button_4_pressed()
	if Input.is_action_just_pressed("bit5"):
		_on_button_5_pressed()
	if Input.is_action_just_pressed("bit6"):
		_on_button_6_pressed()
	if Input.is_action_just_pressed("bit7"):
		_on_button_7_pressed()
	if Input.is_action_just_pressed("bit8"):
		_on_button_8_pressed()
	
	if Input.is_action_just_pressed("enter"):
		_on_enter_pressed()

func _on_button_1_pressed():
	if bit1 == 0:
		bit1 = 1
	elif bit1 == 1:
		bit1 = 0

func _on_button_2_pressed():
	if bit2 == 0:
		bit2 = 1
	elif bit2 == 1:
		bit2 = 0

func _on_button_3_pressed():
	if bit3 == 0:
		bit3 = 1
	elif bit3 == 1:
		bit3 = 0

func _on_button_4_pressed():
	if bit4 == 0:
		bit4 = 1
	elif bit4 == 1:
		bit4 = 0

func _on_button_5_pressed():
	if bit5 == 0:
		bit5 = 1
	elif bit5 == 1:
		bit5 = 0

func _on_button_6_pressed():
	if bit6 == 0:
		bit6 = 1
	elif bit6 == 1:
		bit6 = 0

func _on_button_7_pressed():
	if bit7 == 0:
		bit7 = 1
	elif bit7 == 1:
		bit7 = 0

func _on_button_8_pressed():
	if bit8 == 0:
		bit8 = 1
	elif bit8 == 1:
		bit8 = 0

func resettingbits():
	bit1 = 0
	bit2 = 0
	bit3 = 0
	bit4 = 0
	bit5 = 0
	bit6 = 0
	bit7 = 0
	bit8 = 0

func _on_enter_pressed():
	codenumber = (bit1*128)+(bit2*64)+(bit3*32)+(bit4*16)+(bit5*8)+(bit6*4)+(bit7*2)+(bit8)
	#print(codenumber) #Debugging til at vise at decimaltallet passer med det binære tal.
	emit_signal("enter_pressed", codenumber)
