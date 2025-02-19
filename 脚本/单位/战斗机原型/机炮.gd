extends Area2D

var 自身阵营
var 敌人列表 = []
@export var 子弹 = load("res://子弹/子弹原型.tscn")
var 目标选择计时器 = 10
var 射击计时器 = 0.5
var 目标距离列表 = []
var 目标距离 = 325
var 敌人距离 : float
var 目标 : Area2D
var 目标方向
var 目标角度
var 当前角度
var 旋转速度 = 2

func _ready() -> void:
	自身阵营 = get_parent().自身阵营

func _process(delta: float) -> void:
	目标选择计时器 -= delta
	射击计时器 -= delta
	if 目标选择计时器 < 0:
		目标选择()
		print(目标)
	
	if 目标 != null:
		转向(delta)
		

func  单位进入(area:Area2D) -> void:
	if area.自身阵营 == 自身阵营:
		pass
	else :
		敌人列表.append(area)
		if 目标选择计时器 < 0:
			目标选择()
			print(目标)

func  单位离开(area:Area2D) -> void:
	if area.自身阵营 == 自身阵营:
		pass
	else :
		敌人列表.erase(area)

func  目标选择() -> void:
	for 敌人 in 敌人列表:
		敌人距离 =  global_position.distance_to(敌人.global_position)
		if 敌人距离 < 目标距离:
			目标距离 = 敌人距离
			目标 = 敌人
	目标选择计时器 = 10
	目标距离 = 325

func 转向(delta: float) -> void:
	目标方向 = (目标.global_position - get_parent().global_position).normalized()
	目标角度 = 目标方向.angle() + PI / 2
	当前角度 = get_parent().rotation
	get_parent().rotation = lerp_angle(当前角度, 目标角度, 旋转速度 * delta)
